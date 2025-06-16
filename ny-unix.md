# Oppsett for ny Mac eller Linux

Når man nettopp har startet som utvikler, dataanalytiker, eller dataengineer i utvikling og data er det mye programvare og tilgang som må settes opp!
Denne guiden vil prøve å ta deg gjennom de fleste viktige stegene for å gi deg de verktøyene du trenger i ditt daglig bruk.
Noen av stegene er ikke nødvendige for alle og vi vil prøve å merke de som er spesifikt for en gruppe.

## Sett opp Nav-kontoen din

Når du starter i Nav får du utdelt en Nav-ident og en e-post (fornavn.etternavn@nav.no) basert på ditt navn.
Det første du da må gjøre med den kontoen er å tilbakestille passordet som er angitt.
Et annet navn for Nav-konto er AD-konto, som er forkortelse for Active Directory.

1. Gå til Microsoft Password Reset: [Password reset](https://aka.ms/sspr)
2. Følg trinnene på nettsiden

## Tilgang til Slack

Før du kan få en kompatibel enhet, trenger du tilgang til Slack.
Dette skal du få ut av boksen så start med å last ned [Slack for Mac](https://slack.com/downloads/mac).

PS: Vi har også en one-liner for å gjøre det:

``` shell
curl -s -L -o "$(eval echo ~${USER})/Desktop/$(curl -s -L -I -o /dev/null -w '%{url_effective}' https://slack.com/ssb/download-osx | sed 's@.*/@@')" "$(curl -s -L -I -o /dev/null -w '%{url_effective}' https://slack.com/ssb/download-osx)"
```

Vær oppmerksom på at det finnes flere lignende Slack-arbeidsområder som ikke er den offisielle!
Den riktige er [nav-it.slack.com](https://nav-it.slack.com).

Og husk å logg inn med *passord*, som står med liten skrift under _Sign in with email_.
Se etter lenken _sign in manually instead_!

### Fortsatt ikke tilgang?

Hvis du ikke fikk tilgang ut av boksen kan du følge stegene nedenfor:

1. Gå til [MyApps](https://myapps.microsoft.com/) og klikk på `Slack - Nav IT`-appen.
2. Gå til [nav-it.slack.com](https://nav-it.slack.com).
3. Velg "Logg på med Azure" for pålogging.

## En nais device

Det er de samme stegene som må gjøres uavhengig av operativsystem for å gjøre din maskin Nais.
Derfor har vi samlet dokumentasjonen for det i [En Nais device](en-nais-device.md).

## Legg til skriver

Vi har et script du kan kjøre for å legge til Nav sine skrivere.
Scriptet finner du i filen [add_nav_printers.sh](./add_nav_printers.sh).
    
## Bonuspoeng

Hvis du har lyst på en ekstra nais Mac anbefaler vi verktøyet [Priviliges](https://github.com/SAP/macOS-enterprise-privileges).
Priviliges lar deg kun ha adminpriviliger når du ber om det.

1. Følg guiden på Github: [Installation](https://github.com/SAP/macOS-enterprise-privileges/wiki/Installation)
