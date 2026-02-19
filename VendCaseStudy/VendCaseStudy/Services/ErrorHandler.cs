using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VendCaseStudy.Models;
using VendCaseStudy.Services.Interfaces;

namespace VendCaseStudy.Services
{
    public class ErrorHandler : IErrorHandler
    {
        private readonly ILogService _logger;

        public ErrorHandler(ILogService logger)
        {
            _logger = logger;
        }

        public async Task<ServiceResponse<T>> HandleErrorAsync<T>(Exception ex, string customMessage = null)
        {
            // 1. Teknik detayı dosyaya yaz (Kullanıcı görmesin)
            await _logger.LogExceptionAsync(ex);

            // 2. Kullanıcıya gösterilecek mesajı belirle
            string userMessage = GetUserFriendlyMessage(ex);

            // Eğer özel bir mesaj parametresi geldiyse onu da kullanabiliriz
            if (!string.IsNullOrEmpty(customMessage))
            {
                userMessage = customMessage;
            }

            return new ServiceResponse<T>
            {
                IsSuccess = false,
                Message = userMessage
            };
        }

        private string GetUserFriendlyMessage(Exception ex)
        {
            var msg = ex.Message;

            // Firebase ve Genel Hatalar
            if (msg.Contains("INVALID_LOGIN_CREDENTIALS")) return "E-posta veya şifre hatalı.";
            if (msg.Contains("EMAIL_NOT_FOUND")) return "Böyle bir kullanıcı bulunamadı.";
            if (msg.Contains("INVALID_PASSWORD")) return "Şifre hatalı.";
            if (msg.Contains("EMAIL_EXISTS")) return "Bu e-posta zaten kullanımda.";
            if (msg.Contains("WEAK_PASSWORD")) return "Şifre çok basit, daha güçlü bir şifre seçin.";
            if (msg.Contains("USER_DISABLED")) return "Hesap erişime kapatılmış.";
            if (msg.Contains("TOO_MANY_REQUESTS")) return "Çok fazla deneme yaptınız. Biraz bekleyin.";
            if (msg.Contains("network")) return "İnternet bağlantınızı kontrol edin.";

            // Hiçbiri değilse, kullanıcıya teknik detay VERME.
            return "Bir hata oluştu, lütfen daha sonra tekrar deneyin.";
        }
    }
}
