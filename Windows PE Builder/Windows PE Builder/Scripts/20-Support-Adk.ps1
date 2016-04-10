#
# Initialize.ps1
#

# �X�N���v�g������t�H���_�[
$script:ProjectDirectoryPath = ""
$global:BuildedWindowsPePath = "WindowsPE-%PlatformId%.iso"
$global:BaseBatchPath = "assets\Base_BuildPe.txt"
$global:CancelBatchPath = "assets\Base_BuildPe_RequestCancel.txt"
$global:BaseExportReFromWimPath = "assets\Base_ExportReFromWim.txt"

# Build-Pe�R�}���h�̃p�X
$global:BuildPeBatPath = "Build-Pe.bat"
$global:CleanUpPeBatPath = "CleanUp-BuildedPe.bat"
$global:ExportReBatPath = "Export-WindowsRe.bat"

# ADK�֘A�̃p�X
$global:DeploymentToolsPath = "Assessment and Deployment Kit\Deployment Tools\"
$global:DandISetEnvPath = "DandISetEnv.bat"
$global:WinPePath = "Assessment and Deployment Kit\Windows Preinstallation Environment\"
$global:WinPeOcsDirectoryPath = "WinPE_OCs\"
$global:EfisysNoPromptPath = "Oscdimg\efisys_noprompt.bin"
$global:CopyPePath = "copype.cmd"
$global:MakeWinPEMediaPath = "MakeWinPEMedia.cmd"



# Ghost�̃p�X
if ([Environment]::Is64BitProcess -eq $true)
{
    if ((Test-Path -Path HKLM:SOFTWARE\Wow6432Node\Symantec\Ghost) -eq $true)
    {
        $global:GhostPath = $(Get-ItemProperty -Path HKLM:SOFTWARE\Wow6432Node\Symantec\Ghost).InstallDir
        $global:GhostPath = Join-Path $global:GhostPath "bootwiz\OEM\GSS\winpe\%PlatformId%\Base\mount"
    }
}
else
{
    if ((Test-Path -Path HKLM:SOFTWARE\Symantec\Ghost) -eq $true)
    {
        $global:GhostPath = $(Get-ItemProperty -Path HKLM:SOFTWARE\Symantec\Ghost).InstallDir
        $global:GhostPath = Join-Path $global:GhostPath "bootwiz\OEM\GSS\winpe\%PlatformId%\Base\mount"
    }
}
