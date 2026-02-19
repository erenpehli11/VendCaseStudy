using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VendCaseStudy.Services.Interfaces
{
    public interface INotificationService
    {
        Task<bool> SendNotificationAsync(string title, string body, string target);
    }
}
