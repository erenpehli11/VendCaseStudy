using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VendCaseStudy.Models;

namespace VendCaseStudy.Services.Interfaces
{
    public interface IErrorHandler
    {
        Task<ServiceResponse<T>> HandleErrorAsync<T>(Exception ex, string customMessage = null);
    }
}
