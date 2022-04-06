GITHUB_BASE_URL="https://github.com/Bahmni/bahmni-scripts/tree/BAH-1315/demo/db-backups/v0.93"

OPENELIS_SQL_FILE="clinlims_backup.sql"
ODOO_SQL_FILE="odoo_backup.sql"
OPENMRS_SQL_FILE="openmrs_backup.sql"
BAHMNIPACS_SQL_FILE="bahmni_pacs_backup.sql"
PACSDB_SQL_FILE="pacs_db_backup.sql"
DEST_LOCATION="/home/vagrant/dbRestore"

OPENMRS_DB_NAME="openmrs"
OPENELIS_DB_NAME="clinlims"
ODOO_DB_NAME="odoo"
BAHMNIPACS_DB_NAME="bahmni_pacs"
PACS_DB_NAME="pacsdb"


 setup(){
 	rm -rf $DEST_LOCATION
 	mkdir $DEST_LOCATION
 }

download_and_unzip(){
  wget -O $DEST_LOCATION/$OPENELIS_SQL_FILE.gz $GITHUB_BASE_URL/$OPENELIS_SQL_FILE.gz
  wget -O $DEST_LOCATION/$ODOO_SQL_FILE.gz $GITHUB_BASE_URL/$ODOO_SQL_FILE.gz
  wget -O $DEST_LOCATION/$OPENMRS_SQL_FILE.gz $GITHUB_BASE_URL/$OPENMRS_SQL_FILE.gz
  wget -O $DEST_LOCATION/$BAHMNIPACS_SQL_FILE.gz $GITHUB_BASE_URL/$BAHMNIPACS_SQL_FILE.gz
  wget -O $DEST_LOCATION/$PACSDB_SQL_FILE.gz $GITHUB_BASE_URL/$PACSDB_SQL_FILE.gz

	gzip -d $DEST_LOCATION/$OPENELIS_SQL_FILE.gz $DEST_LOCATION/$ODOO_SQL_FILE.gz $DEST_LOCATION/$OPENMRS_SQL_FILE.gz $DEST_LOCATION/$BAHMNIPACS_SQL_FILE.gz $DEST_LOCATION/$PACSDB_SQL_FILE.gz
}
restore(){
	echo "Restoring the database"
	bahmni -i local stop
	mysql -uroot -pP@ssw0rd -e "drop database $OPENMRS_DB_NAME"
	mysql -uroot -pP@ssw0rd -e "create database $OPENMRS_DB_NAME"
	mysql -uroot -pP@ssw0rd $OPENMRS_DB_NAME < $DEST_LOCATION/$OPENMRS_SQL_FILE
	mysql -uroot -pP@ssw0rd -e "FLUSH PRIVILEGES"

	ps aux | grep -ie $ODOO_DB_NAME | awk '{print $2}' | xargs kill -9
	psql -Uodoo -c  "drop database if exists $ODOO_DB_NAME;"
	psql -Uodoo -c  "create database $ODOO_DB_NAME;"
	psql -Uodoo $ODOO_DB_NAME < $DEST_LOCATION/$OPENELIS_SQL_FILE
	psql -Uodoo -c "ALTER DATABASE $ODOO_DB_NAME OWNER TO odoo;"

	ps aux | grep -ie $OPENELIS_DB_NAME | awk '{print $2}' | xargs kill -9
	psql -Upostgres -c "drop database if exists $OPENELIS_DB_NAME;"
	psql -Upostgres -c "create database $OPENELIS_DB_NAME;"
	psql -Upostgres $OPENELIS_DB_NAME < $DEST_LOCATION/$ODOO_SQL_FILE

	ps aux | grep -ie $BAHMNIPACS_DB_NAME | awk '{print $2}' | xargs kill -9
	psql -Upostgres -c  "drop database if exists $BAHMNIPACS_DB_NAME;"
	psql -Upostgres -c  "create database $BAHMNIPACS_DB_NAME;"
	psql -Upostgres $BAHMNIPACS_DB_NAME < $DEST_LOCATION/$BAHMNIPACS_SQL_FILE

  ps aux | grep -ie $PACS_DB_NAME | awk '{print $2}' | xargs kill -9
	psql -Upostgres -c  "drop database if exists $PACS_DB_NAME;"
	psql -Upostgres -c  "create database $PACS_DB_NAME;"
	psql -Upostgres $PACS_DB_NAME < $DEST_LOCATION/$PACSDB_SQL_FILE

	bahmni -i local start
}

setup
download_and_unzip
restore