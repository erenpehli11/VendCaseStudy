using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VendCaseStudy.Models;

namespace VendCaseStudy.Services.Interfaces
{
    public interface IAuthService
    {
        // Email/Password İşlemleri
        Task<ServiceResponse<bool>> RegisterAsync(string email, string password);
        Task<ServiceResponse<string>> LoginAsync(string email, string password);

  

        // Oturum Yönetimi
        void Logout();
        Task<bool> IsUserLoggedInAsync();

        Task<ServiceResponse<string>> LoginWithGoogleAsync(string idToken);
    }
}
