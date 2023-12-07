# Lokaalsete kasutajate halduse skriptid
# Küsime kasutajalt ees- ja perenime
$firstName = Read-Host -Prompt "Sisesta kasutaja eesnimi (ladina tähtedega)"
$lastName = Read-Host -Prompt "Sisesta kasutaja perekonnanimi (ladina tähtedega)"

# Kontrollime, kas sisestatud nimed koosnevad ainult ladina sümbolitest
if ($firstName -match "^[A-Za-z]+$" -and $lastName -match "^[A-Za-z]+$") {
    # Koostame kasutajanime, eemaldades eesnimest ja perenimest tühikud
    $userName = ($firstName + $lastName).Replace(" ", "").ToLower()

    # Loome uue lokaalse kasutaja
    $password = Read-Host -Prompt "Sisesta kasutaja parool" -AsSecureString
    New-LocalUser -Name $userName -FullName "$firstName $lastName" -Description "Uus lokaalne kasutaja" -Password $password -PasswordNeverExpires:$true -AccountNeverExpires:$true

    Write-Host "Lokaalne kasutaja $userName on edukalt loodud."
} else {
    Write-Host "Palun sisestage ainult ladina tähestikuga ees- ja perekonnanimi!"
}