#
# Initialize.ps1
#

# �X�N���v�g������t�H���_�[
$Global:BuildedWindowsPePath = "WindowsPE-%PlatformId%.iso"
$Global:BaseBatchPath = "Base\BuildPe.txt"
$Global:CancelBatchPath = "Base\BuildPe-RequestCancel.txt"
$Global:BaseExportReFromWimPath = "Base\ExportReFromWim.txt"

# Build-Pe�R�}���h�̃p�X
$Global:BuildPeBatPath = "Build-Pe.bat"
$Global:CleanUpPeBatPath = "CleanUp-BuildedPe.bat"
$Global:ExportReBatPath = "Export-WindowsRe.bat"

# ADK�֘A�̃p�X
$Global:DeploymentToolsPath = "Assessment and Deployment Kit\Deployment Tools\"
$Global:DandISetEnvPath = "DandISetEnv.bat"
$Global:WinPePath = "Assessment and Deployment Kit\Windows Preinstallation Environment\"
$Global:WinPeOcsDirectoryPath = "WinPE_OCs"
$Global:EfisysNoPromptPath = "Oscdimg\efisys_noprompt.bin"
$Global:CopyPePath = "copype.cmd"
$Global:MakeWinPEMediaPath = "MakeWinPEMedia.cmd"



# Ghost�̃p�X
If ([Environment]::Is64BitProcess -eq $True)
{
    If ((Test-Path -Path HKLM:SOFTWARE\Wow6432Node\Symantec\Ghost) -eq $True)
    {
        $Script:GhostPath = $(Get-ItemProperty -Path HKLM:SOFTWARE\Wow6432Node\Symantec\Ghost).InstallDir
        $Script:GhostPath = Join-Path $Script:GhostPath "bootwiz\OEM\GSS\winpe\%PlatformId%\Base"
    }
}
Else
{
    If ((Test-Path -Path HKLM:SOFTWARE\Symantec\Ghost) -eq $True)
    {
        $Script:GhostPath = $(Get-ItemProperty -Path HKLM:SOFTWARE\Symantec\Ghost).InstallDir
        $Script:GhostPath = Join-Path $Script:GhostPath "bootwiz\OEM\GSS\winpe\%PlatformId%\Base"
    }
}
