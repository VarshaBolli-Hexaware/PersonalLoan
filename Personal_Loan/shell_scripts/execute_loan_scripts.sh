#!/bin/bash

# Input parameters
DB_USER=$1
DB_PASSWORD=$2
DB_CONNECTION=$3
SCRIPT_DIR=$4
PROCEDURE_OR_FUNCTION_NAME=$5

# Execute the PL/SQL procedure or function
sqlplus -s $DB_USER/$DB_PASSWORD@$DB_CONNECTION <<EOF
SET SERVEROUTPUT ON;
SET FEEDBACK OFF;
SET HEADING OFF;

BEGIN
    $PROCEDURE_OR_FUNCTION_NAME;
END;
/
EXIT;
EOF

