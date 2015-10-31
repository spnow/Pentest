$buf = 'test'
echo ([Convert]::ToBase64String(([System.Text.Encoding]::Unicode.GetBytes($buf))))
