#
# Elevation_ThisScript.ps1
#

# https://gallery.technet.microsoft.com/scriptcenter/63fd1c0d-da57-4fb4-9645-ea52fc4f1dfb
Function Global:Elevation-ThisScript
{    
    param([Switch]$Check) 
     
    $IsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()` 
        ).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator") 
         
    If ($Check) { Return $IsAdmin }     
 
    If ($MyInvocation.ScriptName -ne "") 
    {  
        If (-not $IsAdmin)  
        {  
            try 
            {  
                $arg = "-file `"$($MyInvocation.ScriptName)`"" 
                Start-Process "$psHome\powershell.exe" -Verb Runas -ArgumentList $arg -ErrorAction 'stop'  
            } 
            catch 
            { 
                Write-Warning "�Ǘ��Ҍ��������郆�[�U�[�ŃT�C���C�����Ă�����s���Ă�������"  
                break               
            } 
            exit # Quit this session of powershell 
        }  
    }  
    Else  
    {  
        Write-Warning "�Ǘ��Ҍ��������郆�[�U�[�ŃT�C���C�����Ă�����s���Ă�������"  
        break  
    }  
} 
