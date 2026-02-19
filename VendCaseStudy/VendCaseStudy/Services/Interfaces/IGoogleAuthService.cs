using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VendCaseStudy.Services.Interfaces
{
    public interface IGoogleAuthService
    {
        Task<string?> GetGoogleIdTokenAsync();
    }
}
