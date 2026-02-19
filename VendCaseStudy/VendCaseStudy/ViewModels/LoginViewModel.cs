using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using VendCaseStudy.Services.Interfaces;
using VendCaseStudy.Views;
using VendCaseStudy.Views.Auth;

namespace VendCaseStudy.ViewModels
{
    public partial class LoginViewModel : BaseViewModel
    {
        private readonly IAuthService _authService;
        private readonly IGoogleAuthService _googleAuthService;

        [ObservableProperty]
        private string _email;

        [ObservableProperty]
        private string _password;

        public LoginViewModel(IAuthService authService, IGoogleAuthService googleAuthService)
        {
            _authService = authService;
            _googleAuthService = googleAuthService;
            Title = "Giriş Yap";
        }

        [RelayCommand]
        private async Task LoginAsync()
        {
            if (IsBusy) return;

            // Validasyon
            // DİKKAT: _email yerine Email kullanıyoruz (Generated Property)
            if (string.IsNullOrWhiteSpace(Email) || string.IsNullOrWhiteSpace(Password))
            {
                await Shell.Current.DisplayAlert("Hata", "Lütfen tüm alanları doldurunuz.", "Tamam");
                return;
            }

            try
            {
                IsBusy = true;

                // Servis artık hata fırlatmaz, cevabı paketleyip döner.
                var response = await _authService.LoginAsync(Email, Password);

                if (response.IsSuccess)
                {
                    await Shell.Current.GoToAsync($"//{nameof(DashboardPage)}");
                }
                else
                {
                    // ErrorHandler'dan gelen temiz mesajı gösteriyoruz
                    await Shell.Current.DisplayAlert("Giriş Başarısız", response.Message, "Tamam");
                }
            }
            finally
            {
                IsBusy = false;
            }
        }

        [RelayCommand]
        private async Task LoginWithGoogleAsync()
        {
            if (IsBusy) return;

            try
            {
                IsBusy = true;

                var idToken = await _googleAuthService.GetGoogleIdTokenAsync();

                if (string.IsNullOrEmpty(idToken))
                {
                    return;
                }

                var response = await _authService.LoginWithGoogleAsync(idToken);

                if (response.IsSuccess)
                {
                    await Shell.Current.GoToAsync($"//{nameof(Views.DashboardPage)}");
                }
                else
                {
                    await Shell.Current.DisplayAlert("Hata", response.Message, "Tamam");
                }
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Hata", "Beklenmedik bir hata oluştu.", "Tamam");
            }
            finally
            {
                IsBusy = false;
            }
        }

        [RelayCommand]
        private async Task GoToRegisterAsync()
        {
            await Shell.Current.GoToAsync(nameof(RegisterPage));
        }
    }
}