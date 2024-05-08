#!/bin/bash

# Define a senha do PostgreSQL
export PGPASSWORD={Senha}

# Conectando ao PostgreSQL e obtendo a lista de todos os bancos de dados
databases=$(psql -U {Usuario} -lqt | cut -d \| -f 1 | grep -v -E '^(postgres|template0|template1)')

# Loop pelos bancos de dados e excluindo cada um
for db in $databases; do
    # Verifica se o nome do banco de dados não é "postgres", "template0" ou "template1"
    if [ "$db" != "postgres" ] && [ "$db" != "template0" ] && [ "$db" != "template1" ]; then
        echo "Excluindo banco de dados $db"
        dropdb -U {Usuario} $db
    fi
done
