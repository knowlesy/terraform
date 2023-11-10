# Hyper-V

## WINRM

This is in a lab with no DC so this will be using basic authentication which is not advisable

Configure Winrm as follows

    #CMD
    winrm quickconfig
    winrm set winrm/config/service/auth @{Basic="true"}
    winrm set winrm/config/service @{AllowUnencrypted="true"}
    winrm set winrm/config/service/auth @{CbtHardeningLevel="relaxed"}
    winrm set winrm/config/client/auth @{Basic="true"}
    winrm set winrm/config/client @{AllowUnencrypted="true"}

    #Powershell
    Set-Item WSMan:localhost\client\trustedhosts -value *


    #Any
    winrm identify -r:http://winrm_server:5985 -auth:basic -u:user_name -p:password -encoding:utf-8
