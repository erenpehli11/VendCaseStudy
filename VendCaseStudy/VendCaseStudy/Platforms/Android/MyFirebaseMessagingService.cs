using Android.App;
using Android.Content;
using AndroidX.Core.App;
using Firebase.Messaging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VendCaseStudy.Platforms.Android
{
    [Service(Exported = false)]
    [IntentFilter(new[] { "com.google.firebase.MESSAGING_EVENT" })]
    public class MyFirebaseMessagingService : FirebaseMessagingService
    {
        public override void OnMessageReceived(RemoteMessage message)
        {
            var notification = message.GetNotification();
            if (notification != null)
                ShowNotification(notification.Title, notification.Body);
        }

        void ShowNotification(string title, string body)
        {
            // Cihazın mevcut uygulama ikonunu sistemden güvenli bir şekilde çeker
            int iconId = ApplicationContext.ApplicationInfo.Icon;

            var builder = new NotificationCompat.Builder(this, "fcm_v1_channel")
                .SetContentTitle(title)
                .SetContentText(body)
                .SetSmallIcon(iconId) 
                .SetAutoCancel(true);

            NotificationManagerCompat.From(this).Notify(new Random().Next(), builder.Build());
        }
    }
}
