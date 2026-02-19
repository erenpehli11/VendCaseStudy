using Firebase.Auth;
using Firebase.Auth.Providers;
using Newtonsoft.Json;
using VendCaseStudy.Models;
using VendCaseStudy.Services.Interfaces;

namespace VendCaseStudy.Services
{
    public class AuthService : IAuthService
    {
        private readonly FirebaseAuthClient _authClient;
        private readonly IErrorHandler _errorHandler; 

        public AuthService(IErrorHandler errorHandler)
        {
            _errorHandler = errorHandler;

            var config = new FirebaseAuthConfig
            {
                ApiKey = AppConfig.ApiKey,
                AuthDomain = AppConfig.AuthDomain,
                Providers = new FirebaseAuthProvider[]
                {
                    new EmailProvider(),
                    new GoogleProvider()
                }
            };

            _authClient = new FirebaseAuthClient(config);
        }

        // 1. REGISTER
        public async Task<ServiceResponse<bool>> RegisterAsync(string email, string password)
        {
            try
            {
                var userCredential = await _authClient.CreateUserWithEmailAndPasswordAsync(email, password);

                var token = await userCredential.User.GetIdTokenAsync(forceRefresh: true);

                await SecureStorage.SetAsync(AppConfig.AuthTokenKey, token);

                if (!string.IsNullOrEmpty(userCredential.User.Info.Email))
                {
                    await SecureStorage.SetAsync(AppConfig.UserEmailKey, userCredential.User.Info.Email);
                }

                
                return new ServiceResponse<bool>
                {
                    IsSuccess = true,
                    Message = "Kayıt başarılı!",
                    Data = true
                };
            }
            catch (Exception ex)
            {
                return await _errorHandler.HandleErrorAsync<bool>(ex);
            }
        }

        // 2. LOGIN
        public async Task<ServiceResponse<string>> LoginAsync(string email, string password)
        {
            try
            {
                var userCredential = await _authClient.SignInWithEmailAndPasswordAsync(email, password);

                var token = await userCredential.User.GetIdTokenAsync(forceRefresh: true);

                await SecureStorage.SetAsync(AppConfig.AuthTokenKey, token);

                if (!string.IsNullOrEmpty(userCredential.User.Info.Email))
                {
                    await SecureStorage.SetAsync(AppConfig.UserEmailKey, userCredential.User.Info.Email);
                }

                return new ServiceResponse<string>
                {
                    IsSuccess = true,
                    Data = token,
                    Message = "Giriş başarılı."
                };
            }
            catch (Exception ex)
            {
                return await _errorHandler.HandleErrorAsync<string>(ex);
            }
        }

        public async Task<ServiceResponse<string>> LoginWithGoogleAsync(string idToken)
        {
            try
            {

                var credential = GoogleProvider.GetCredential(idToken, Firebase.Auth.Providers.OAuthCredentialTokenType.IdToken);

                var userCredential = await _authClient.SignInWithCredentialAsync(credential);
                 
                var token = await userCredential.User.GetIdTokenAsync(forceRefresh: true);

                await SecureStorage.SetAsync(AppConfig.AuthTokenKey, token);

                if (!string.IsNullOrEmpty(userCredential.User.Info.Email))
                {
                    await SecureStorage.SetAsync(AppConfig.UserEmailKey, userCredential.User.Info.Email);
                }

                return new ServiceResponse<string>
                {
                    IsSuccess = true,
                    Data = token,
                    Message = "Google ile giriş başarılı."
                };
            }
            catch (Exception ex)
            {
                return await _errorHandler.HandleErrorAsync<string>(ex);
            }
        }

        

        // 5. LOGOUT & CHECK
        public void Logout()
        {
            if (_authClient.User != null)
            {
                _authClient.SignOut();
            }

            SecureStorage.Remove(AppConfig.AuthTokenKey);
            SecureStorage.Remove(AppConfig.UserEmailKey);
        }

        public async Task<bool> IsUserLoggedInAsync()
        {
            var token = await SecureStorage.GetAsync(AppConfig.AuthTokenKey);
            return !string.IsNullOrEmpty(token);
        }
    }
}