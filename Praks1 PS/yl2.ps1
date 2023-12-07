# Küsime kasutajalt ees- ja perekonnanime
$firstName = Read-Host -Prompt "Sisesta kasutaja eesnimi"
$lastName = Read-Host -Prompt "Sisesta kasutaja perekonnanimi"

# Loome kasutajanime
$userName = ($firstName + $lastName).Replace(" ", "").ToLower()

# Kustutame vastava kasutajanimega lokaalse kasutaja
try {
    Remove-LocalUser -Name $userName -ErrorAction Stop

    Write-Host "Kasutaja $userName on edukalt kustutatud."
} catch {
    Write-Host "Kasutaja kustutamine ebaõnnestus või kasutajat $userName ei leitud."
}