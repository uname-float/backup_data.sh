#!/bin/bash

# Configurazione
REMOTE_HOST="192.168.1.66"
REMOTE_USER="remote"
REMOTE_DIR="/home/remote/BACKUP-POSTGRESQL-49"
LOCAL_BACKUP_DIR="/home/remote"
SERVER="192.168.1.49"

# Recupera la data corrente
CURRENT_DATE=$(date +%Y-%m-%d-%H-%M-%S)

# Crea la directory di backup sul server remoto
REMOTE_DIR="$REMOTE_DIR/$CURRENT_DATE"
ssh "$REMOTE_USER@$REMOTE_HOST" "mkdir -p $REMOTE_DIR" "$REMOTE_DIR" 2>&1

# Recupera l'elenco dei database PostgreSQL
echo "Recupero dell'elenco dei database PostgreSQL..."
DATABASES=$(psql -U postgres -h 192.168.1.49 -lqt | cut -d \| -f 1 | grep -vE '^-|^List|^Name' | awk NF)

# Elenco dei database da eseguire il backup
#DATABASES="artecielo" "artecielo2" "artecielo_web"

# Visualizza l'elenco dei database
echo "Elenco dei database:"
echo "$DATABASES"

echo "Esecuzione del backup dei database PostgreSQL..."

# Effettua il backup di ciascun database
for DB in $DATABASES; do
    # Abbrevia il nome del database
    DB_SHORT=$(echo "$DB" | cut -c 1-10)  # Abbrevia il nome a 10 caratteri, puoi regolarlo secondo le tue esigenze
    echo "Backup del database $DB..."
    pg_dump -U postgres -h "$SERVER" -d "$DB" > "$LOCAL_BACKUP_DIR/$DB_SHORT.sql"
    echo "Compressione del backup del database $DB..."
    tar -czf "$LOCAL_BACKUP_DIR/$DB.tar.gz" -C "$LOCAL_BACKUP_DIR" "$DB_SHORT.sql"
    echo "Trasferimento del backup del database $DB su $REMOTE_HOST..."
    scp "$LOCAL_BACKUP_DIR/$DB.tar.gz" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
    echo "Rimozione del backup del database $DB locale..."
    rm "$LOCAL_BACKUP_DIR/$DB_SHORT.sql" "$LOCAL_BACKUP_DIR/$DB.tar.gz"
done

echo "Backup completato!"
