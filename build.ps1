# Code provided by Greep

$compress = @{
    Path = "./info.toml", "./src"
    CompressionLevel = "Fastest"
    DestinationPath = "./ClipChrono.op"
}

Compress-Archive -Force @compress

Write-Host("✅ Done!")