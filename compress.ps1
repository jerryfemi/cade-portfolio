Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile('web\images\photo.png')
$bmp = New-Object System.Drawing.Bitmap($img, 400, 400)
$bmp.Save('web\images\photo.jpg', [System.Drawing.Imaging.ImageFormat]::Jpeg)
$bmp.Dispose()
$img.Dispose()
