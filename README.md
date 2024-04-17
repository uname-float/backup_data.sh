# Scripting del Database PostgreSQL con Bash

Questo progetto consiste in una serie di script Bash per l'automatizzazione di operazioni nel database PostgreSQL.

## Requisiti

- PostgreSQL installato sul sistema
- Accesso al database PostgreSQL con le credenziali appropriate
- Bash (lo scripting è stato testato su Linux, ma potrebbe funzionare su altri sistemi Unix-like)

## Struttura del progetto

- `soon`: Script per la configurazione iniziale del database.
- `backup_data.sh.sh`: Script per il backup del database.
- `soon`: Script per il ripristino del database da un backup.
- `soon`: Script per eseguire gli aggiornamenti del database.
- `soon`: Script contenente query SQL per operazioni specifiche nel database.

## Configurazione

1. Assicurati che PostgreSQL sia installato sul tuo sistema.
2. Modifica le variabili nel file `backup_data.sh` con le tue impostazioni di connessione al database.

## Funzionalità aggiuntive

Lo script offre le seguenti funzionalità aggiuntive:

- **Copia automatica dei database**: Lo script può eseguire automaticamente una copia dei database PostgreSQL.
- **Salvataggio locale o eliminazione delle copie**: Dopo aver eseguito il backup, lo script può salvare le copie dei database in locale o eliminarle per risparmiare spazio.
- **Copia tramite SSH su un server remoto**: Lo script offre la possibilità di eseguire una copia dei database su un server remoto tramite SSH per garantire la sicurezza e la ridondanza dei dati.

## Configurazione aggiuntiva

1. Assicurati che il server remoto sia accessibile tramite SSH e che le credenziali di accesso siano corrette.
2. Configura le impostazioni di salvataggio locale o eliminazione delle copie nei file di configurazione appropriati.
3. Configura le impostazioni di connessione SSH nel file `backup_data.sh`.

## Come usare le nuove funzionalità

1. Utilizza le opzioni aggiuntive fornite negli script per eseguire il backup e la gestione delle copie dei database.
2. Segui le istruzioni aggiornate fornite negli script per configurare e utilizzare le nuove funzionalità.

## Impostazione variabili ambiente

REMOTE_HOST="192.168.1.33"
REMOTE_USER="remote"
REMOTE_DIR="/home/remote/BACKUP"
LOCAL_BACKUP_DIR="/home/remote"
SERVER="192.168.1.32"

## Esempi di utilizzo delle nuove funzionalità

- Esegui il backup del database e salva le copie in locale:
```bash
./backup_data.sh

## Come usare gli script

1. Assicurati che tutti i requisiti siano soddisfatti e che le variabili di connessione al database siano corrette.
2. Esegui gli script desiderati dalla riga di comando, ad esempio:

```bash
./backup_data.sh


