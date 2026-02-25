# 🚀 UDYRYZN ULTIMATE REPAIR ENGINE v2.5 (MAS Edition)

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue?logo=powershell&style=for-the-badge) ![Platform](https://img.shields.io/badge/Platform-Windows%2010%2F11-0078D6?logo=windows&style=for-the-badge) ![Maintenance](https://img.shields.io/badge/Maintenance-Active-success?style=for-the-badge) ![License](https://img.shields.io/badge/License-MIT-yellow.svg)

**UDYRYZN Ultimate Repair**, Windows sistemlerinizi onarmak, hizlandirmak ve yonetmek icin gelistirilmis kapsamli bir PowerShell aracidir. Bu surum (**v2.5**), unlu **Microsoft Activation Scripts (MAS)** entegrasyonu ile birlikte gelir.

---

## 🌟 Özellikler (Features)

Bu araç, sistem bakimindan oyun performansina, ag ayarlarindan donanim analizine kadar her seyi tek bir menude toplar.

### � [1] Fast Clean (Hızlı Temizlik)
Sistemi yormadan hizli bir temizlik ve ag yenileme islemi yapar.
*   ✅ **DNS & IP Reset:** Ag baglantisini yeniler (Flush DNS, Release/Renew IP).
*   ✅ **Temp & Prefetch Temizliği:** Gecici dosyalari silerek yer acar.
*   ✅ **Geri Dönüşüm Kutusu:** Cop kutusunu bosaltir.

### 🔧 [2] Deep Repair (Derin Onarım)
Sistem dosyalarini ve bilesenlerini derinlemesine onarir.
*   ✅ **SFC & DISM Onarımı:** Bozuk Windows dosyalarini otomatik tespit eder ve duzeltir.
*   ✅ **Windows Update & Ikon Önbelleği:** Bozuk update dosyalarini ve ikonlari temizler.
*   ✅ **Winget Güncellemeleri:** Sistemdeki tum uygulamalari (Winget) otomatik gunceller.
*   ✅ **CHKDSK Planlama:** Disk hatalarini onarmak icin bir sonraki baslangica tarama planlar.
*   ✅ **Olay Günlükleri (Event Logs):** Gereksiz sistem loglarini temizler.

### 🕵️ [3] PC Expert Mode (Ekspertiz Modu)
Ikinci el bilgisayar alirken veya donanim test ederken kullanabileceginiz gelismis araclar.
*   🔍 **Donanım Dedektifi:** CPU, RAM, GPU ve Disklerin **gercek** bilgilerini gosterir (Sahte/Fake donanimi ifsa eder).
*   🎨 **Ölü Piksel Testi:** Ekrani farkli renklerle test ederek olu pikselleri bulmanizi saglar.
*   ⌨️ **Klavye Testi:** Hangi tuslarin calisip calismadigini anlik gosterir.
*   🔥 **Stress Testi:** CPU'yu 30 saniye boyunca %100 yuke sokarak stabiliteyi test eder.
*   🔋 **Pil Sağlığı & Lisans:** Laptop pil omrunu ve Windows lisansinin turunu (OEM/Retail/KMS) gosterir.
*   🔊 **Ses Testi:** Hoparlorlerden test sesleri calar.
*   🌐 **Ağ Stabilite Testi:** Google ve Cloudflare sunucularina ping atarak paket kaybi (packet loss) olup olmadigini olcer.
*   📄 **Rapor Oluştur:** Tum sistem bilgilerini iceren detayli bir `.txt` raporunu masaustune kaydeder.

### 🎮 [4] Gaming Tools (Oyun Araçları)
Oyun performansini artirmak ve eksik bilesenleri tamamlamak icin ozel araclar.
*   🎮 **Visual C++ Redistributable (AIO):** 2005'ten gunumuze tum C++ kutuphanelerini tek tikla kurar (Oyun acilmama sorunlarini cozer).
*   🎮 **DirectX Web Installer:** Eksik DirectX dosyalarini tamamlar.
*   ⚡ **Nihai Performans Modu:** Windows'un gizli "Ultimate Performance" guc planini aktif eder.

### 🌐 [5] Network Tools (Ağ Araçları)
Internet ve ag ayarlarini ozellestirir.
*   🌍 **DNS Değiştirici:** Tek tikla **Cloudflare (1.1.1.1)** veya **Google (8.8.8.8)** DNS ayarlar.
*   🔄 **Otomatik DNS (DHCP):** Ag ayarlarini varsayilana dondurur.
*   🧹 **Ağ Önbelleği Sıfırlama:** Winsock ve IP yiginini onarir.

### 🚑 [6] Daily Fixes (Gündelik Çözümler)
Sik karsilasilan sorunlar icin hizli cozumler.
*   🖨️ **Yazıcı (Print Spooler) Onarımı:** Yazdirma kuyrugunu temizler ve servisi yeniden baslatir.
*   � **Microsoft Store Reset:** Calismayan Windows Magaza'yi (WSReset) onarir.
*   � **Wi-Fi Şifre Gösterici:** Kayitli tum Wi-Fi sifrelerini listeler.
*   ⏰ **Saat Senkronizasyonu:** Windows saati yanlis ise sunucu ile esitler.

### 🛠️ [7] Extra Tools (Ekstra Araçlar)
*   🧹 **Disk Temizleme:** Windows'un kendi disk temizleme aracini (cleanmgr) baslatir.
*   📦 **Windows Update Onarımı:** `SoftwareDistribution` klasorunu temizleyerek guncelleme hatalarini cozer.

### � [9] Microsoft Activation (MAS)
Sisteme **Microsoft Activation Scripts (MAS) v2.5** entegre edilmistir.
*   ✅ **Windows & Office Etkinleştirme:** HWID/KMS38/Online KMS yontemleri ile kalici etkinlestirme saglar.
*   ✅ **Guvenli & Acik Kaynak:** Icerik dogrudan MAS projesinden alinmistir.

---

## 📥 KURULUM VE KULLANIM (HOW TO USE)

Bu bir kurulum gerektirmez! Sadece dosyayı indirin ve çalıştırın.

1.  **İndirin:** `UDYRYZN_ULTIMATE_REPAIR.ps1` dosyasını masaüstüne indirin.
2.  **Sağ Tık:** Dosyaya sağ tıklayın.
3.  **Çalıştır:** `PowerShell ile Çalıştır` seçeneğine tıklayın.
4.  **İzin Ver:** Yönetici izni isterse `Evet` deyin.

> **Not:** İlk çalıştırmada "Execution Policy" hatası alırsanız, PowerShell'i açıp şu komutu yapıştırın:
> `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force`

---

## ⚙️ OTOMATİK GÜNCELLEME (AUTO-UPDATE)

Bu araç, kendini GitHub üzerinden otomatik günceller!
*   Yeni bir versiyon çıktığında açılış ekranında sizi uyarır.
*   Onay verirseniz; **eski sürümü yedekler**, yenisini indirir ve **UTF-8 BOM** formatında güvenle kurup kendini yeniden başlatır.

---

## ⚠️ YASAL UYARI (DISCLAIMER)

Bu araç sistem dosyaları üzerinde değişiklik yapar. Her ne kadar güvenli kodlanmış olsa da, **önemli verilerinizin yedeğini almanız** tavsiye edilir. Oluşabilecek sorunlardan kullanıcı sorumludur.

---

### Credit: **udyrYzn**
### Credit: **MASSGRAVE**
*Developed with ❤️ for Windows Enthusiasts.*

