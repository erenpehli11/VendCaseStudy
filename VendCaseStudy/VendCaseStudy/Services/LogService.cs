using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VendCaseStudy.Services.Interfaces;

namespace VendCaseStudy.Services
{
    public class LogService : ILogService
    {
        public async Task LogAsync(string message, string type = "INFO")
        {
            try
            {
                // Dosya Yolu: /data/user/0/com.companyname.../files/app_logs.txt
                string filePath = Path.Combine(FileSystem.Current.AppDataDirectory, "app_logs.txt");

                string logContent = $"[{DateTime.Now:yyyy-MM-dd HH:mm:ss}] [{type}] {message}{Environment.NewLine}";

                await File.AppendAllTextAsync(filePath, logContent);
            }
            catch (Exception)
            {
               
            }
        }

        public async Task LogExceptionAsync(Exception ex)
        {
            await LogAsync($"EXCEPTION: {ex.Message} | STACK: {ex.StackTrace}", "ERROR");
        }
    }
}
