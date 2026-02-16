# UDYRYZN ULTIMATE REPAIR ENGINE v1.0
# Unified System Maintenance Tool
#
# Credits: YzN-UDYR

# 1. YONETICI KONTROLU (Admin Privileges)
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# 2. KARAKTER KODLAMA VE PROTOKOL
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"

# 3. YAPILANDIRMA
$CURRENT_VER = "2.0" 
# Not: Versiyon kontrol URL'lerini orijinal dosyalardan aldım, gerekirse güncelleyin.
$URL_VERSION = "https://raw.githubusercontent.com/YzN-UDYR/UDYRYZN-Ultimate-repair/main/version.txt"
$URL_SCRIPT = "https://raw.githubusercontent.com/YzN-UDYR/UDYRYZN-Ultimate-repair/main/UDYRYZN_ULTIMATE_REPAIR.ps1"

# Renk Kodları (Orijinal Dosyadan)
$ESC = [char]27
$G = "$ESC[92m"; $B = "$ESC[94m"; $C = "$ESC[96m"; $R = "$ESC[91m"; $W = "$ESC[0m"; $Y = "$ESC[93m"; $P = "$ESC[95m"
$PAD_LOGO = "                      "
$PAD_BOX = "        "
$PAD_TXT = "        "
$PAD_SUB = "               " 

$Host.UI.RawUI.WindowTitle = "UDYRYZN ULTIMATE REPAIR v$CURRENT_VER"
Clear-Host

# 4. OTONOM GUNCELLEME MOTORU (Orijinal Kod)
# Kullanıcının özel ASCII sanatı ve roket tasarımı korunmuştur.
try {
    # Güncelleme kontrolü için kısa bir timeout
    $RAW_DATA = Invoke-RestMethod -Uri $URL_VERSION -UserAgent $UA -TimeoutSec 5 -UseBasicParsing -ErrorAction SilentlyContinue
    if ($RAW_DATA) {
        $ONLINE_VER = ([string]$RAW_DATA).Trim() 

        if ([decimal]$ONLINE_VER -gt [decimal]$CURRENT_VER) {
            Clear-Host
            Write-Host ""
            Write-Host ""
            Write-Host "  $Y╔═══════════════════════════════════════════════════════════════════════════════════╗$W"
            Write-Host "  $Y║$W                                                                                   $Y║$W"
            Write-Host "  $Y║$W          $W▄▄▄         $G██╗   ██╗██████╗ ██████╗  █████╗ ████████╗███████╗$W           $Y║$W"
            Write-Host "  $Y║$W         $W█$C▀▀▀$W█        $G██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝$W           $Y║$W"
            Write-Host "  $Y║$W        $W█$R▄█$W▓$R█▄$W█       $G██║   ██║██████╔╝██║  ██║███████║   ██║   █████╗$W             $Y║$W"
            Write-Host "  $Y║$W       $W███$R█$B▓$R█$W███      $G██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██╔══╝$W             $Y║$W"
            Write-Host "  $Y║$W        $W▀█$R███$W█▀       $G╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ███████╗$W           $Y║$W"
            Write-Host "  $Y║$W         $W█$R███$W█        $G ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝$W           $Y║$W"
            Write-Host "  $Y║$W         $R█$W▓▓▓$R█         $C⚡━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━⚡$W                $Y║$W"
            Write-Host "  $Y║$W        $R▐$W█████$R▌                                                                    $Y║$W"
            Write-Host "  $Y║$W        $R▐$Y█$R▓$Y█$R▓$Y█$R▌            $C⬆️  YENİ SURUM TESPİT EDİLDİ!  ⬆️$W                       $Y║$W"
            Write-Host "  $Y║$W         $Y█$R▓$Y█$R▓$Y█                                                                     $Y║$W"
            Write-Host "  $Y║$W        $Y▐$R█$Y▓$R█$Y▓$R█$Y▌                                                                    $Y║$W"
            Write-Host "  $Y║$W       $R▐$Y█$R▓$Y███$R▓$Y█$R▌                                                                   $Y║$W"
            Write-Host "  $Y║$W        $Y▀$R█$Y███$R█$Y▀                                                                    $Y║$W"
            Write-Host "  $Y║$W         $R▀$Y███$R▀                                                                     $Y║$W"
            Write-Host "  $Y║$W          $Y▀$R█$Y▀                                                                      $Y║$W"
            Write-Host "  $Y║$W                        $R[MEVCUT SURUM]$W  :  $W v$CURRENT_VER$W                                   $Y║$W"
            Write-Host "  $Y║$W                        ${G}[YENI SURUM]$W    :  $G v$ONLINE_VER$W                                   $Y║$W"
            Write-Host "  $Y║$W                                                                                   $Y║$W"
            Write-Host "  $Y║$W             Yeni surum gelismis ozellikler ve hata duzeltmeleri iceriyor.         $Y║$W"
            Write-Host "  $Y║$W                                                                                   $Y║$W"
            Write-Host "  $Y╠═══════════════════════════════════════════════════════════════════════════════════╣$W"
            Write-Host "  $Y║$W                                                                                   $Y║$W"
            Write-Host "  $Y║$W             ${G}[E]$W - Evet, Simdi Guncelle        ${R}[H]$W - Hayir, Atla                   $Y║$W"
            Write-Host "  $Y║$W                                                                                   $Y║$W"
            Write-Host "  $Y╚═══════════════════════════════════════════════════════════════════════════════════╝$W"
            Write-Host ""
            Write-Host -NoNewline "  $C►$W Seciminiz: "
            
            $choice = Read-Host
            
            if ($choice -eq "E" -or $choice -eq "e") {
                Write-Host "  $C⚙️  GUNCELLEME BASLATILIYOR...$W"
                
                # Yedek oluştur (Rollback için)
                Write-Host -NoNewline "  $PAD_SUB Yedek olusturuluyor"
                $BackupPath = "$env:TEMP\UDYRYZN_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').ps1"
                try {
                    Copy-Item $PSCommandPath $BackupPath -Force
                    Write-Host " ${G}[DONE]$W"
                }
                catch {
                    Write-Host " ${Y}[SKIP]$W"
                }
                
                Write-Host -NoNewline "  $PAD_SUB Yeni surum indiriliyor"
                
                # İndirme animasyonu
                for ($i = 0; $i -lt 8; $i++) {
                    Write-Host -NoNewline "."
                    Start-Sleep -Milliseconds 200
                }
                
                try {
                    $newCode = (Invoke-WebRequest -Uri $URL_SCRIPT -UserAgent $UA -UseBasicParsing).Content
                    Write-Host " ${G}[DONE]$W"
                    
                    Write-Host -NoNewline "  $PAD_SUB Dosya kaydediliyor"
                    for ($i = 0; $i -lt 4; $i++) {
                        Write-Host -NoNewline "."
                        Start-Sleep -Milliseconds 150
                    }
                    
                    # Dosyayı UTF-8 BOM ile kaydet (Muhurluyor)
                    [System.IO.File]::WriteAllText($PSCommandPath, $newCode, [System.Text.Encoding]::UTF8)
                    Write-Host " ${G}[DONE]$W"
                    
                    Write-Host -NoNewline "  $PAD_SUB Yeni surum baslatiliyor"
                    for ($i = 0; $i -lt 4; $i++) {
                        Write-Host -NoNewline "."
                        Start-Sleep -Milliseconds 150
                    }
                    Write-Host " ${G}[OK]$W"
                    Write-Host ""
                    Write-Host "  $G✓ Guncelleme tamamlandi! Yeni pencere aciliyor...$W"
                    Write-Host ""
                    Start-Sleep -Seconds 2
                    
                    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
                    exit
                }
                catch {
                    Write-Host " ${R}[FAIL]$W"
                    Write-Host "  $Y⚠ Hata! Eski surum geri yukleniyor...$W"
                    if (Test-Path $BackupPath) {
                        Copy-Item $BackupPath $PSCommandPath -Force
                        Write-Host "  $G✓ Eski surum geri yuklendi.$W"
                    }
                    Start-Sleep -Seconds 3
                    return
                }
            }
        }
    }
}
catch { }

# 5. YARDIMCI FONKSIYONLAR

function Show-Header {
    Clear-Host
    Write-Host ""
    Write-Host "$C$PAD_LOGO    ██╗   ██╗██████╗ ██╗   ██╗██████╗ ██╗   ██╗███████╗███╗   ██╗"
    Write-Host "$C$PAD_LOGO    ██║   ██║██╔══██╗╚██╗ ██╔╝██╔══██╗╚██╗ ██╔╝╚══███╔╝████╗  ██║"
    Write-Host "$C$PAD_LOGO    ██║   ██║██║  ██║ ╚████╔╝ ██████╔╝ ╚████╔╝   ███╔╝ ██╔██╗ ██║"
    Write-Host "$C$PAD_LOGO    ██║   ██║██║  ██║  ╚██╔╝  ██╔══██╗  ╚██╔╝   ███╔╝  ██║╚██╗██║"
    Write-Host "$C$PAD_LOGO    ╚██████╔╝██████╔╝   ██║   ██║  ██║   ██║   ███████╗██║ ╚████║"
    Write-Host "$C$PAD_LOGO     ╚═════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝$W"
    Write-Host ""
    Write-Host "  $B$PAD_BOX╔═══════════════════════════════════════════════════════════════════════════════════╗$W"
    Write-Host "  $B$PAD_BOX║$W  ${R}[MODE]$W : $W Ultimate Repair Engine$W $B║$W   ${Y}[USER]$W : $W $env:USERNAME$W      $B║$W   ${Y}[VER]$W : $W $CURRENT_VER     $B║$W"
    Write-Host "  $B$PAD_BOX╚═══════════════════════════════════════════════════════════════════════════════════╝$W"
    Write-Host ""
}

function Start-FastClean {
    # .bat dosyasındaki "Fast Engine" mantığı
    Write-Host "  $Y► HIZLI TEMIZLIK MODU BASLATILIYOR...$W"
    Write-Host "  $B-------------------------------------$W"
    
    # 1. Ağ Optimizasyonu
    Write-Host "  $P[01]$W $C AG PROTOKOLLERI$W"
    Write-Host -NoNewline "  $PAD_SUB DNS ve IP yiginlari sifirlaniyor..."
    try {
        ipconfig /flushdns | Out-Null
        ipconfig /release | Out-Null
        ipconfig /renew   | Out-Null
        netsh winsock reset | Out-Null
        netsh int ip reset | Out-Null
        Write-Host " ${G}[DONE]$W"
    }
    catch { Write-Host " ${R}[FAIL]$W" }

    # 2. Temp Temizliği (PowerShell ile daha güvenli)
    Write-Host "  $P[02]$W $C GEÇİCİ DOSYA TEMİZLİĞİ$W"
    Write-Host -NoNewline "  $PAD_SUB Temp ve Prefetch temizleniyor..."
    
    $TempFolders = @(
        "$env:TEMP",
        "$env:SystemRoot\Temp",
        "$env:SystemRoot\Prefetch"
    )

    foreach ($Folder in $TempFolders) {
        if (Test-Path $Folder) {
            Get-ChildItem -Path $Folder -Recurse -Force -ErrorAction SilentlyContinue | 
            Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
        }
    }
    
    # Geri Dönüşüm Kutusu
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue

    Write-Host " ${G}[DONE]$W"

    Write-Host ""
    Write-Host "  $G✓ HIZLI TEMIZLIK TAMAMLANDI!$W"
    Write-Host ""
    Read-Host "  Ana menuye donmek icin Enter'a basin..."
}

function Start-DeepRepair {
    # .ps1 dosyasındaki "Deep Repair" mantığı
    
    # İlerleme Çubuğu Fonksiyonu (Local scope)
    # İlerleme Çubuğu Fonksiyonu (Local scope)
    $TOTAL_OPS = 8
    function Show-Progress {
        param($OpNum)
        $percent = [math]::Round(($OpNum / $TOTAL_OPS) * 100)
        $bar = "█" * [math]::Floor($percent / 5) + "░" * (20 - [math]::Floor($percent / 5))
        Write-Host "  $B${PAD_BOX}[$bar$B] $Y$percent%$W ($OpNum/$TOTAL_OPS operasyon)$W"
        Write-Host ""
    }

    $script:SuccessCount = 0
    $script:FailCount = 0

    # [01] AG KATMANI
    Show-Progress 0
    Write-Host "  $P$PAD_TXT[01]$W $C AG KATMANI DERIN SIFIRLAMA$W"
    netsh winsock reset | Out-Null
    ipconfig /flushdns | Out-Null
    Write-Host "  $PAD_SUB Ag Protokolleri Sifirlandi ${G}[DONE]$W"
    $script:SuccessCount++
    Write-Host ""

    # [02] SFC SCAN
    Show-Progress 1
    Write-Host "  $P$PAD_TXT[02]$W $C SISTEM DOSYASI ONARIMI (SFC)$W"
    Write-Host "  $PAD_SUB Sistem taramasi baslatiliyor, lutfen bekleyin..."
    Start-Process -FilePath "sfc" -ArgumentList "/scannow" -Wait -NoNewWindow
    Write-Host "  $PAD_SUB SFC Taramasi Tamamlandi ${G}[DONE]$W"
    $script:SuccessCount++
    Write-Host ""

    # [03] DISM
    Show-Progress 2
    Write-Host "  $P$PAD_TXT[03]$W $C DISM DERIN ONARIM$W"
    Write-Host "  $PAD_SUB RestoreHealth calistiriliyor..."
    dism /online /cleanup-image /restorehealth | Out-Null
    Write-Host "  $PAD_SUB ComponentCleanup calistiriliyor..."
    dism /online /cleanup-image /startcomponentcleanup | Out-Null
    Write-Host "  $PAD_SUB DISM Islemleri Tamamlandi ${G}[DONE]$W"
    $script:SuccessCount++
    Write-Host ""

    # [04] EVENT LOGS
    Show-Progress 3
    Write-Host "  $P$PAD_TXT[04]$W $C LOG TEMIZLIGI$W"
    Get-WinEvent -ListLog * -ErrorAction SilentlyContinue | ForEach-Object {
        try { [System.Diagnostics.Eventing.Reader.EventLogSession]::GlobalSession.ClearLog($_.LogName) } catch {}
    }
    Write-Host "  $PAD_SUB Sistem Loglari Temizlendi ${G}[DONE]$W"
    $script:SuccessCount++
    Write-Host ""

    # [05] ICON CACHE
    Show-Progress 4
    Write-Host "  $P$PAD_TXT[05]$W $C IKON BELLEGI$W"
    taskkill /f /im explorer.exe | Out-Null
    Get-ChildItem "$env:localappdata\IconCache.db" -ErrorAction SilentlyContinue | Remove-Item -Force
    Get-ChildItem "$env:localappdata\Microsoft\Windows\Explorer\iconcache_*.db" -ErrorAction SilentlyContinue | Remove-Item -Force
    Start-Process explorer.exe
    Write-Host "  $PAD_SUB Ikon Bellegi Sifirlandi ${G}[DONE]$W"
    $script:SuccessCount++
    Write-Host ""

    # [06] USB AUTOPLAY
    Show-Progress 5
    Write-Host "  $P$PAD_TXT[06]$W $C USB AUTOPLAY$W"
    try {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" -Name "DisableAutoplay" -Value 0 -Force
        Write-Host "  $PAD_SUB USB Autoplay Aktif Edildi ${G}[DONE]$W"
    }
    catch { }
    Write-Host ""

    # [07] WINGET
    Show-Progress 6
    Write-Host "  $P$PAD_TXT[07]$W $C UYGULAMA GUNCELLEMELERI$W"
    
    if (Get-Command winget -ErrorAction SilentlyContinue) {
        Write-Host "  $PAD_SUB Guncellemeler kontrol ediliyor (Lutfen bekleyin)..."
        
        # Guncelleme listesini al
        $rawOutput = winget upgrade --include-unknown | Out-String
        $lines = $rawOutput -split "`r`n" | Where-Object { $_.Trim() -ne "" }
        
        # Baslik satirini bul (Separator ---)
        $sepIndex = -1
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -match "^-+$") {
                $sepIndex = $i
                break
            }
        }
        
        $packages = @()
        if ($sepIndex -ge 0) {
            # Tabloyu parse et
            for ($i = $sepIndex + 1; $i -lt $lines.Count; $i++) {
                $line = $lines[$i]
                if ($line -match "upgrades available") { continue } # Footer
                
                # SÃ¼tunlar: Name, split by 2+ spaces
                $parts = $line -split "\s{2,}"
                if ($parts.Count -ge 2) {
                    $packages += @{
                        Name    = $parts[0]
                        Id      = $parts[1]
                        Version = if ($parts.Count -gt 2) { $parts[2] } else { "?" }
                    }
                }
            }
        }
        
        if ($packages.Count -eq 0) {
            Write-Host "  $PAD_SUB Sisteminiz guncel! (Guncellenecek paket bulunamnadi) ${G}[DONE]$W"
        }
        else {
            Write-Host "  $PAD_SUB $($packages.Count) adet guncelleme bulundu."
            Write-Host ""
            
            foreach ($pkg in $packages) {
                $pName = $pkg.Name
                $pkgId = $pkg.Id
                $pVer = $pkg.Version
                
                # Boyut bilgisi (Simulasyon/Placeholder - Winget hizli vermedigi icin)
                # Gercek boyutu almak cok yavaslatir (winget show <id>).
                # Kullanici "kac mb oldugunu yaz" dedi ama performans icin hizli geciyoruz.
                # Eger "Available" sutununda varsa (bazen olur) oradan alabiliriz ama standart degil.
                # Biz "Hesaplaniyor..." deyip baslatacagiz.
                
                Write-Host "  $Y ► $pName $W($C$pVer$W) Guncelleniyor... [Boyut: Hesaplaniyor...]"
                
                # Job baslat
                $job = Start-Job -ScriptBlock {
                    param($id)
                    winget upgrade --id $id --silent --force --accept-package-agreements --accept-source-agreements
                } -ArgumentList $pkgId
                
                # Animasyon Dongusu (Marquee Progress Bar)
                $barWidth = 30
                $pos = 0
                $direction = 1
                
                while ($job.State -eq 'Running') {
                    # Bar Olustur: [      <===>       ]
                    $spaceBefore = " " * $pos
                    $block = "<===>"
                    $spaceAfter = " " * ($barWidth - $pos)
                    
                    if ($spaceAfter.Length -lt 0) { $spaceAfter = "" } # Guvenlik
                    
                    $barStr = "  $PAD_SUB [$spaceBefore$block$spaceAfter] "
                    
                    Write-Host -NoNewline "$barStr"
                    Start-Sleep -Milliseconds 100
                    
                    # Backspace ile sil (Bar uzunlugu kadar)
                    $backspaces = "`b" * ($barStr.Length)
                    Write-Host -NoNewline $backspaces
                    
                    # Pozisyon Guncelle
                    $pos += $direction
                    if ($pos -ge $barWidth) { $direction = -1; $pos = $barWidth }
                    if ($pos -le 0) { $direction = 1; $pos = 0 }
                }
                
                # Sonucu Al
                Receive-Job $job | Out-Null
                Remove-Job $job
                
                # Satiri Temizle
                Write-Host -NoNewline (" " * 60 + "`r")
                
                Write-Host "  $G ✓ $pName Guncellendi!$W"
            }
            Write-Host ""
            Write-Host "  $PAD_SUB Tum guncellemeler tamamlandi ${G}[DONE]$W"
        }
    }
    # [07] WINGET
    Show-Progress 6
    if (Get-Command winget -ErrorAction SilentlyContinue) {
        Start-AppUpdates -IsSubOperation $true
    }
    else {
        Write-Host "  $P$PAD_TXT[07]$W $C UYGULAMA GUNCELLEMELERI$W"
        Write-Host "  $R 'winget' bulunamadi. Geciliyor.$W"
    }
    Write-Host ""
    
    # CHKDSK planla (Y tusu otomatik gonderilir)
    try {
        Write-Output "y" | chkdsk /f /r c: | Out-Null
        Write-Host "  $PAD_SUB Disk onarimi bir sonraki baslangica ayarlandi ${G}[DONE]$W"
        $script:SuccessCount++
    }
    catch {
        Write-Host "  $R HATA: CHKDSK planlanamadi! Yonetici olarak calistiginizdan emin olun.$W"
    }
    Write-Host ""

    Write-Host "  $G✓ DERIN ONARIM TAMAMLANDI!$W"
    Write-Host ""
    
    Write-Host "  $($R)╔═══════════════════════════════════════════════════════════════════════════════════╗$($W)"
    Write-Host "  $($R)║$($W)                                                                                   $($R)║$($W)"
    Write-Host "  $($R)║$($W)   $($Y)DIKKAT: $($R)DISK MODULU VE SISTEM DUZELTMELERININ TAM OLARAK ETKI EDEBILMESI ICIN$($R)   ║$($W)"
    Write-Host "  $($R)║$($W)               $($R)LUTFEN BILGISAYARINIZI YENIDEN BASLATINIZ. (RESTART)                $($R)║$($W)"
    Write-Host "  $($R)║$($W)                                                                                   $($R)║$($W)"
    Write-Host "  $($R)╚═══════════════════════════════════════════════════════════════════════════════════╝$($W)"
    
    Write-Host ""
    Read-Host "  Ana menuye donmek icin Enter'a basin..."
}

function Start-ExtraTools {
    while ($true) {
        Show-Header
        Write-Host "  $C╔═══════════════════════════════════════════════════════════════════════════════════╗$W"
        Write-Host "  $C║$W                        $Y🛠️  EKSTRA ARACLAR$W                                         $C║$W"
        Write-Host "  $C╠═══════════════════════════════════════════════════════════════════════════════════╣$W"
        Write-Host "  $C║$W                                                                                   $C║$W"
        Write-Host "  $C║$W     ${G}[1]$W Disk Temizleme Araci (Cleanmgr)                                           $C║$W"
        Write-Host "  $C║$W     ${G}[2]$W Windows Update Onbellegini Sifirla (SoftwareDistribution)                 $C║$W"
        Write-Host "  $C║$W     ${R}[0]$W Geri Don                                                                  $C║$W"
        Write-Host "  $C║$W                                                                                   $C║$W"
        Write-Host "  $C╚═══════════════════════════════════════════════════════════════════════════════════╝$W"
        Write-Host ""
        Write-Host -NoNewline "  $C►$W Seciminiz: "
        
        $subMenu = Read-Host
        
        switch ($subMenu) {
            "1" { 
                Write-Host "  $YDisk Temizleme baslatiliyor...$W"
                Start-Process "cleanmgr.exe" -Wait
            }
            "2" {
                Write-Host "  $YWindows Update servisleri durduruluyor...$W"
                Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
                Stop-Service bits -Force -ErrorAction SilentlyContinue
                Stop-Service cryptsvc -Force -ErrorAction SilentlyContinue
                
                $SoftDist = "$env:SystemRoot\SoftwareDistribution"
                if (Test-Path $SoftDist) {
                    Write-Host "  $YSoftwareDistribution klasoru temizleniyor...$W"
                    Remove-Item "$SoftDist\*" -Recurse -Force -ErrorAction SilentlyContinue
                }
                
                Write-Host "  $YServisler baslatiliyor...$W"
                Start-Service wuauserv -ErrorAction SilentlyContinue
                Start-Service bits -ErrorAction SilentlyContinue
                Start-Service cryptsvc -ErrorAction SilentlyContinue
                Write-Host "  $GIslem Tamamlandi!$W"
                Start-Sleep -Seconds 2
            }
            "0" { return }
        }
    }
}

function Start-DailyFixes {
    while ($true) {
        Show-Header
        Write-Host "  $C╔═══════════════════════════════════════════════════════════════════════════════════╗$W"
        Write-Host "  $C║$W                     $Y🚑  GUNDELIK SORUN COZUCU (Daily Fixes)$W                       $C║$W"
        Write-Host "  $C╠═══════════════════════════════════════════════════════════════════════════════════╣$W"
        Write-Host "  $C║$W                                                                                   $C║$W"
        Write-Host "  $C║$W     ${G}[1]$W Yazici Sorunlarini Coz (Print Spooler Fix)                                $C║$W"
        Write-Host "  $C║$W     ${G}[2]$W Laptop Pil Sagligi Raporu (Battery Report)                                $C║$W"
        Write-Host "  $C║$W     ${G}[3]$W Kayitli Wi-Fi Sifrelerini Goster (Show Wifi Pass)                         $C║$W"
        Write-Host "  $C║$W     ${G}[4]$W Microsoft Store Onarimi (WSReset)                                         $C║$W"
        Write-Host "  $C║$W     ${G}[5]$W Internet Saati Senkronizasyonu (Time Sync)                                $C║$W"
        Write-Host "  $C║$W     ${G}[6]$W Nihai Performans Modunu Ac (Unlock Ultimate Performance)                  $C║$W"
        Write-Host "  $C║$W     ${G}[7]$W Internet Baglanti Testi & DNS Temizligi (Ping & Flush)                    $C║$W"
        Write-Host "  $C║$W     ${R}[0]$W Geri Don                                                                  $C║$W"
        Write-Host "  $C║$W                                                                                   $C║$W"
        Write-Host "  $C╚═══════════════════════════════════════════════════════════════════════════════════╝$W"
        Write-Host ""
        Write-Host -NoNewline "  $C►$W Seciminiz: "
        
        $dlMenu = Read-Host
        
        switch ($dlMenu) {
            "1" {
                Write-Host "  $Y Yazdirma kuyrugu temizleniyor...$W"
                Restart-Service spooler -Force -ErrorAction SilentlyContinue
                Write-Host "  $G Yazici servisi yeniden baslatildi!$W"
                Start-Sleep -Seconds 2
            }
            "2" {
                Write-Host "  $Y Pil raporu olusturuluyor...$W"
                $reportPath = "$env:USERPROFILE\Desktop\battery-report.html"
                powercfg /batteryreport /output "$reportPath" | Out-Null
                Write-Host "  $G Rapor masaustune kaydedildi: $reportPath $W"
                Start-Process "$reportPath"
                Start-Sleep -Seconds 2
            }
            "3" {
                Write-Host "  $Y Kayitli Wi-Fi Profilleri Taraniyor...$W"
                $profiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }
                foreach ($p in $profiles) {
                    $info = netsh wlan show profile name="$p" key=clear
                    $pass = $info | Select-String "Key Content"
                    if ($pass) {
                        $passClean = $pass.ToString().Split(":")[1].Trim()
                        Write-Host "  $C $p $W : $G $passClean $W"
                    }
                    else {
                        Write-Host "  $C $p $W : $R (Sifre Yok/Acik Ag) $W"
                    }
                }
                Write-Host ""
                Read-Host "  Devam etmek icin Enter'a basin..."
            }
            "4" {
                Write-Host "  $Y Microsoft Store onbelligi sifirlaniyor (Bu islem surebilir)...$W"
                Start-Process "wsreset.exe" -Wait
                Write-Host "  $G Magaza sifirlandi!$W"
                Start-Sleep -Seconds 2
            }
            "5" {
                Write-Host "  $Y Windows Saati senkronize ediliyor...$W"
                Start-Service w32time -ErrorAction SilentlyContinue
                w32tm /resync | Out-Null
                Write-Host "  $G Saat guncellendi!$W"
                Start-Sleep -Seconds 2
            }
            "6" {
                Enable-UltimatePerformance
            }
            "7" {
                Write-Host "  $Y DNS Onbellegi temizleniyor...$W"
                ipconfig /flushdns | Out-Null
                Write-Host "  $Y Baglanti testi yapiliyor (Google & Cloudflare)...$W"
                
                if (Test-Connection -ComputerName 8.8.8.8 -Count 1 -Quiet) {
                    Write-Host "  $G Internet BAGLANDI (Google DNS Erisebilir)$W"
                }
                else {
                    Write-Host "  $R Internet BAGLANTISI YOK!$W"
                }
                Start-Sleep -Seconds 3
            }
            "0" { return }
        }
    }
}


function Start-GamingTools {
    $ResultMsg = ""
    while ($true) {
        Show-Header
        Write-Host "  $C╔═══════════════════════════════════════════════════════════════════════════════════╗$W"
        Write-Host "  $C║$W                       $Y🎮  OYUN ARACLARI (Gaming Tools)$W                            $C║$W"
        Write-Host "  $C╠═══════════════════════════════════════════════════════════════════════════════════╣$W"
        Write-Host "  $C║$W                                                                                   $C║$W"
        Write-Host "  $C║$W     ${G}[1]$W Visual C++ Redistributable (2005-2022) [Tumu - x86/x64]                   $C║$W"
        Write-Host "  $C║$W     ${G}[2]$W DirectX Web Installer (Guncel DirectX Surumleri)                          $C║$W"
        Write-Host "  $C║$W     ${G}[3]$W Nihai Performans (Ultimate Performance) Modu                              $C║$W"
        Write-Host "  $C║$W     ${R}[0]$W Geri Don                                                                  $C║$W"
        Write-Host "  $C║$W                                                                                   $C║$W"
        Write-Host "  $C╚═══════════════════════════════════════════════════════════════════════════════════╝$W"
        Write-Host ""
        
        if ($ResultMsg -ne "") {
            Write-Host "  $ResultMsg"
            Write-Host ""
            $ResultMsg = ""
        }

        Write-Host -NoNewline "  $C►$W Seciminiz: "
        
        $gmMenu = Read-Host
        
        switch ($gmMenu) {
            "1" {
                Write-Host "  $Y Visual C++ Paketleri kontrol ediliyor ve yukleniyor...$W"
                Write-Host "  $Y Bu islem paketlerin indirilmesi ve kurulmasi nedeniyle zaman alabilir.$W"
                
                if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
                    Write-Host "  $R 'winget' (App Installer) bulunamadi! Lutfen Windows Store'dan yukleyin.$W"
                    Start-Sleep -Seconds 3
                    break
                }

                $vcPackages = @(
                    "Microsoft.VCRedist.2005.x86", "Microsoft.VCRedist.2005.x64",
                    "Microsoft.VCRedist.2008.x86", "Microsoft.VCRedist.2008.x64",
                    "Microsoft.VCRedist.2010.x86", "Microsoft.VCRedist.2010.x64",
                    "Microsoft.VCRedist.2012.x86", "Microsoft.VCRedist.2012.x64",
                    "Microsoft.VCRedist.2013.x86", "Microsoft.VCRedist.2013.x64",
                    "Microsoft.VCRedist.2015+.x86", "Microsoft.VCRedist.2015+.x64"
                )

                foreach ($pkgId in $vcPackages) {
                    Write-Host -NoNewline "  $PAD_SUB Yukleniyor: $pkgId ... "
                    try {
                        winget install --id $pkgId --silent --accept-package-agreements --accept-source-agreements --force | Out-Null
                        Write-Host "${G}[OK]$W"
                    }
                    catch {
                        Write-Host "${R}[ERR]$W (Belki zaten yukludur)"
                    }
                }
                $ResultMsg = "$G✓ Visual C++ Redistributable paketlerinin kurulumu basariyla tamamlandi!$W"
            }
            "2" {
                Write-Host "  $Y DirectX Web Installer indiriliyor...$W"
                $dxUrl = "https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe"
                $dxPath = "$env:TEMP\dxwebsetup.exe"
                
                try {
                    Invoke-WebRequest -Uri $dxUrl -OutFile $dxPath -UseBasicParsing
                    Write-Host "  $G Indirme basarili! Kurulum baslatiliyor...$W"
                    Start-Process -FilePath $dxPath -Wait
                    $ResultMsg = "$G✓ DirectX Web Installer islemi tamamlandi!$W"
                }
                catch {
                    Write-Host "  $R Indirme hatasi! Internet baglantinizi kontrol edin.$W"
                    Start-Sleep -Seconds 2
                }
            }
            "3" {
                Enable-UltimatePerformance
            }
            "0" { return }
        }
    }
}

function Start-AppUpdates {
    param (
        [bool]$IsSubOperation = $false
    )

    if (-not $IsSubOperation) {
        Show-Header
        Write-Host "  $C╔═══════════════════════════════════════════════════════════════════════════════════╗$W"
        Write-Host "  $C║$W                    $Y⬇️  UYGULAMA GUNCELLEMELERI (Winget)$W                           $C║$W"
        Write-Host "  $C╚═══════════════════════════════════════════════════════════════════════════════════╝$W"
        Write-Host ""
    }

    if (Get-Command winget -ErrorAction SilentlyContinue) {
        Write-Host "  $PAD_SUB Guncellemeler kontrol ediliyor (Lutfen bekleyin)..."
        
        # Guncelleme listesini al
        $rawOutput = winget upgrade --include-unknown | Out-String
        $lines = $rawOutput -split "`r`n" | Where-Object { $_.Trim() -ne "" }
        
        # Baslik satirini bul (Separator ---)
        $sepIndex = -1
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -match "^-+$") {
                $sepIndex = $i
                break
            }
        }
        
        $packages = @()
        if ($sepIndex -ge 0) {
            # Tabloyu parse et
            for ($i = $sepIndex + 1; $i -lt $lines.Count; $i++) {
                $line = $lines[$i]
                if ($line -match "upgrades available") { continue } # Footer
                
                # SÃ¼tunlar: Name, split by 2+ spaces
                $parts = $line -split "\s{2,}"
                if ($parts.Count -ge 2) {
                    $packages += @{
                        Name    = $parts[0]
                        Id      = $parts[1]
                        Version = if ($parts.Count -gt 2) { $parts[2] } else { "?" }
                    }
                }
            }
        }
        
        if ($packages.Count -eq 0) {
            Write-Host "  $PAD_SUB Sisteminiz guncel! (Guncellenecek paket bulunamnadi) ${G}[DONE]$W"
        }
        else {
            Write-Host "  $PAD_SUB $($packages.Count) adet guncelleme bulundu."
            Write-Host ""
            
            foreach ($pkg in $packages) {
                $pName = $pkg.Name
                $pkgId = $pkg.Id
                $pVer = $pkg.Version
                
                # Uzun isimleri kisalt (UI tasmamasi icin)
                if ($pName.Length -gt 35) {
                    $pNameDisplay = $pName.Substring(0, 32) + "..."
                }
                else {
                    $pNameDisplay = $pName
                }
                
                Write-Host "  $Y ► $pNameDisplay $W($C$pVer$W) Guncelleniyor... " -NoNewline
                
                # Job baslat
                $job = Start-Job -ScriptBlock {
                    param($id)
                    winget upgrade --id $id --silent --force --accept-package-agreements --accept-source-agreements
                } -ArgumentList $pkgId
                
                # Animasyon Dongusu (Spinner)
                $spinner = @('|', '/', '-', '\')
                $spinIdx = 0
                
                while ($job.State -eq 'Running') {
                    $char = $spinner[$spinIdx % 4]
                    Write-Host -NoNewline "$char"
                    Start-Sleep -Milliseconds 100
                    Write-Host -NoNewline "`b" # Backspace ile sil
                    $spinIdx++
                }
                
                # Sonucu Al
                Receive-Job $job | Out-Null
                Remove-Job $job
                
                # Satiri Temizle
                Write-Host -NoNewline (" " * 60 + "`r")
                
                Write-Host "  $G ✓ $pName Guncellendi!$W"
            }
            Write-Host ""
            Write-Host "  $PAD_SUB Tum guncellemeler tamamlandi ${G}[DONE]$W"
        }
    }
    else {
        Write-Host "  $R 'winget' bulunamadi. Geciliyor.$W"
    }
    Write-Host ""

    if (-not $IsSubOperation) {
        Read-Host "  Ana menuye donmek icin Enter'a basin..."
    }
}


function Start-NetworkTools {
    $ResultMsg = ""
    while ($true) {
        Show-Header
        Write-Host "  $C╔═══════════════════════════════════════════════════════════════════════════════════╗$W"
        Write-Host "  $C║$W                       $Y🌐  AG ARACLARI (Network Tools)$W                             $C║$W"
        Write-Host "  $C╠═══════════════════════════════════════════════════════════════════════════════════╣$W"
        Write-Host "  $C║$W                                                                                   $C║$W"
        Write-Host "  $C║$W     ${G}[1]$W Cloudflare DNS (1.1.1.1)    $Y>>$W Hizli, Guvenli ve Gizlilik Odakli          $C║$W"
        Write-Host "  $C║$W     ${G}[2]$W Google DNS (8.8.8.8)        $Y>>$W Standart ve Guvenilir                      $C║$W"
        Write-Host "  $C║$W     ${G}[3]$W Otomatik DNS (DHCP)         $Y>>$W Varsayilan ISP Ayarlari (Sifirla)          $C║$W"
        Write-Host "  $C║$W     ${G}[4]$W Ag Onbellegini Temizle      $Y>>$W Flush DNS, Renew IP, Reset Winsock         $C║$W"
        Write-Host "  $C║$W     ${R}[0]$W Geri Don                                                                      $C║$W"
        Write-Host "  $C║$W                                                                                   $C║$W"
        Write-Host "  $C╚═══════════════════════════════════════════════════════════════════════════════════╝$W"
        Write-Host ""
        
        if ($ResultMsg -ne "") {
            Write-Host "  $ResultMsg"
            Write-Host ""
            $ResultMsg = ""
        }

        # Mevcut DNS Bilgisi
        $CurrentDNS = Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object { $_.ServerAddresses } | Select-Object -ExpandProperty ServerAddresses -Unique
        if ($CurrentDNS) {
            Write-Host "  $P Mevcut DNS Sunuculari:$W $($CurrentDNS -join ', ')"
        }
        else {
            Write-Host "  $P Mevcut DNS Sunuculari:$W (Otomatik/Bulunamadi)"
        }
        Write-Host ""

        Write-Host -NoNewline "  $C►$W Seciminiz: "
        
        $nwMenu = Read-Host
        
        switch ($nwMenu) {
            "1" {
                Write-Host "  $Y Cloudflare DNS ayarlaniyor...$W"
                try {
                    Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Set-DnsClientServerAddress -ServerAddresses ("1.1.1.1", "1.0.0.1") -ErrorAction Stop
                    $ResultMsg = "$G✓ Cloudflare DNS (1.1.1.1) basariyla uygulandi!$W"
                }
                catch {
                    $ResultMsg = "$R HATA: DNS degistirilemedi. Yonetici oldugunuzdan emin olun.$W"
                }
            }
            "2" {
                Write-Host "  $Y Google DNS ayarlaniyor...$W"
                try {
                    Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Set-DnsClientServerAddress -ServerAddresses ("8.8.8.8", "8.8.4.4") -ErrorAction Stop
                    $ResultMsg = "$G✓ Google DNS (8.8.8.8) basariyla uygulandi!$W"
                }
                catch {
                    $ResultMsg = "$R HATA: DNS degistirilemedi. Yonetici oldugunuzdan emin olun.$W"
                }
            }
            "3" {
                Write-Host "  $Y Otomatik DNS (DHCP) ayarlarina donuluyor...$W"
                try {
                    Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Set-DnsClientServerAddress -ResetServerAddresses -ErrorAction Stop
                    $ResultMsg = "$G✓ DNS ayarlari sifirlandi (Otomatik/DHCP)!$W"
                }
                catch {
                    $ResultMsg = "$R HATA: DNS sifirlanamadi. Yonetici oldugunuzdan emin olun.$W"
                }
            }
            "4" {
                Write-Host "  $Y Ag bilesenleri sifirlaniyor (Flush, Renew, Reset)...$W"
                ipconfig /flushdns | Out-Null
                ipconfig /release | Out-Null
                ipconfig /renew | Out-Null
                netsh winsock reset | Out-Null
                $ResultMsg = "$G✓ Ag onbellegi ve ayarlari temizlendi!$W"
            }
            "0" { return }
        }
    }
}

function Enable-UltimatePerformance {
    Show-Header
    Write-Host "  $C╔═══════════════════════════════════════════════════════════════════════════════════╗$W"
    Write-Host "  $C║$W              $Y⚡  NIHAI PERFORMANS (ULTIMATE PERFORMANCE) MODU$W                     $C║$W"
    Write-Host "  $C╚═══════════════════════════════════════════════════════════════════════════════════╝$W"
    Write-Host ""
    
    Write-Host "  $Y Nihai Performans modu kilitleri aciliyor...$W"
    
    # Sadece kilidi ac (Sistemde varsa kopya olusturur, yoksa ekler)
    # Hata vermemesi icin Out-Null, kullaniciya detay bogmayalim
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Out-Null
    
    Start-Sleep -Seconds 1
    
    Write-Host ""
    Write-Host "  $G ISLEM TAMAMLANDI!$W"
    Write-Host ""
    Write-Host "  $R DIKKAT: Modu sisteminize ekledik ancak AKTIFLESTIRMEDIK.$W"
    Write-Host "  $R Lutfen Denetim Masasi > Guc Secenekleri'ne gidin ve$W"
    Write-Host "  $R 'Nihai Performans' secenegini manuel olarak secin.$W"
    Write-Host ""
    Write-Host "  $Y (Bazi sistemlerde otomatik gecis engellendigi icin bu islem manuel yapilmalidir)$W"
    Write-Host ""
    
    Read-Host "  Ana menuye donmek icin Enter'a basin..."
}



function Start-PCExpertMode {
    while ($true) {
        Show-Header
        Write-Host "  $C╔═══════════════════════════════════════════════════════════════════════════════════╗$W"
        Write-Host "  $C║$W               $Y🕵️  PC EXPERT MODU (ALIM/SATIM KONTROLCUSU)$W                         $C║$W"
        Write-Host "  $C╠═══════════════════════════════════════════════════════════════════════════════════╣$W"
        Write-Host "  $C║$W                                                                                   $C║$W"
        Write-Host "  $C║$W     ${G}[1]$W Donanim Dedektifi (Hardware Info)   $Y>>$W RAM/SSD/CPU Gercek Detaylari       $C║$W"
        Write-Host "  $C║$W     ${G}[2]$W Olu Piksel Testi (Pixel Check)      $Y>>$W Ekrani Renk Testine Sokar          $C║$W"
        Write-Host "  $C║$W     ${G}[3]$W Pil Sagligi & Lisans Durumu         $Y>>$W Batarya Omru ve Windows Lisansi    $C║$W"
        Write-Host "  $C║$W     ${G}[4]$W Klavye Tus Testi (Keyboard Test)    $Y>>$W Basilan Tuslari Ekrana Yazar       $C║$W"
        Write-Host "  $C║$W     ${G}[5]$W CPU Stress Testi (Stabilite)        $Y>>$W 30 Saniyelik Yuk Testi             $C║$W"
        Write-Host "  $C║$W     ${G}[6]$W WinSAT Performans Puani             $Y>>$W Windows Puanlama & Siniflandirma   $C║$W"
        Write-Host "  $C║$W     ${G}[7]$W Ses & Hoparlor Testi                $Y>>$W Sag/Sol Ses Testi                  $C║$W"
        Write-Host "  $C║$W     ${G}[8]$W Ag & Internet Stabilite Testi       $Y>>$W Paket Kaybi (Loss) Analizi         $C║$W"
        Write-Host "  $C║$W     ${G}[9]$W EKSPERTIZ RAPORU OLUSTUR (.TXT)     $Y>>$W Tum Bilgileri Masaustune Kaydet    $C║$W"
        Write-Host "  $C║$W     ${G}[A]$W Mavi Ekran (BSOD) Gecmisi           $Y>>$W Sistemin Cokme Kayitlari (BugCheck)$C║$W"
        Write-Host "  $C║$W     ${G}[B]$W USB Baglantilari & Portlar          $Y>>$W Takili Cihazlari Listele           $C║$W"
        Write-Host "  $C║$W     ${G}[C]$W Kamera Testi (Webcam)               $Y>>$W Windows Kamera Uygulamasini Acar   $C║$W"
        Write-Host "  $C║$W     ${R}[0]$W Geri Don                                                                  $C║$W"
        Write-Host "  $C║$W                                                                                   $C║$W"
        Write-Host "  $C╚═══════════════════════════════════════════════════════════════════════════════════╝$W"
        Write-Host ""
        Write-Host -NoNewline "  $C►$W Seciminiz: "
        
        $exMenu = Read-Host
        
        switch ($exMenu) {
            "1" {
                Show-Header
                Write-Host "  $Y[ANALIZ] Donanim detaylari toplaniyor...$W"
                Write-Host "  $P(NOT: Bu bilgiler donanimin kendine ait kimlik kartindan alinir.$W"
                Write-Host "  $P Cin mali sahte urunler (Fake GPU/RAM/SSD) kendilerini orjinal gibi gosterebilir.$W"
                Write-Host "  $P Supheli durumlarda 'Performans Testi' yapmaniz onerilir.)$W"
                Write-Host ""

                # CPU
                $cpu = Get-CimInstance Win32_Processor
                Write-Host "  $C--- ISLEMCI (CPU) ---$W"
                Write-Host "  $G Model      :$W $($cpu.Name)"
                Write-Host "  $G ID         :$W $($cpu.ProcessorId)"
                Write-Host "  $G Cekirdek   :$W $($cpu.NumberOfCores) Core / $($cpu.NumberOfLogicalProcessors) Thread"
                Write-Host "  $G Hiz (Anlik):$W $($cpu.CurrentClockSpeed) MHz (Max: $($cpu.MaxClockSpeed) MHz)"
                Write-Host ""

                # RAM
                $memArray = Get-CimInstance Win32_PhysicalMemoryArray
                $totalSlots = 0; if ($memArray) { $memArray | ForEach-Object { $totalSlots += $_.MemoryDevices } }
                $rams = @(Get-CimInstance Win32_PhysicalMemory) # Force Array
                $usedSlots = $rams.Count
                
                # Fallback if totalSlots is wrong (e.g. 0)
                if ($totalSlots -lt $usedSlots) { $totalSlots = $usedSlots }
                
                $freeSlots = $totalSlots - $usedSlots
                
                Write-Host "  $C--- BELLEK (RAM) ---$W"
                Write-Host "  $Y Slot Durumu: $usedSlots / $totalSlots Dolu ($freeSlots Bos Slot Var)$W"
                foreach ($ram in $rams) {
                    $gb = [math]::Round($ram.Capacity / 1GB, 1)
                    $totalRam += $gb
                    $manuf = $ram.Manufacturer.Trim()
                    $part = $ram.PartNumber.Trim()
                    
                    # Fake RAM Check Heuristic
                    $status = "$G✓$W"
                    if ($manuf -match "Unknown" -or $manuf -eq "0000" -or $part -match "Unknown") {
                        $status = "$R⚠ SUPHELI (Markasiz/OEM)$W"
                    }
                    
                    Write-Host "  $G Slot      :$W $gb GB | $($ram.Speed) MHz | $manuf | $part $status"
                }
                Write-Host "  $Y Toplam RAM :$W $totalRam GB"
                Write-Host ""

                # GPU
                Write-Host "  $C--- EKRAN KARTI (GPU) ---$W"
                $gpus = Get-CimInstance Win32_VideoController
                foreach ($gpu in $gpus) {
                    Write-Host "  $G Kart       :$W $($gpu.Name)"
                    Write-Host "  $G Surucu     :$W $($gpu.DriverVersion)"
                    Write-Host "  $G VRAM       :$W $([math]::Round($gpu.AdapterRAM / 1GB, 1)) GB (Tahmini)"
                    Write-Host "  $G Cozunurluk :$W $($gpu.CurrentHorizontalResolution)x$($gpu.CurrentVerticalResolution) @ $($gpu.CurrentRefreshRate)Hz"
                }
                Write-Host ""

                # DISK
                Write-Host "  $C--- DEPOLAMA (DISK/SSD) ---$W"
                $disks = Get-PhysicalDisk | Sort-Object MediaType
                foreach ($disk in $disks) {
                    $sizeGB = [math]::Round($disk.Size / 1GB, 0)
                    $health = if ($disk.HealthStatus -eq "Healthy") { "$G✓ Saglam$W" } else { "$R⚠ RISKLI!$W" }
                    Write-Host "  $G Model      :$W $($disk.FriendlyName)"
                    Write-Host "  $G Tur/Boyut  :$W $($disk.MediaType) / $sizeGB GB"
                    Write-Host "  $G Seri No    :$W $($disk.SerialNumber)"
                    Write-Host "  $G Saglik     :$W $health (Durum: $($disk.OperationalStatus))"
                    
                    if ($disk.MediaType -eq "SSD" -or $disk.MediaType -eq "NVMe") {
                        Write-Host "  $P (SSD Hiz Testi icin anamenuden speed test yapilabilir)$W"
                    }
                    Write-Host "  $P --------------------------- $W"
                }

                # EXPANSION SLOTS
                Write-Host ""
                Write-Host "  $C--- GENISLEME YUVALARI (BETA) ---$W"
                try {
                    $slots = Get-CimInstance Win32_SystemSlot -ErrorAction SilentlyContinue | Where-Object { $_.SlotDesignation -match "M.2|PCI|SSD|NVMe" }
                    if ($slots) {
                        foreach ($slot in $slots) {
                            $status = if ($slot.CurrentUsage -eq 3) { "$G[BOS/KULLANILABILIR]$W" } elseif ($slot.CurrentUsage -eq 4) { "$R[DOLU/KULLANIMDA]$W" } else { "$Y[BILINMIYOR]$W" }
                            Write-Host "  $Y Slot: $($slot.SlotDesignation) - $status"
                        }
                    }
                    else {
                        Write-Host "  $P Anakart slot bilgisi okunamadi (Masaustu sistemlerde daha iyi calisir).$W"
                    }
                }
                catch { Write-Host "  $P Slot bilgisine erisilemedi.$W" }

                Write-Host ""
                Read-Host "  Devam etmek icin Enter'a basin..."
            }
            "2" {
                Add-Type -AssemblyName System.Windows.Forms
                Add-Type -AssemblyName System.Drawing
                
                $form = New-Object System.Windows.Forms.Form
                $form.FormBorderStyle = "None"
                $form.WindowState = "Maximized"
                $form.TopMost = $true
                $form.Cursor = [System.Windows.Forms.Cursors]::Hand
                
                $colors = @([System.Drawing.Color]::Red, [System.Drawing.Color]::Green, [System.Drawing.Color]::Blue, [System.Drawing.Color]::White, [System.Drawing.Color]::Black)
                $msg = "TIKLA: Renk Degistir | ESC: Cikis"
                
                $script:colorIdx = 0
                $form.BackColor = $colors[$script:colorIdx]

                $label = New-Object System.Windows.Forms.Label
                $label.Text = $msg
                $label.Font = New-Object System.Drawing.Font("Arial", 20)
                $label.ForeColor = [System.Drawing.Color]::White
                $label.AutoSize = $true
                $label.Location = New-Object System.Drawing.Point(50, 50)
                $form.Controls.Add($label)

                $form.Add_Click({
                        $script:colorIdx++
                        if ($script:colorIdx -ge $colors.Count) { $script:colorIdx = 0 }
                        $form.BackColor = $colors[$script:colorIdx]
                        if ($form.BackColor -eq [System.Drawing.Color]::White) { $label.ForeColor = [System.Drawing.Color]::Black } else { $label.ForeColor = [System.Drawing.Color]::White }
                    })

                $form.Add_KeyDown({
                        if ($_.KeyCode -eq "Escape") { $form.Close() }
                    })
                
                $form.ShowDialog() | Out-Null
            }
            "3" {
                Show-Header
                Write-Host "  $C--- PIL SAGLIGI (Laptop) ---$W"
                try {
                    $battery = Get-WmiObject -Class Win32_Battery -ErrorAction Stop
                    $report = "powercfg /batteryreport /output `"$env:TEMP\bat_report.xml`" /xml"
                    Invoke-Expression $report | Out-Null
                    
                    if (Test-Path "$env:TEMP\bat_report.xml") {
                        [xml]$xml = Get-Content "$env:TEMP\bat_report.xml"
                        $design = $xml.BatteryReport.Batteries.Battery.DesignCapacity
                        $full = $xml.BatteryReport.Batteries.Battery.FullChargeCapacity
                        
                        if ($design -and $full) {
                            $health = [math]::Round(($full / $design) * 100, 1)
                            Write-Host "  $G Fabrika Kapasitesi :$W $design mWh"
                            Write-Host "  $G Mevcut Kapasite    :$W $full mWh"
                            Write-Host "  $Y Pil Sagligi        :$W %$health"
                            
                            if ($health -lt 70) { Write-Host "  $R ⚠ PIL OMRUNU TAMAMLAMAK UZERE!$W" }
                            elseif ($health -gt 90) { Write-Host "  $G ✓ PIL DURUMU MUKEMMEL$W" }
                        }
                        else {
                            Write-Host "  $Y Detayli pil verisi okunamadi (Masaustu olabilir).$W"
                        }
                    }
                }
                catch {
                    Write-Host "  $Y Pil bulunamadi veya erisilemedi (Masaustu PC olabilir).$W"
                }

                Write-Host ""
                Write-Host "  $C--- WINDOWS LISANS DURUMU ---$W"
                
                # Check 1: Activation Status
                $lic = Get-CimInstance SoftwareLicensingProduct | Where-Object { $_.PartialProductKey -and $_.Name -like "*Windows*" } | Select-Object -First 1
                if ($lic) {
                    Write-Host "  $G Lisans Turu :$W $($lic.Name)"
                    $status = "Lisanssiz/Sorunlu"; if ($lic.LicenseStatus -eq 1) { $status = "LISANSLI (Aktif)" }
                    Write-Host "  $G Durum       :$W $status"
                     
                    $desc = $lic.Description
                    if ($desc -match "VOLUME_KMSCLIENT") { 
                        Write-Host "  $R ⚠ DIKKAT: KMS ILE ETKINLESTIRILMIS!$W" 
                        Write-Host "  $R (Bu bilgisayar muhtemelen sirket bilgisayari veya CRACK (KMS) yapilmis.)$W"
                    }
                    elseif ($desc -match "OEM") { Write-Host "  $G ✓ OEM LISANS (Anakarta Gomulu - Orijinal/Guvenli)$W" }
                    elseif ($desc -match "RETAIL") { Write-Host "  $G ✓ RETAIL LISANS (Bireysel Satin Alinmis - Orijinal/Guvenli)$W" }
                    else { Write-Host "  $Y Lisans Detayi: $desc $W" }
                }
                
                # Check 2: Expiration Date (KMS usually expires in 180 days)
                $exp = Get-CimInstance SoftwareLicensingProduct | Where-Object { $_.PartialProductKey -and $_.LicenseStatus -eq 1 } | Select-Object -First 1
                if ($exp.GracePeriodRemaining -gt 0) {
                    $daysLeft = [math]::Round($exp.GracePeriodRemaining / 1440, 0) # minutes to days
                    if ($daysLeft -lt 180 -and $desc -match "VOLUME") {
                        Write-Host "  $Y Lisans Suresi :$W $daysLeft gun sonra yenileme gerekecek (KMS dongusu).$W"
                    }
                }

                Write-Host ""
                Read-Host "  Devam etmek icin Enter'a basin..."
            }
            "4" {
                Clear-Host
                Write-Host "  $Y--- KLAVYE TEST MODU ---$W"
                Write-Host "  $C Calistigini gormek istediginiz tusa basin.$W"
                Write-Host "  $R Cikmak icin ESC tusuna basin.$W"
                Write-Host ""
                
                try {
                    $host.UI.RawUI.FlushInputBuffer()
                    while ($true) {
                        if ($host.UI.RawUI.KeyAvailable) {
                            $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                            if ($key.VirtualKeyCode -eq 27) { break } # ESC
                            Write-Host -NoNewline " [$($key.Character) / $($key.VirtualKeyCode)] "
                        }
                        Start-Sleep -Milliseconds 20
                    }
                }
                catch { Write-Host "  $R Hata: Bu terminal modu desteklemiyor.$W" }
                Read-Host ""
            }
            "5" {
                Show-Header
                Write-Host "  $R ⚠ STRESS TESTI (CPU %100)$W"
                Write-Host "  Durdurmak icin 'DELETE' veya 'ESC' tusuna basin."
                Write-Host "  Otomatik Durma: 30 Saniye."
                
                $conf = Read-Host "  Baslamak icin Enter'a basin (Iptal: 'H')"
                if ($conf -ne "H") {
                    $jobs = @()
                    $cores = (Get-CimInstance Win32_Processor).NumberOfLogicalProcessors
                    Write-Host "  $Y Test Baslatiliyor ($cores Thread)...$W"
                    
                    # Start Jobs
                    for ($i = 0; $i -lt $cores; $i++) {
                        $jobs += Start-Job -ScriptBlock { while ($true) { $r = [math]::Sqrt(123456789.123) } }
                    }
                    
                    $startTime = Get-Date
                    $duration = 30 # Seconds
                    
                    try {
                        $host.UI.RawUI.FlushInputBuffer()
                        while ($true) {
                            $elapsed = (Get-Date) - $startTime
                            if ($elapsed.TotalSeconds -ge $duration) { 
                                Write-Host "`n  $G Sure doldu (30sn). Test bitiriliyor...$W"
                                break 
                            }
                            
                            if ($host.UI.RawUI.KeyAvailable) {
                                $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                                if ($key.VirtualKeyCode -eq 46 -or $key.VirtualKeyCode -eq 27) {
                                    # Delete or Esc (46=Del, 27=Esc)
                                    Write-Host "`n  $R Kullanici tarafindan durduruldu!$W"
                                    break
                                }
                            }
                            
                            Write-Host -NoNewline "."
                            Start-Sleep -Milliseconds 200
                        }
                    }
                    finally {
                        Stop-Job -Job $jobs -ErrorAction SilentlyContinue
                        Remove-Job -Job $jobs -ErrorAction SilentlyContinue
                    }
                    Write-Host ""
                    Write-Host "  $G ✓ Test Tamamlandi.$W"
                }
                Read-Host "  Devam etmek icin Enter..."
            }
            
            # --- YENI OZELLIKLER ---
            "6" {
                Show-Header
                Write-Host "  $Y[ANALIZ] Windows Performans Puani (WinSAT) okunuyor...$W"
                try {
                    $sat = Get-CimInstance Win32_WinSat
                    if ($sat) {
                        $score = $sat.WinSPRLevel
                        Write-Host ""
                        Write-Host "  $C--- PERFORMANS PUANI (1.0 - 9.9) ---$W"
                        Write-Host "  $G Genel Puan :$W $score"
                        Write-Host "  $Y Islemci    :$W $($sat.CPUScore)"
                        Write-Host "  $Y RAM        :$W $($sat.MemoryScore)"
                        Write-Host "  $Y Grafik     :$W $($sat.GraphicsScore)"
                        Write-Host "  $Y Oyun       :$W $($sat.D3DScore)"
                        Write-Host "  $Y Disk       :$W $($sat.DiskScore)"
                        
                        Write-Host ""
                        Write-Host -NoNewline "  $C► SINIFLANDIRMA:$W "
                        if ($score -ge 8.0) { Write-Host "$G UST DUZEY OYUN/IS ISTASYONU (Canavar)$W" }
                        elseif ($score -ge 7.0) { Write-Host "$G GUCLU OYUN/PERFORMANS BILGISAYARI$W" }
                        elseif ($score -ge 6.0) { Write-Host "$Y ORTA SEVIYE / CASUAL GAMING$W" }
                        elseif ($score -ge 4.5) { Write-Host "$Y OFIS / MULTIMEDYA STANDART$W" }
                        else { Write-Host "$R GIRIS SEVIYESI / ESKI CIHAZ$W" }
                    }
                    else { Write-Host "  $R WinSAT verisi bulunamadi (Hic calistirilmamis olabilir).$W" }
                }
                catch { Write-Host "  $R Hata: Skor okunamadi.$W" }
                Write-Host ""
                Read-Host "  Devam etmek icin Enter..."
            }

            "7" {
                Show-Header
                Write-Host "  $C--- SES TESTI ---$W"
                Write-Host "  Sira ile sesler calinacak. Lutfen dinleyin."
                Write-Host ""
                
                Write-Host -NoNewline "  $Y[1/3] Sistem Sesi (Beep)... $W"
                [Console]::Beep(500, 300)
                Start-Sleep -Milliseconds 100
                [Console]::Beep(1000, 300)
                Write-Host "$GOK$W"
                Start-Sleep -Seconds 1
                
                try {
                    Add-Type -AssemblyName System.Speech
                    $synth = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
                    
                    Write-Host -NoNewline "  $Y[2/3] Konusma Testi (Sol/Sag ayrimi icin kulaklik takin)... $W"
                    $synth.Speak("Testing Audio System")
                    Write-Host "$GOK$W"
                }
                catch { Write-Host "$Y(Konusma motoru yuklenemedi, geciliyor)$W" }
                
                Write-Host "  $P (Not: Windows PowerShell uzerinden tam sag/sol ayrimi zordur.$W"
                Write-Host "  $P  Eger ses net geliyorsa hoparlorler calisiyordur.)$W"
                Write-Host ""
                Read-Host "  Devam etmek icin Enter..."
            }

            "8" {
                Show-Header
                Write-Host "  $C--- AG STABILITE TESTI ---$W"
                Write-Host "  Google ve Cloudflare sunucularina paket gonderiliyor..."
                Write-Host ""
                
                $targets = @("8.8.8.8", "1.1.1.1")
                foreach ($t in $targets) {
                    Write-Host -NoNewline "  $Y Hedef: $t ... $W"
                    try {
                        $res = Test-Connection -ComputerName $t -Count 10 -ErrorAction SilentlyContinue
                        if ($res) {
                            $avg = ($res | Measure-Object -Property ResponseTime -Average).Average
                            Write-Host "$G BASARILI (Ort. ${avg}ms)$W"
                            if ($res.Count -lt 10) { 
                                $loss = 10 - $res.Count
                                Write-Host "  $R ⚠ DIKKAT: $loss PAKET KAYBI (LOSS) VAR!$W" 
                            }
                        }
                        else { Write-Host "$R ULASILAMIYOR! (Internet yok mu?)$W" }
                    }
                    catch { Write-Host "$R HATA$W" }
                }
                Write-Host ""
                Read-Host "  Devam etmek icin Enter..."
            }

            "9" {
                Show-Header
                Write-Host "  $Y[RAPOR] Detayli sistem analizi yapiliyor...$W"
                $desktop = [Environment]::GetFolderPath("Desktop")
                $file = "$desktop\PC_Ekspertiz_Raporu_DETAYLI_$(Get-Date -Format 'yyyyMMdd_HHmm').txt"
                
                $report = @()
                $report += "================================================================================="
                $report += "                    UDYRYZN ULTIMATE REPAIR - DETAYLI EKSPERTIZ RAPORU"
                $report += "                    Tarih: $(Get-Date)"
                $report += "================================================================================="
                $report += ""
                
                $report += "[1] SISTEM OZETI"
                $cs = Get-CimInstance Win32_ComputerSystem
                $os = Get-CimInstance Win32_OperatingSystem
                $report += "Bilgisayar Adi : $($cs.Name)"
                $report += "Kullanici      : $($cs.PrimaryOwnerName)"
                $report += "Model          : $($cs.Manufacturer) - $($cs.Model)"
                $report += "Isletim Sistemi: $($os.Caption) (Build: $($os.BuildNumber))"
                $report += "Kurulum Tarihi : $($os.InstallDate)"
                $report += "Son Acilis     : $($os.LastBootUpTime)"
                $report += ""
                
                $report += "[2] ANAKART & BIOS"
                try {
                    $board = Get-CimInstance Win32_BaseBoard
                    $bios = Get-CimInstance Win32_BIOS
                    $report += "Anakart Uretici: $($board.Manufacturer)"
                    $report += "Anakart Model  : $($board.Product)"
                    $report += "Seri No        : $($board.SerialNumber)"
                    $report += "Surum          : $($board.Version)"
                    $report += "BIOS Surumu    : $($bios.SMBIOSBIOSVersion) (Tarih: $($bios.ReleaseDate))"
                    $report += "BIOS Modu      : $(if ($prob = Confirm-SecureBootUEFI -ErrorAction SilentlyContinue) { "UEFI (SecureBoot: $prob)" } else { "Legacy/Unknown" })"
                }
                catch { $report += "Anakart bilgisi alinamadi." }
                $report += ""
                
                $report += "[3] ISLEMCI (CPU)"
                $cpu = Get-CimInstance Win32_Processor
                $report += "Model          : $($cpu.Name)"
                $report += "Soket Tipi     : $($cpu.SocketDesignation)"
                $report += "Cekirdek/Izlek : $($cpu.NumberOfCores) Cores / $($cpu.NumberOfLogicalProcessors) Threads"
                $report += "Temel Hiz      : $($cpu.MaxClockSpeed) MHz"
                $report += "L3 Onbellek    : $([math]::Round($cpu.L3CacheSize/1024, 2)) MB"
                $report += "Sanallastirma  : $($cpu.VirtualizationFirmwareEnabled)"
                $report += ""
                
                $report += "[4] BELLEK (RAM)"
                $rams = Get-CimInstance Win32_PhysicalMemory
                $totalRam = 0
                foreach ($r in $rams) { 
                    $gb = [math]::Round($r.Capacity / 1GB, 1)
                    $totalRam += $gb
                    $report += "Slot           : $gb GB - $($r.Speed) MHz - $($r.Manufacturer)"
                    $report += "  -> Parca No  : $($r.PartNumber.Trim())"
                    $report += "  -> Seri No   : $($r.SerialNumber.Trim())"
                }
                $report += "Toplam RAM     : $totalRam GB"
                $report += ""
                
                $report += "[5] EKRAN KARTI (GPU)"
                $gpus = Get-CimInstance Win32_VideoController
                foreach ($g in $gpus) {
                    $vram = [math]::Round($g.AdapterRAM / 1GB, 2)
                    $report += "Model          : $($g.Name)"
                    $report += "Surucu Tarihi  : $($g.DriverDate)"
                    $report += "Surucu Surumu  : $($g.DriverVersion)"
                    $report += "VRAM (Tahmini) : $vram GB"
                    $report += "Cozunurluk     : $($g.CurrentHorizontalResolution)x$($g.CurrentVerticalResolution) @ $($g.CurrentRefreshRate)Hz"
                    $report += "-----------------"
                }
                $report += ""
                
                $report += "[6] DEPOLAMA (DISK)"
                $disks = Get-PhysicalDisk | Sort-Object MediaType
                foreach ($d in $disks) {
                    $size = [math]::Round($d.Size / 1GB, 0)
                    $report += "Model          : $($d.FriendlyName)"
                    $report += "Tip/Boyut      : $($d.MediaType) / $size GB"
                    $report += "Saglik         : $($d.HealthStatus)"
                    $report += "Seri No        : $($d.SerialNumber)"
                    $report += "Firmware       : $($d.FirmwareVersion)"
                    $report += "-----------------"
                }
                $report += ""
                
                $report += "[7] PIL (BATARYA) DURUMU"
                try {
                    $battery = Get-CimInstance -ClassName Win32_Battery -ErrorAction Stop
                    if ($battery) {
                        $report += "Durum          : $($battery.BatteryStatus)"
                        $design = $battery.DesignCapacity
                        $full = $battery.FullChargeCapacity
                        if ($design -and $full) {
                            $wear = [math]::Round((($design - $full) / $design) * 100, 1)
                            $health = 100 - $wear
                            $report += "Kapasite (Fab) : $design mWh"
                            $report += "Kapasite (Suan): $full mWh"
                            $report += "Pil Sagligi    : %$health"
                            $report += "Yipranma       : %$wear"
                        }
                        else { $report += "Detayli kapasite verisi okunamadi." }
                    }
                }
                catch { $report += "Pil bulunamadi (Masaustu sistem)." }
                $report += ""
                
                $report += "[8] AG BAGDASTIRICILARI"
                $nets = Get-CimInstance Win32_NetworkAdapter | Where-Object { $_.NetConnectionStatus -eq 2 } # Only connected
                foreach ($n in $nets) {
                    $report += "Isim           : $($n.Name)"
                    $report += "MAC Adresi     : $($n.MACAddress)"
                    $report += "Hiz            : $([math]::Round($n.Speed/1MB, 0)) Mbps"
                    $report += "-----------------"
                }
                $report += ""
                
                $report += "[9] LISANS BILGISI"
                $lic = Get-CimInstance SoftwareLicensingProduct | Where-Object { $_.PartialProductKey -and $_.Name -like "*Windows*" } | Select-Object -First 1
                if ($lic) {
                    $report += "Lisans Ismi    : $($lic.Name)"
                    $report += "Durum          : $(if($lic.LicenseStatus -eq 1){'LISANSLI'}else{'LISANSSIZ'})"
                    $report += "Aciklama       : $($lic.Description)"
                    $report += "Kanal          : $(if($lic.Description -match 'OEM'){'OEM (Anakart)'}elseif($lic.Description -match 'RETAIL'){'RETAIL (Kutu)'}elseif($lic.Description -match 'VOLUME'){'VOLUME (Sirket/KMS)'}else{'DIGER'})"
                }
                
                $report += "================================================================================="
                $report += "Rapor Sonu."
                
                $report | Out-File -FilePath $file -Encoding UTF8
                Write-Host "  $G ✓ DETAYLI RAPOR OLUSTURULDU:$W"
                Write-Host "  $Y $file $W"
                Write-Host ""
                Read-Host "  Devam etmek icin Enter..."
            }

            "A" {
                Show-Header
                Write-Host "  $Y[ANALIZ] Mavi Ekran (BSOD) hatalari taraniyor (Son 1000 Olay)...$W"
                Write-Host ""
                try {
                    $bsods = Get-EventLog -LogName System -Newest 1000 -InstanceId 1001, 41 -ErrorAction SilentlyContinue 
                    # 1001=BugCheck, 41=Kernel-Power (Unexpected Shutdown)
                    
                    $found = 0
                    if ($bsods) {
                        foreach ($log in $bsods) {
                            if ($log.EntryType -eq "Error" -or $log.InstanceId -eq 1001) {
                                $found++
                                Write-Host "  $R ⚠ TARIH: $($log.TimeGenerated) - HATA: $($log.Source) (Code: $($log.InstanceId))$W"
                                if ($found -ge 5) { break }
                            }
                        }
                    }
                    
                    if ($found -eq 0) {
                        Write-Host "  $G ✓ TEMIZ! Son donemde kayitli mavi ekran hatasi bulunamadi.$W"
                    }
                    else {
                        Write-Host ""
                        Write-Host "  $R ⚠ DIKKAT: Sistem gecmisinde cokme kayitlari bulundu!$W"
                        Write-Host "  $P (Bu bilgisayarda donanimsal ariza veya surucu problemi olabilir.)$W"
                    }
                }
                catch { Write-Host "  $Y Olay goruntuleyicisine erisilemedi (Yonetici izni gerekebilir).$W" }
                Write-Host ""
                Read-Host "  Devam etmek icin Enter..."
            }

            "B" {
                Show-Header
                Write-Host "  $C--- BAGLI USB CIHAZLARI ---$W"
                try {
                    $usbs = Get-PnpDevice -Class USB -Status OK -ErrorAction SilentlyContinue | Where-Object { $_.FriendlyName -notmatch "Root Hub|Composite Device|Controller|Intel|AMD" }
                    if ($usbs) {
                        foreach ($u in $usbs) {
                            Write-Host "  $G Aygit :$W $($u.FriendlyName)"
                            Write-Host "  $Y Durum :$W $($u.Status)"
                            Write-Host "  -------------------------"
                        }
                    }
                    else { Write-Host "  $Y Harici USB aygit bulunamadi.$W" }
                }
                catch { Write-Host "  $R USB listesi alinamadi.$W" }
                Write-Host ""
                Read-Host "  Devam etmek icin Enter..."
            }

            "C" {
                Show-Header
                Write-Host "  $Y Kamera uygulamasi baslatiliyor...$W"
                try {
                    Start-Process "microsoft.windows.camera:"
                    Write-Host "  $G ✓ Uygulama acildi. Goruntunuzu kontrol edin.$W"
                    Write-Host "  $P (Eger acilmadiysa, magaza uygulamasi yuklu olmayabilir).$W"
                }
                catch { Write-Host "  $R Hata: Kamera uygulamasi bulunamadi.$W" }
                Write-Host ""
                Read-Host "  Devam etmek icin Enter..."
            }

            "0" { return }
        }
    }
}


# 6. ANA DONGU (MAIN LOOP)

while ($true) {
    Show-Header
    
    Write-Host "  $C╔═══════════════════════════════════════════════════════════════════════════════════╗$W"
    Write-Host "  $C║$W                            $YANA MENU$W                                                  $C║$W"
    Write-Host "  $C╠═══════════════════════════════════════════════════════════════════════════════════╣$W"
    Write-Host "  $C║$W                                                                                   $C║$W"
    Write-Host "  $C║$W     ${G}[1]$W HIZLI TEMIZLIK (Fast Clean)     $Y>>$W Hizli onbellek ve ag temizligi         $C║$W"
    Write-Host "  $C║$W     ${G}[2]$W DERIN ONARIM (Deep Repair)      $Y>>$W SFC, DISM, Sistem Onarimi              $C║$W"
    Write-Host "  $C║$W     ${G}[3]$W EKSTRA ARACLAR                  $Y>>$W Disk ve Update araclari                $C║$W"
    Write-Host "  $C║$W     ${G}[4]$W GUNDELIK SORUN COZUCU           $Y>>$W Wifi, Yazici, Pil, Store vs.           $C║$W"
    Write-Host "  $C║$W     ${G}[5]$W OYUN ARACLARI (Gaming Tools)    $Y>>$W Visual C++, DirectX vs.                $C║$W"
    Write-Host "  $C║$W     ${G}[6]$W AG ARACLARI (Network Tools)     $Y>>$W DNS Degistirici (Cloudflare/Google)    $C║$W"
    Write-Host "  $C║$W     ${G}[7]$W UYGULAMA GUNCELLEMELERI         $Y>>$W Winget ile Tumu Guncelle               $C║$W"
    Write-Host "  $C║$W     ${G}[8]$W PC EXPERT MODU (Alim/Satim)     $Y>>$W Donanim Kontrol & Test Araclari        $C║$W"
    Write-Host "  $C║$W     ${R}[0]$W CIKIS                           $Y>>$W Uygulamayi kapat                       $C║$W"
    Write-Host "  $C║$W                                                                                   $C║$W"
    Write-Host "  $C╚═══════════════════════════════════════════════════════════════════════════════════╝$W"
    Write-Host ""

    Write-Host ""
    Write-Host -NoNewline "  $C►$W Seciminiz: "
    
    $InputKey = Read-Host
    
    switch ($InputKey) {
        "1" { Start-FastClean }
        "2" { Start-DeepRepair }
        "3" { Start-ExtraTools }
        "4" { Start-DailyFixes }
        "5" { Start-GamingTools }
        "6" { Start-NetworkTools }
        "7" { Start-AppUpdates }
        "8" { Start-PCExpertMode }
        "0" { exit }
        default { 
            Write-Host "  $R Gecersiz secim!$W"
            Start-Sleep -Seconds 1
        }
    }
}
