#!/bin/bash

PRIMARY_DB=heroku-00
SECONDARY_DB=postgres-01

ENGINES=./engines
CONFIGURATION=./scripts/setup.sql

## copy files
cp $ENGINES/* $SYMMETRICDS_HOME/engines

symadmin --engine $PRIMARY_DB create-sym-tables
dbimport --engine $PRIMARY_DB $CONFIGURATION
