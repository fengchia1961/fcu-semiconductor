$root = $PSScriptRoot
$port = 8765
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "Site running: http://localhost:$port/index.dc.html"
Write-Host "Close this window to stop."
Start-Process "http://localhost:$port/index.dc.html"
$types = @{ ".html"="text/html; charset=utf-8"; ".js"="application/javascript; charset=utf-8"; ".jsx"="application/javascript; charset=utf-8"; ".css"="text/css"; ".json"="application/json"; ".png"="image/png"; ".jpg"="image/jpeg"; ".jpeg"="image/jpeg"; ".svg"="image/svg+xml"; ".webp"="image/webp" }
while ($listener.IsListening) {
  $ctx = $listener.GetContext()
  $path = [System.Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath).TrimStart('/')
  if ($path -eq "") { $path = "index.dc.html" }
  $file = Join-Path $root $path
  $res = $ctx.Response
  if (Test-Path $file -PathType Leaf) {
    $ext = [System.IO.Path]::GetExtension($file).ToLower()
    $res.ContentType = if ($types.ContainsKey($ext)) { $types[$ext] } else { "application/octet-stream" }
    $bytes = [System.IO.File]::ReadAllBytes($file)
    $res.ContentLength64 = $bytes.Length
    $res.OutputStream.Write($bytes, 0, $bytes.Length)
  } else { $res.StatusCode = 404 }
  $res.Close()
}
