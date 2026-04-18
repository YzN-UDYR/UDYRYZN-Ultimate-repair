# 🚀 UDYRYZN ULTIMATE REPAIR ENGINE v2.8 (MAS Edition)

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue?logo=powershell&style=for-the-badge) ![Platform](https://img.shields.io/badge/Platform-Windows%2010%2F11-0078D6?logo=windows&style=for-the-badge) ![Maintenance](https://img.shields.io/badge/Maintenance-Active-success?style=for-the-badge) ![License](https://img.shields.io/badge/License-MIT-yellow.svg)

**UDYRYZN Ultimate Repair**, Windows sistemlerinizi onarmak, hızlandırmak ve yönetmek için geliştirilmiş kapsamlı ve otonom bir PowerShell aracıdır. Bu son sürüm (**v2.8**), Microsoft Activation Scripts (MAS) entegrasyonu, İnteraktif Güncelleyici ve Instant KeyRead özellikleri ile donanmıştır.

---

## 🌟 Yeni Nesil Özellikler (v2.8)

⚡ **Instant KeyRead (Anında Tepki):** Menülerde seçim yaparken "Enter" tuşuna basmanıza gerek kalmaz. Seçeneğe dokunduğunuz milisaniye içerisinde sistem algılar ve aksiyon alır.

⚡ **İnteraktif Winget Updater:** Uygulamaları körü körüne güncellemez. Karşınıza **[A]ll (Tümü)**, **[M]anual (Seçmeli)** veya **[Q]uit (İptal)** seçeneklerinden oluşan havalı bir arayüz çıkarır.

⚡ **Akıllı Korumalar:** Sistemdeki VPN veya Sanal Ağ kartlarının (VMware gibi) DNS adreslerini bozmaz, Mavi Ekran (BSOD) geçmişini temizlikten muaf tutar.

⚡ **Bölge Bağımsız Güncelleme:** Otomatik sistem güncelleyici, dünyadaki tüm bölgesel ondalık / tarih farklılıklarını aşarak (`[version]` parsing) stabil çalışacak şekilde yeniden yapılandırıldı.

---

## 🛠️ Modüller (Modules)

### 🧹 [1] Fast Clean (Hızlı Temizlik)
Sistemi yormadan derinlemesine bir hızlandırma yapar.
*   ✅ **DNS & IP Reset:** Ağ bağlantısını yeniler (Flush DNS, Release/Renew IP).
*   ✅ **Gelişmiş Önbellek:** Temp, Prefetch, Tarayıcı Çerezleri ve Shader (Ekran Kartı) kalıntılarını siler.
*   ✅ **Disk Optimizasyonu:** SSD'ler için `ReTrim` komutlarını tetikleyerek diskin donanımsal olarak nefes almasını sağlar.

### 🔧 [2] Deep Repair (Derin Onarım)
Sistem dosyalarını ve bileşenlerini derinlemesine onarır.
*   ✅ **SFC & DISM Onarımı:** Bozuk Windows dosyalarını onarır. Sonuçları doğrudan (Örn: ONARILDI [YENİDEN BAŞLAT]) akıllı dille bildirir.
*   ✅ **Tam Güvenli Log Temizliği:** Olay günlüklerini (Event Logs) temizlerken System/App loglarını koruyarak geçmiş hata verilerinizi silinmekten kurtarır.
*   ✅ **CHKDSK Planlama:** Disk hatalarını onarmak için başlangıca tarama planlar.

### 🕵️ [3] PC Expert Mode (Ekspertiz Modu)
İkinci el bilgisayar alırken veya donanım test ederken kullanabileceğiniz gelişmiş araçlar.
*   🔍 **Donanım Dedektifi:** CPU, RAM, GPU ve Disklerin **gerçek** bilgilerini gösterir (Sahte/Fake donanımı ifşa eder).
*   🎨 **Ölü Piksel Testi:** Ekranı farklı renklerle test ederek ölü pikselleri bulmanızı sağlar.
*   ⌨️ **Klavye Testi:** Hangi tuşların çalışıp çalışmadığını anlık gösterir.
*   🔥 **Stress Testi:** CPU'yu 30 saniye boyunca %100 yüke sokarak stabiliteyi test eder.
*   🔋 **Pil Sağlığı & Lisans:** Laptop pil ömrünü ve Windows lisansının türünü (OEM/Retail/KMS) gösterir.
*   🌐 **Ağ Stabilite Testi:** Mükemmel MS ölçümü için Google/Cloudflare sunucularına ping atar.

### 🎮 [4] Gaming Tools (Oyun Araçları)
Oyun performansını artırmak ve eksik bileşenleri tamamlamak için özel araçlar.
*   🎮 **Visual C++ Redistributable (AIO):** 2005'ten günümüze tüm C++ kütüphanelerini tek tıkla kurar.
*   🎮 **DirectX Web Installer:** Eksik DirectX dosyalarını tamamlar.
*   ⚡ **Nihai Performans Modu:** Windows'un gizli "Ultimate Performance" güç planını aktif eder.

### 🌐 [5] Network Tools (Ağ Araçları)
İnternet ve ağ ayarlarını özelleştirir.
*   🌍 **Akıllı DNS Değiştirici:** Tek tıkla **Cloudflare (1.1.1.1)** veya **Google (8.8.8.8)** DNS ayarlar. (Sanal ağları es geçer, VPN bozmaz!)
*   🔄 **Otomatik DNS (DHCP):** Ağ ayarlarını varsayılana döndürür.
*   🧹 **Ağ Önbelleği Sıfırlama:** Winsock ve IP yığınını temelden onarır.

### 🚑 [6] Daily Fixes (Gündelik Çözümler)
Sık karşılaşılan sorunlar için hızlı çözümler.
*   🖨️ **Yazıcı Onarımı:** Yazdırma kuyruğunu temizler ve servisi yeniden başlatır.
*   🛒 **Microsoft Store Reset:** Çalışmayan Windows Mağaza'yı onarır.
*   🔑 **Wi-Fi Şifre Gösterici:** Kayıtlı tüm Wi-Fi şifrelerini anında listeler.

### 🔑 [9] Microsoft Activation (MAS)
Sisteme **Microsoft Activation Scripts (MAS) v2.5** entegre edilmiştir.
*   ✅ **Windows & Office Etkinleştirme:** HWID/KMS38/Online KMS yöntemleri ile kalıcı lisans sağlar.

---

## 📥 KURULUM VE KULLANIM (HOW TO USE)

Bu bir kurulum gerektirmez! Sadece dosyayı indirin ve çalıştırın.

1.  **İndirin:** `UDYRYZN_ULTIMATE_REPAIR.ps1` dosyasını masaüstüne indirin.
2.  **Sağ Tık:** Dosyaya sağ tıklayın.
3.  **Çalıştır:** `PowerShell ile Çalıştır` seçeneğine tıklayın.
4.  **İzin Ver:** Yönetici izni isterse işlemden şüphe etmeyin ve `Evet` deyin. Zaten araç kendi kendini güvenlikli ortamda (RunAs) başlatıyor.

> **Not:** İlk çalıştırmada "Execution Policy" hatası alırsanız, PowerShell'i yönetici olarak açıp şu komutu yapıştırın:
> `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force`

---

## ⚠️ GELİŞTİRİCİLER İÇİN ÇOK ÖNEMLİ UYARI!

Eğer kaynak kodunu indirip kendinize göre modifiye etmek istiyorsanız, **Not Defteri (Notepad) ile asla standart UTF-8 formatında kaydetmeyin!** 

> [!WARNING]
> Windows PowerShell (v5.1), dosyanın en başında "BOM (Byte Order Mark)" imzasını görmediği zaman yazıları standart (ANSI) olarak okur. Bu da kodların içindeki tüm çekarlı / havalı sembollerin (`✓`, `⚙️`, `⚠️`) parçalanmasına, tırnak işaretlerinin birbirine girmesine ve scriptin çalışmadan syntax hatası ile çökmesine sebep olur.
> 
> **Kodu Düzenledikten Sonra Kaydederken:** Kesinlikle **"UTF-8 with BOM"** (BOM'lu UTF-8) formatını seçmelisiniz. (Notepad++ veya modern VS Code kullanılması şiddetle tavsiye edilir).

---

### Mimar ve Tasarımcı: **udyrYzn**
*Developed with ❤️ for Windows Enthusiasts.*
