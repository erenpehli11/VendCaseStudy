using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using VendCaseStudy.Services.Interfaces;
using VendCaseStudy.Views.Auth;

namespace VendCaseStudy.ViewModels
{
    public partial class DashboardViewModel : BaseViewModel
    {
        private readonly IAuthService _authService;
        private readonly IFcmService _fcmService;
        private readonly INotificationService _notificationService;
        [ObservableProperty] string currentDeviceToken; 
        [ObservableProperty] string notifyTitle;
        [ObservableProperty] string notifyBody;
        [ObservableProperty] string targetToken;
        [ObservableProperty] bool isTopicSelected;
        [ObservableProperty] string manualToken;

        public string FinalTarget => IsTopicSelected ? "/topics/all" : ManualToken;

        public DashboardViewModel(IAuthService authService, IFcmService fcmService, INotificationService notificationService)
        {
            _authService = authService;
            _fcmService = fcmService;
            _notificationService = notificationService;
            Task.Run(async () => await LoadDeviceToken());
            Title = "Ana Sayfa";
        }
        private async Task LoadDeviceToken()
        {
            CurrentDeviceToken = await _fcmService.GetFcmTokenAsync();
        }

        [RelayCommand]
        private async Task SendNotification()
        {
            if (!IsTopicSelected && string.IsNullOrWhiteSpace(ManualToken) || string.IsNullOrWhiteSpace(NotifyTitle))
            {
                await Shell.Current.DisplayAlert("Hata", "Lütfen hedef token ve başlık alanlarını doldurun.", "Tamam");
                return;
            }

            IsBusy = true;
            var success = await _notificationService.SendNotificationAsync(NotifyTitle, NotifyBody, FinalTarget);
            IsBusy = false;

            if (success)
                await Shell.Current.DisplayAlert("Başarılı", "Bildirim v1 API üzerinden başarıyla gönderildi!", "Tamam");
            else
                await Shell.Current.DisplayAlert("Hata", "Gönderim başarısız. API ayarlarını kontrol edin.", "Tamam");
        }

        [RelayCommand]
        async Task LogoutAsync()
        {
            bool answer = await Shell.Current.DisplayAlert("Çıkış", "Oturumu kapatmak istediğinize emin misiniz?", "Evet", "Hayır");

            if (answer)
            {
                _authService.Logout();

                await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
            }
        }
        [RelayCommand]
        private async Task CopyToken()
        {
            if (!string.IsNullOrWhiteSpace(CurrentDeviceToken))
            {
                await Clipboard.Default.SetTextAsync(CurrentDeviceToken);
     
            }
        }
    }
}