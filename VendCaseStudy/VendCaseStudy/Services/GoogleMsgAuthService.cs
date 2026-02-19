using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Google.Apis.Auth.OAuth2;

namespace VendCaseStudy.Services
{
    public class GoogleMsgAuthService
    {
        public async Task<string> GetAccessTokenAsync()
        {
            using var stream = await FileSystem.OpenAppPackageFileAsync("service-account.json");
            var credential = GoogleCredential.FromStream(stream)
                .CreateScoped("https://www.googleapis.com/auth/firebase.messaging");

            var token = await credential.UnderlyingCredential.GetAccessTokenForRequestAsync();
            return token;
        }
    }
}
