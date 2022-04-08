GITHUB_BASE_URL="https://github.com/Bahmni/bahmni-scripts/tree/BAH-1315/demo/db-backups/v0.93"

OPENELIS_SQL_FILE="clinlims_backup.sql"
ODOO_SQL_FILE="odoo_backup.sql"
OPENMRS_SQL_FILE="openmrs_backup.sql"
BAHMNIPACS_SQL_FILE="bahmni_pacs_backup.sql"
PACSDB_SQL_FILE="pacsdb_backup.sql"
DEST_LOCATION="/home/centos/v0.93-dbRestore"

OPENMRS_DB_NAME="openmrs"
OPENELIS_DB_NAME="clinlims"
ODOO_DB_NAME="odoo"
BAHMNIPACS_DB_NAME="bahmni_pacs"
PACS_DB_NAME="pacsdb"

SQLUSER="root"
PSQLUSER="postgres"
PASSWORD="P@ssw0rd"
PACSUSER="postgres"
CLINLIMSUSER="clinlims"
ODOOUSER="odoo"

setup(){
 	rm -rf $DEST_LOCATION
 	mkdir $DEST_LOCATION
}

download_and_unzip(){
  wget -O $DEST_LOCATION/$OPENELIS_SQL_FILE $GITHUB_BASE_URL/$OPENELIS_SQL_FILE
  wget -O $DEST_LOCATION/$ODOO_SQL_FILE $GITHUB_BASE_URL/$ODOO_SQL_FILE
  wget -O $DEST_LOCATION/$OPENMRS_SQL_FILE $GITHUB_BASE_URL/$OPENMRS_SQL_FILE
  wget -O $DEST_LOCATION/$BAHMNIPACS_SQL_FILE $GITHUB_BASE_URL/$BAHMNIPACS_SQL_FILE
  wget -O $DEST_LOCATION/$PACSDB_SQL_FILE $GITHUB_BASE_URL/$PACSDB_SQL_FILE
}

restore(){
	echo "Restoring the database"
  bahmni -i local stop

  mysql -u$SQLUSER -p$PASSWORD -e "drop database $OPENMRS_DB_NAME"
  mysql -u$SQLUSER -p$PASSWORD -e "create database $OPENMRS_DB_NAME"
  mysql -u$SQLUSER -p$PASSWORD $OPENMRS_DB_NAME < $OPENMRS_SQL_FILE
  mysql -u$SQLUSER -p$PASSWORD -e "FLUSH PRIVILEGES"

  ps aux | grep -ie $OPENELIS_DB_NAME | awk '{print $2}' | xargs kill -9
  psql -U$PSQLUSER -c "drop database if exists $OPENELIS_DB_NAME;"
  psql -U$PSQLUSER -c "create database $OPENELIS_DB_NAME;"
  psql -U$PSQLUSER $OPENELIS_DB_NAME < $OPENELIS_SQL_FILE
  psql -U$PSQLUSER -c "ALTER DATABASE $OPENELIS_DB_NAME OWNER TO $CLINLIMSUSER;"

  ps aux | grep -ie $ODOO_DB_NAME | awk '{print $2}' | xargs kill -9
  psql -U$PSQLUSER -c  "drop database if exists $ODOO_DB_NAME;"
  psql -U$PSQLUSER -c  "create database $ODOO_DB_NAME;"
  psql -U$PSQLUSER $ODOO_DB_NAME < $ODOO_SQL_FILE
  psql -U$PSQLUSER -c "ALTER DATABASE $ODOO_DB_NAME OWNER TO $ODOOUSER;"

  ps aux | grep -ie $BAHMNIPACS_DB_NAME | awk '{print $2}' | xargs kill -9
  psql -U$PSQLUSER -c  "drop database if exists $BAHMNIPACS_DB_NAME;"
  psql -U$PSQLUSER -c  "create database $BAHMNIPACS_DB_NAME;"
  psql -U$PSQLUSER $BAHMNIPACS_DB_NAME < $BAHMNIPACS_SQL_FILE

  ps aux | grep -ie $PACS_DB_NAME | awk '{print $2}' | xargs kill -9
  psql -U$PSQLUSER -c  "drop database if exists $PACS_DB_NAME;"
  psql -U$PSQLUSER -c  "create database $PACS_DB_NAME;"
  psql -U$PSQLUSER $PACS_DB_NAME < $PACSDB_SQL_FILE

  bahmni -i local start
}

setup
download_and_unzip
restore