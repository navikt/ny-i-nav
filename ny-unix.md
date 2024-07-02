# Oppsett for ny Mac eller Linux

Når man nettopp har startet som utvikler, dataanalytiker, eller dataengineer i utvikling og data er det mye programvare og tilgang som må settes opp!
Denne guiden vil prøve å ta deg gjennom de fleste viktige stegene for å gi deg de verktøyene du trenger i ditt daglig bruk.
Noen av stegene er ikke nødvendige for alle og vi vil prøve å merke de som er spesifikt for en gruppe.

## Sett opp NAV-kontoen din

Når du starter i NAV får du utdelt en NAV-ident og en e-post (fornavn.etternavn@nav.no) basert på ditt navn.
Det første du da må gjøre med den kontoen er å tilbakestille passordet som er angitt.
Et annet navn for NAV-konto er AD-konto, som er forkortelse for Active Directory.

1. Gå til Microsoft Password Reset: [Password reset](https://aka.ms/sspr)
2. Følg trinnene på nettsiden

## Tilgang til Slack

Før du kan få en kompatibel enhet, trenger du tilgang til Slack.

1. Gå til [MyApps](https://myapps.microsoft.com/) og klikk på `Slack - NAV IT`-appen.
2. Gå til [nav-it.slack.com](https://nav-it.slack.com).
3. Velg "Logg på med Azure" for pålogging.

Vær oppmerksom på at det finnes flere lignende Slack-arbeidsområder som ikke er den offisielle!
Den riktige er [nav-it.slack.com](https://nav-it.slack.com).

## En nais device

For å kunne få tilgang til ting i NAV må du gjøre enheten nais, og for det har vi [Naisdevice](https://docs.nais.io/operate/naisdevice/).

1. Start med å følge veiledningen for å sette opp Kolide: [Installer Kolide](https://docs.nais.io/operate/naisdevice/how-to/install-kolide/)
2. Etter det må du installere verktøyet Naisdevice: [Install Naisdevice](https://docs.nais.io/operate/naisdevice/how-to/install/)

## Tilgang til Github

Før du kan begynne å hjelpe teamet ditt med koding, må du få tilgang til [navikt](https://github.com/navikt)-organisasjonen på Github.
Du kan enten bruke din private Github-konto, eller opprette en ny NAV-spesifikk konto.

1. Aktiver tofaktorautentisering for kontoen din: [Settings/Password and authentication](https://github.com/settings/security)
    - Settings > Password and authentication
 - Det er ingen begrensninger for hvilken autentiseringsapp du bruker.
2. Legg til din NAV-spesifikke e-postadresse til kontoen din: [Settings/Emails](https://github.com/settings/emails)
    - Settings > Emails > Add email address
3. Gå til [MyApps](https://myapps.microsoft.com/) og klikk på `github.com/navikt`-appen.

For å jobbe med Github og Git lokalt trenger du enten å bruke SSH-nøkler, eller den mer moderne løsningen `gh-cli`.
Du som ønsker å bruke SHH-nøkler kan følge guiden på [docs.github.com](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
Nedenfor har vi dokumentert hvordan man bruker `gh-cli`.

1. Installer `gh-cli`: [github.com/cli](https://github.com/cli/cli#installation)
2. Logg inn og autentiser mot Github
    - `gh auth login`
3. Konfigurer `git` til å bruke `gh-cli` for autentisering.
    - `gh auth setup-git`

## Tilgang til NAIS-plattformen

De aller fleste team i NAV bruker NAIS-plattformen.
Start med å gi deg selv tilgang til Google Cloud Platform (GCP).

1. Gå til [MyApps](https://myapps.microsoft.com/) og klikk på `Google Cloud Platform`-appen.
2. (Valgfritt) få en kollega til å legge deg til i teamet du tilhører i [NAIS Console](https://console.nav.cloud.nais.io/).

NAIS tilbyr Kubernetes for å kjøre applikasjoner/containere.
For å koble seg til Kubernetes hos NAIS trenger man en bunke med verktøy.

1. Installer Kubectl: [kubernetes.io/docs](https://kubernetes.io/docs/tasks/tools/#kubectl)
    - Brukes for å interagere med Kubernetes, trenger en `kubeconfig` for å fungere.
2. Installer nais-cli: [docs.nais.io](https://docs.nais.io/operate/cli/how-to/install/)
    - Hjelpeverktøy som henter blant annet ned `kubeconfig`, men også gjør det lettere å logge inn i Google Cloud Platform (GCP).
3. Installer gcloud: [cloud.google.com](https://cloud.google.com/sdk/docs/install)
    - Verktøy for å interagere med GCP, hovedsakelig for å logge inn (trengs av `nais-cli`).
4. Installer kubectx: [github.com/ahmetb/kubectx](https://github.com/ahmetb/kubectx?tab=readme-ov-file#installation)
    - Man må ikke ha _kubectx_, men det vil gjøre hverdagen lettere når du skal interagere med Kubernetes.
    - `kubectx <din context>` for å bytte context/miljø/cluster.
    - `kubens <namespace>` for å bytte namespace (et namespace per team).
    
Etter at du har installert alle disse fire programmene kan du endelig få tatt de i bruk!

1. Logg inn med enten `nais-cli` eller `gcloud`.
    - `nais login`
    - `gcloud auth login --update-adc` (`--update-adc` er kun fordi neste steg krever det)
2. Hent ned `kubeconfig` med `nais-cli`.
    - `nais kubeconfig`
3. Sett context til `dev-gcp` (utviklingsmiljø i GCP).
    - `kubectx dev-gcp`
4. Test at du får kontakt med Kubernetes med ny `kubeconfig`.
    - `kubectl get pods`
    - Output bør være `No resources found in default namespace.`, hvis ikke har du sannsynligvis glemt å logge inn, eller du har feil `kubeconfig`.
    
## Bonuspoeng

Hvis du har lyst på en ekstra nais Mac anbefaler vi verktøyet [Priviliges](https://github.com/SAP/macOS-enterprise-privileges).
Priviliges lar deg kun ha adminpriviliger når du ber om det.

1. Følg guiden på Github: [Installation](https://github.com/SAP/macOS-enterprise-privileges/wiki/Installation)
