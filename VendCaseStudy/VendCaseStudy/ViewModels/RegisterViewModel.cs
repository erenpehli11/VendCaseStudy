using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using VendCaseStudy.Services.Interfaces;

namespace VendCaseStudy.ViewModels
{
    public partial class RegisterViewModel : BaseViewModel
    {
        private readonly IAuthService _authService;

        [ObservableProperty]
        private string _email;

        [ObservableProperty]
        private string _password;

        [ObservableProperty]
        private string _confirmPassword;

        [ObservableProperty]         
        bool isPasswordHidden = true;

        public string PasswordToggleText => IsPasswordHidden ? "👁️" : "🕶️";

        public Color ValidationColor => (Password == ConfirmPassword && !string.IsNullOrEmpty(ConfirmPassword))
                                    ? Colors.Green : Colors.Red;

        public string ValidationStatusText
        {
            get
            {
                if (string.IsNullOrEmpty(ConfirmPassword)) return "";
                return Password == ConfirmPassword ? "✔" : "✘";
            }
        }

        public RegisterViewModel(IAuthService authService)
        {
            _authService = authService;
            Title = "Kayıt Ol";
        }


        [RelayCommand]
        private void TogglePassword()
        {
            IsPasswordHidden = !IsPasswordHidden;
            // UI'daki PasswordToggleText'in yenilenmesini tetikler
            OnPropertyChanged(nameof(PasswordToggleText));
        }

        partial void OnPasswordChanged(string value) => UpdateValidationStates();
        partial void OnConfirmPasswordChanged(string value) => UpdateValidationStates();

        private void UpdateValidationStates()
        {
            OnPropertyChanged(nameof(ValidationStatusText));
            OnPropertyChanged(nameof(ValidationColor));
        }

        [RelayCommand]
        async Task RegisterAsync()
        {
            if (IsBusy) return;

            // 1. Validasyonlar
            if (string.IsNullOrWhiteSpace(Email) || string.IsNullOrWhiteSpace(Password) || string.IsNullOrWhiteSpace(ConfirmPassword))
            {
                await Shell.Current.DisplayAlert("Hata", "Lütfen tüm alanları doldurunuz.", "Tamam");
                return;
            }

            if (Password != ConfirmPassword)
            {
                await Shell.Current.DisplayAlert("Hata", "Şifreler uyuşmuyor!", "Tamam");
                return;
            }

            if (Password.Length < 6)
            {
                await Shell.Current.DisplayAlert("Hata", "Şifre en az 6 karakter olmalıdır.", "Tamam");
                return;
            }

            try
            {
                IsBusy = true;

                var response = await _authService.RegisterAsync(Email, Password);

                if (response.IsSuccess)
                {
                    await Shell.Current.DisplayAlert("Başarılı", response.Message, "Tamam");

                    await Shell.Current.GoToAsync($"//{nameof(Views.DashboardPage)}");
                }
                else
                {
                    await Shell.Current.DisplayAlert("Kayıt Başarısız", response.Message, "Tamam");
                }
            }
            finally
            {
                IsBusy = false;
            }
        }

        [RelayCommand]
        async Task GoBackAsync()
        {
            await Shell.Current.GoToAsync("..");
        }
    }
}