#!/bin/bash

# Conectando ao MariaDB e obtendo a lista de todos os bancos de dados
databases=$(/usr/bin/mariadb -u {Usuario} -p{Senha} -e "SHOW DATABASES;" | grep -v 'Database')

# Loop pelos bancos de dados e excluindo cada um
for db in $databases; do
    # Verifica se o banco de dados não é um banco de dados do sistema
    if [[ "$db" != "mysql" && "$db" != "information_schema" && "$db" != "performance_schema" && "$db" != "sys"]]; then
        echo "Excluindo banco de dados $db"
        /usr/bin/mariadb -u {Usuario} -p{Senha} -e "DROP DATABASE $db;"
    fi
done
