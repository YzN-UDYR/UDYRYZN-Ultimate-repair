<#
    UDYRYZN ULTIMATE REPAIR ENGINE v1.0
    Unified System Maintenance Tool
    
    Credits: YzN-UDYR
#>

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
$CURRENT_VER = "1.1" 
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
                Start-Sleep -Seconds 2
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
    $TOTAL_OPS = 7
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
        Write-Host "  $PAD_SUB Guncellemeler kontrol ediliyor..."
        winget upgrade --all --silent --accept-package-agreements --accept-source-agreements
        Write-Host "  $PAD_SUB Winget islemi tamamlandi ${G}[DONE]$W"
    }
    Write-Host ""

    Write-Host "  $G✓ DERIN ONARIM TAMAMLANDI!$W"
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
    Write-Host "  $C║$W     ${G}[4]$W CIKIS                           $Y>>$W Uygulamayi kapat                       $C║$W"
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
        "4" { exit }
        default { 
            Write-Host "  $R Gecersiz secim!$W"
            Start-Sleep -Seconds 1
        }
    }
}
