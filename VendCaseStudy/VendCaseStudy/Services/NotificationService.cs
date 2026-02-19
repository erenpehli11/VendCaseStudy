using VendCaseStudy.Models;
using VendCaseStudy.Services;
using VendCaseStudy.Services.Interfaces;

public class NotificationService : INotificationService
{
    private readonly HttpClient _httpClient;
    private readonly GoogleMsgAuthService _googleAuth;
    private const string ProjectId = "vendcasestudy";

    public NotificationService(HttpClient httpClient, GoogleMsgAuthService googleAuth)
    {
        _httpClient = httpClient;
        _googleAuth = googleAuth;
    }

    public async Task<bool> SendNotificationAsync(string title, string body, string target)
    {
        var accessToken = await _googleAuth.GetAccessTokenAsync();
        var url = $"https://fcm.googleapis.com/v1/projects/{ProjectId}/messages:send";

        var payload = new FcmMessageModel
        {
            message = new MessageContent
            {
                token = target,
                notification = new NotificationContent { title = title, body = body }
            }
        };

        var request = new HttpRequestMessage(HttpMethod.Post, url);
        request.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", accessToken);
        request.Content = new StringContent(System.Text.Json.JsonSerializer.Serialize(payload), System.Text.Encoding.UTF8, "application/json");

        var response = await _httpClient.SendAsync(request);
        return response.IsSuccessStatusCode;
    }
}