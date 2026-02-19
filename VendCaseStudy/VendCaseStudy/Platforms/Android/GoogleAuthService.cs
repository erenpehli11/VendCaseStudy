using Android.Content;
using Android.Gms.Auth.Api.SignIn;
using VendCaseStudy.Services.Interfaces;

namespace VendCaseStudy.Platforms.Android
{
    public class AndroidGoogleAuthService : IGoogleAuthService
    {
        public static TaskCompletionSource<string?> LoginTaskSource;
        public static int GoogleSignInId = 1001;

        public async Task<string?> GetGoogleIdTokenAsync()
        {
            LoginTaskSource = new TaskCompletionSource<string?>();

            // Google Giriş Seçenekleri
            var gso = new GoogleSignInOptions.Builder(GoogleSignInOptions.DefaultSignIn)
                .RequestIdToken("850153562897-04vq9096556m9hvel9t8imh5scashnqk.apps.googleusercontent.com")
                .RequestEmail()
                .Build();

            var googleSignInClient = GoogleSignIn.GetClient(Platform.CurrentActivity, gso);

            googleSignInClient.SignOut();

            var intent = googleSignInClient.SignInIntent;
            Platform.CurrentActivity.StartActivityForResult(intent, GoogleSignInId);

            return await LoginTaskSource.Task;
        }
    }
}