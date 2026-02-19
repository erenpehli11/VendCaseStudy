# 📱 VendCS - MAUI Mobil Uygulama (Case Study)

Bu proje, .NET MAUI kullanılarak geliştirilmiş modern, kullanıcı dostu ve Firebase entegrasyonuna sahip bir mobil uygulama prototipidir. Kullanıcı kimlik doğrulama (Authentication) ve Firebase Cloud Messaging (FCM) ile anlık bildirim gönderme/alma özelliklerini barındırmaktadır.

## 🚀 1. Firebase Kurulumu ve Konfigürasyonu

Uygulamanın bildirim ve kimlik doğrulama altyapısı Firebase üzerine inşa edilmiştir. Android platformu için kurulum şu adımlarla gerçekleştirilmiştir:

* **Firebase Projesi:** Firebase konsolunda yeni bir proje oluşturulmuş ve Android uygulaması (`com.vend.vendcasestudy`) projeye kaydedilmiştir.
* **Yapılandırma Dosyası:** Firebase'den alınan `google-services.json` dosyası, uygulamanın `Platforms/Android/` dizinine eklenmiş ve derleme eylemi (Build Action) `GoogleServicesJson` olarak ayarlanmıştır.
* **Servis Entegrasyonu:** `MyFirebaseMessagingService.cs` sınıfı oluşturularak cihazın FCM'ye kaydolması ve arka planda/ön planda gelen bildirimleri dinlemesi (Receiver) sağlanmıştır.
* **Manifest Ayarları:** `AndroidManifest.xml` içerisinde gerekli internet, bildirim (POST_NOTIFICATIONS) ve Firebase servis izinleri tanımlanmıştır.

## 🔐 2. Authentication (Kimlik Doğrulama) Akışı

Uygulamada kullanıcı güvenliği ve giriş işlemleri için MVVM mimarisine uygun iki farklı yöntem sunulmuştur:

* **E-posta & Şifre ile Giriş/Kayıt:** `LoginViewModel` ve `RegisterViewModel` üzerinden kullanıcıdan alınan veriler doğrulanır. Şifre gizleme/gösterme (Toggle) ve şifre eşleşme doğrulama kuralları (Validation) UI tarafında anlık olarak işlenir.
* **Google ile Giriş (OAuth):** `GoogleAuthService` (Android platformuna özel) kullanılarak kullanıcıların tek tıkla Google hesapları üzerinden sisteme dahil olması sağlanmıştır. Başarılı giriş sonrası kullanıcı `DashboardPage` ekranına yönlendirilir.

## 📡 3. Bildirim Gönderme Mantığı (Topic / Token)

`DashboardPage` üzerinden uygulama yöneticisi/kullanıcısı, diğer cihazlara iki farklı strateji ile anlık bildirim gönderebilir:

* **Token Bazlı Bildirim (Tekil Cihaz):** Her cihaz uygulamayı kurduğunda Firebase benzersiz bir `FCM Token` üretir. Uygulama, kullanıcının kendi token'ını ekranda gösterir ve kopyalamasına izin verir. Gönderim formunda "Manuel Token" girilerek spesifik olarak sadece bir cihaza bildirim atılabilir.
* **Topic (Konu) Bazlı Bildirim (Çoklu Yayın - Broadcast):** Firebase'in `/topics/all` (veya benzeri) abonelik mantığı kullanılmıştır. Form üzerindeki "Genel Kanala Duyur" (All Topics) CheckBox'ı işaretlendiğinde, bu konuya abone olmuş tüm cihazlara aynı anda bildirim (Push Notification) iletilir.
* **Görsel İşleyiş:** Bildirim cihazda sistem tepsisinde (System Tray) uygulamanın özel beyaz işlemci logosu (`splash.svg` temelli icon) ve VendCS kurumsal mavi rengiyle görüntülenir.

## 📦 4. Kullanılan Paketler (NuGet)

Projenin altyapısını sağlamlaştırmak için aşağıdaki temel paketler kullanılmıştır:

* `Microsoft.Maui.Controls` (v9.0+): Temel MAUI UI ve bileşen altyapısı.
* `Xamarin.Firebase.Messaging`: Android tarafında FCM bildirimlerini yakalamak ve işlemek için.
* `Xamarin.GooglePlayServices.Auth`: Google ile giriş (Sign-In) entegrasyonu için.
* `CommunityToolkit.Mvvm`: `[ObservableProperty]`, `[RelayCommand]` gibi modern MVVM pratiklerini uygulayarak arka plan kodlarını (Boilerplate) azaltmak için.
* `Newtonsoft.Json`: Bildirim gönderimlerinde HTTP REST API isteklerini (JSON formatında) serileştirmek için.

## 🛠️ 5. Bilinen Eksikler ve Yapılabilecek İyileştirmeler

Bu proje bir "Case Study" (Örnek Çalışma) olarak belirli bir kapsama odaklanmıştır. Gerçek bir canlı (Production) ortamı için aşağıdaki iyileştirmeler planlanabilir:

* **Backend (API) İzolasyonu:** Şu an bildirim gönderme işlemi güvenlik gereği (Case Study esnekliğiyle) doğrudan istemci üzerinden yapılıyor olabilir. Canlı ortamda Firebase FCM yetkileri (Server Key / Service Account) bir .NET Core Web API arasına alınmalı, mobil uygulama sadece API'ye istek atmalıdır.
* **iOS Uyumluluğu:** Proje şu anda Android (Material UI, AndroidManifest, services) odaklı konfigüre edilmiştir. iOS için `GoogleService-Info.plist` eklenmesi ve Apple Push Notification service (APNs) sertifikalarının Firebase'e tanıtılması gerekmektedir.
* **Google Credential Manager Geçişi:** Android API 34+ standartlarına tam uyum sağlamak için mevcut `GoogleSignIn` altyapısının yakında zorunlu hale gelecek olan `Credential Manager API` ile güncellenmesi gerekmektedir.
* **Bildirim Tıklama Eylemleri (Click Actions):** Gelen bildirime tıklandığında uygulamanın belirli bir sayfasına (Deep Linking) veya detay ekranına yönlendirme yapacak `Intent` mantığı genişletilebilir.

---
*Geliştirici Notu: Bu arayüz ve mimari, modern kullanıcı deneyimi (UX) standartlarına ve ölçeklenebilir MVVM dizayn paternlerine sadık kalınarak tasarlanmıştır.*
