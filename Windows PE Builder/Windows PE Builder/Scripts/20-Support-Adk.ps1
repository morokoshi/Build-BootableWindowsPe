#
# Initialize.ps1
#

# �X�N���v�g������t�H���_�[
$script:ProjectDirectoryPath = ""
$Global:BuildedWindowsPePath = "WindowsPE-%PlatformId%.iso"
$Global:BaseBatchPath = "assets\Base_BuildPe.txt"
$Global:CancelBatchPath = "assets\Base_BuildPe_RequestCancel.txt"
$Global:BaseExportReFromWimPath = "assets\Base_ExportReFromWim.txt"

# Build-Pe�R�}���h�̃p�X
$Global:BuildPeBatPath = "Build-Pe.bat"
$Global:CleanUpPeBatPath = "CleanUp-BuildedPe.bat"
$Global:ExportReBatPath = "Export-WindowsRe.bat"

# ADK�֘A�̃p�X
$Global:DeploymentToolsPath = "Assessment and Deployment Kit\Deployment Tools\"
$Global:DandISetEnvPath = "DandISetEnv.bat"
$Global:WinPePath = "Assessment and Deployment Kit\Windows Preinstallation Environment\"
$Global:WinPeOcsDirectoryPath = "WinPE_OCs\"
$Global:EfisysNoPromptPath = "Oscdimg\efisys_noprompt.bin"
$Global:CopyPePath = "copype.cmd"
$Global:MakeWinPEMediaPath = "MakeWinPEMedia.cmd"



# Ghost�̃p�X
if ([Environment]::Is64BitProcess -eq $true)
{
    if ((Test-Path -Path HKLM:SOFTWARE\Wow6432Node\Symantec\Ghost) -eq $true)
    {
        $Global:GhostPath = $(Get-ItemProperty -Path HKLM:SOFTWARE\Wow6432Node\Symantec\Ghost).InstallDir
        $Global:GhostPath = Join-Path $Global:GhostPath "bootwiz\OEM\GSS\winpe\%PlatformId%\Base\mount"
    }
}
else
{
    if ((Test-Path -Path HKLM:SOFTWARE\Symantec\Ghost) -eq $true)
    {
        $Global:GhostPath = $(Get-ItemProperty -Path HKLM:SOFTWARE\Symantec\Ghost).InstallDir
        $Global:GhostPath = Join-Path $Global:GhostPath "bootwiz\OEM\GSS\winpe\%PlatformId%\Base\mount"
    }
}
