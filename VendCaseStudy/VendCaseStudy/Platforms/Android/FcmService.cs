using Android.Gms.Extensions;
using Firebase.Messaging;
using VendCaseStudy.Services.Interfaces;

namespace VendCaseStudy.Platforms.Android
{
    public class FcmService : IFcmService
    {
        public async Task<string> GetFcmTokenAsync()
        {
            var token = await FirebaseMessaging.Instance.GetToken();
            await FirebaseMessaging.Instance.SubscribeToTopic("all");
            return token.ToString();
        }
    }

}

