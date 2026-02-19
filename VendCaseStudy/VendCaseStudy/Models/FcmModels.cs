using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VendCaseStudy.Models
{
    public class FcmMessageModel
    {
        public MessageContent message { get; set; }
    }

    public class MessageContent
    {
        public string token { get; set; } // Hedef cihaz token'ı
        public NotificationContent notification { get; set; }
    }

    public class NotificationContent
    {
        public string title { get; set; }
        public string body { get; set; }
    }
}