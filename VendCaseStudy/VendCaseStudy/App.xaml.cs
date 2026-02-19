using VendCaseStudy.Services.Interfaces;
using VendCaseStudy.Views;

namespace VendCaseStudy
{
    public partial class App : Application
    {
        private readonly IAuthService _authService;

        public App(IAuthService authService)
        {
            InitializeComponent();

            _authService = authService;

            MainPage = new AppShell();
        }

        // Uygulama penceresi oluşturulduğunda çalışır
        protected override Window CreateWindow(IActivationState activationState)
        {
            var window = base.CreateWindow(activationState);

            // Pencere açılır açılmaz kontrol et
            window.Created += async (s, e) =>
            {
                await CheckLoginStatusAsync();
            };

            return window;
        }

        private async Task CheckLoginStatusAsync()
        {
            // Token var mı?
            bool isLoggedIn = await _authService.IsUserLoggedInAsync();

            if (isLoggedIn)
            {
                await Shell.Current.GoToAsync($"//{nameof(DashboardPage)}");
            }
        }
    }
}