#!/bin/bash

# Defina as variáveis de usuário e senha
usuario="{Usuario}"
senha="{Senha}"

# Comando para conectar ao MongoDB e excluir os bancos de dados
comando="use admin;
         db.auth('$usuario', '$senha');
         dbs = db.adminCommand('listDatabases');
         dbs.databases.forEach(function(d) {
            if (['admin', 'local', 'config'].indexOf(d.name) === -1) {
                db.getSiblingDB(d.name).dropDatabase();
            }
         })"

# Execute o comando no mongosh
echo "$comando" | mongosh
