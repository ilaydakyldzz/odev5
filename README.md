# Makyaj Dünyası - Ürün Katalog ve Sepet Uygulaması

Bu proje, Mobil Programlama dersi kapsamında Flutter ile geliştirilmiştir. Dinamik rotalama, sepet yönetimi, state paylaşımı ve özel animasyonlar içeren bir e-ticaret vitrin simülasyonudur.

## 🚀 Projeyi Çalıştırma

Projeyi yerel ortamınızda çalıştırmak için terminalde şu komutları sırasıyla uygulayın:

1.  Gerekli kütüphaneleri yükleyin:
    ```bash
    flutter pub get
    ```
2.  Uygulamayı başlatın:
    ```bash
    flutter run
    ```

## 📱 Desteklenen Rotalar ve Özellikler

Uygulama **Named Routes** ve **Advanced Routing** (Gelişmiş Rotalama) tekniklerini kullanır:

* **`/` (Ana Sayfa):** Ürünlerin listelendiği grid ekranı. Ürüne tıklandığında detay sayfasına yönlendirir ve geri dönüşte "Sepete Eklendi" bilgisini dinler.
* **`/detail`:** Ürün detay sayfası. Argüman olarak `Product` nesnesi alır.
* **`/cart`:** Sepetim sayfası. Eklenen ürünleri listeler ve listeden çıkarma imkanı sunar.
* **`/product/{id}`:** Dinamik Rota (Deep Link Simülasyonu). Örneğin `/product/42` adresine gidildiğinde, 42 ID'li ürünü bulup detay sayfasını açar.
* **404 Not Found:** Tanımlı olmayan bir rotaya (örn: `/test`) gidildiğinde özel hata sayfası gösterilir.

## 🛠 Mimari Yaklaşım

Projede temiz kod prensiplerine uygun, modüler bir yapı tercih edilmiştir:

1.  **Navigasyon ve Veri İletişimi:**
    * `Navigator.pushNamed` ile sayfalar arası geçiş yapılır.
    * **Geriye Değer Döndürme:** Detay sayfasından `Navigator.pop(context, 'mesaj')` ile ana sayfaya veri taşınır ve kullanıcıya `SnackBar` ile bildirim gösterilir.
    * `onGenerateRoute` ile URL tabanlı dinamik yönlendirme sağlanmıştır.

2.  **State Yönetimi:**
    * Sepet verisi (`cartItems`), `product_model.dart` içinde global bir liste olarak tutularak basit ve etkili bir state yönetimi sağlanmıştır.

3.  **UI/UX:**
    * **Hero Animation:** Liste ve detay sayfası arasındaki resim geçişlerinde görsel süreklilik sağlanmıştır.
    * **Google Fonts:** Modern tipografi kullanılmıştır.
