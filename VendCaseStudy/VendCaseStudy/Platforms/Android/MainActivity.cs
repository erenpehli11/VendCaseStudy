using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.Gms.Auth.Api.SignIn;
using Android.OS;
using VendCaseStudy.Platforms.Android;

namespace VendCaseStudy;

[Activity(Theme = "@style/Maui.SplashTheme", MainLauncher = true, ScreenOrientation = ScreenOrientation.Portrait, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode | ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize | ConfigChanges.Density )]
public class MainActivity : MauiAppCompatActivity
{
    protected override void OnActivityResult(int requestCode, Result resultCode, Intent data)
    {
        base.OnActivityResult(requestCode, resultCode, data);

        if (requestCode == AndroidGoogleAuthService.GoogleSignInId)
        {
            var task = GoogleSignIn.GetSignedInAccountFromIntent(data);
            try
            {
                var account = task.Result as GoogleSignInAccount;
                // Başarılı ise ID Token'ı Task'e gönder
                AndroidGoogleAuthService.LoginTaskSource?.SetResult(account?.IdToken);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"FCM_DEBUG: Kritik Hata: {ex}");
                AndroidGoogleAuthService.LoginTaskSource?.SetResult(null);
            }
        }
    }
    protected override void OnCreate(Bundle savedInstanceState)
    {
        base.OnCreate(savedInstanceState);
        CreateNotificationChannel();
        RequestNotificationPermission();
    }

    void CreateNotificationChannel()
    {
        if (Build.VERSION.SdkInt >= BuildVersionCodes.O)
        {
            var channel = new NotificationChannel("fcm_v1_channel", "Bildirimler", NotificationImportance.High);
            var manager = (NotificationManager)GetSystemService(NotificationService);
            manager.CreateNotificationChannel(channel);
        }
    }

    void RequestNotificationPermission()
    {
        if (Build.VERSION.SdkInt >= BuildVersionCodes.Tiramisu)
        {
            if (CheckSelfPermission(Android.Manifest.Permission.PostNotifications) != Android.Content.PM.Permission.Granted)
                RequestPermissions(new string[] { Android.Manifest.Permission.PostNotifications }, 0);
        }
    }
}