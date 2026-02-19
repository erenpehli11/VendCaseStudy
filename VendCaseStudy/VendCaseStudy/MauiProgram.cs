using Microsoft.Extensions.Logging;
using CommunityToolkit.Maui;
using VendCaseStudy.Services.Interfaces;
using VendCaseStudy.Services;
using VendCaseStudy.ViewModels;
using VendCaseStudy.Views.Auth;
using VendCaseStudy.Views;

namespace VendCaseStudy
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder.UseMauiApp<App>().ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            }).UseMauiCommunityToolkit();


            //Services
            builder.Services.AddSingleton<IAuthService, AuthService>();
            builder.Services.AddSingleton<ILogService, LogService>();   
            builder.Services.AddSingleton<IErrorHandler, ErrorHandler>();
            builder.Services.AddHttpClient<INotificationService, NotificationService>();
            builder.Services.AddSingleton<GoogleMsgAuthService>();
#if ANDROID
builder.Services.AddSingleton<VendCaseStudy.Services.Interfaces.IGoogleAuthService, VendCaseStudy.Platforms.Android.AndroidGoogleAuthService>();
builder.Services.AddSingleton<IFcmService, VendCaseStudy.Platforms.Android.FcmService>();
#endif

            // ViewModels
            builder.Services.AddTransient<LoginViewModel>();
            builder.Services.AddTransient<RegisterViewModel>();
            builder.Services.AddTransient<DashboardViewModel>();

            // Pages
            builder.Services.AddTransient<LoginPage>();
            builder.Services.AddTransient<RegisterPage>();
            builder.Services.AddTransient<DashboardPage>();
#if DEBUG
            builder.Logging.AddDebug();
#endif
            return builder.Build();
        }
    }
}