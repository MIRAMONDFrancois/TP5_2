# Programmation d'une transaction

## Description

La table Invoice a une clé auto-générée (cf. le [schéma de la base](`src/test/resources/invoice/schema.sql`).

Pour traiter les clé auto-générées avec JDBC, voir [cet exemple](`https://java.developpez.com/faq/jdbc/?page=Les-instructions-moins-Statement-Generalites#Comment-recuperer-les-clefs-autogenerees-par-l-execution-du-Statement`)

## Dépendances

Le fichier pom.xml contient les dépendances vers le driver JDBC de HSQLDB, et vers
l'outil sqltool qui permet d'exécuter les instructions SQL d'initialisation.

