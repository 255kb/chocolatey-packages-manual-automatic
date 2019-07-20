import-module au

$download = 'https://resonic.at/get/player'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_file = Invoke-WebRequest -Uri $download -Method Head

    $version = ($download_file.Headers["Content-Disposition"] -split ' ' | select -last 1 ).replace('.msi"', '')

    $Latest = @{ URL32 = $download; Version = $version }
    return $Latest
}

update -ChecksumFor 32 -NoCheckUrl
