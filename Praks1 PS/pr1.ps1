# Lokaalsete kasutajate halduse skriptid
# K�sime kasutajalt ees- ja perenime
$firstName = Read-Host -Prompt "Sisesta kasutaja eesnimi (ladina t�htedega)"
$lastName = Read-Host -Prompt "Sisesta kasutaja perekonnanimi (ladina t�htedega)"

# Kontrollime, kas sisestatud nimed koosnevad ainult ladina s�mbolitest
if ($firstName -match "^[A-Za-z]+$" -and $lastName -match "^[A-Za-z]+$") {
    # Koostame kasutajanime, eemaldades eesnimest ja perenimest t�hikud
    $userName = ($firstName + $lastName).Replace(" ", "").ToLower()

    # Loome uue lokaalse kasutaja
    $password = Read-Host -Prompt "Sisesta kasutaja parool" -AsSecureString
    New-LocalUser -Name $userName -FullName "$firstName $lastName" -Description "Uus lokaalne kasutaja" -Password $password -PasswordNeverExpires:$true -AccountNeverExpires:$true

    Write-Host "Lokaalne kasutaja $userName on edukalt loodud."
} else {
    Write-Host "Palun sisestage ainult ladina t�hestikuga ees- ja perekonnanimi!"
}