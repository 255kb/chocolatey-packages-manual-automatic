﻿$packageName = 'min.portable'
$url32      = 'https://github.com/minbrowser/min/releases/download/v1.19.2/Min-v1.19.2-win32-ia32.zip'
$url64      = 'https://github.com/minbrowser/min/releases/download/v1.22.1/Min-v1.22.1-win32-x64.zip'
$checksum32 = 'b924f3d3f31cc502fa82022b75632e1009d317a8c5eaf5ec01d3518571f07b81'
$checksum64 = 'cc4292394af13df35e0de6ef88cb5822859bde56dafd2867c477469ecd594c4e'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
