# Programmation d'une transaction

## Description

La table Invoice a une clé auto-générée (cf. le [schéma de la base](`src/test/resources/invoice/schema.sql`)).

On aura besoin de cette clé auto-générée pour créer les enregistrements dans Item (clé étrangère).

Pour traiter les clé auto-générées avec JDBC, voir cet exemple :

```java
String commandeSQL = " ..."; 
PreparedStatement statement = connection.prepareStatement( commandeSQL, Statement.RETURN_GENERATED_KEYS) ; 
// Définir les paramètres éventuels de la requête
// ...

statement.executeUpdate(); 
// Les clefs autogénérées sont retournées sous forme de ResultSet, 
// il se peut qu'une requête génère plusieurs clés
ResultSet clefs = statement.getGeneratedKeys(); 
clefs.next(); // On lit la première clé générée
System.out.printn("La première clef autogénérée vaut " + clefs.getInt(1));   


```

## Dépendances

Le fichier pom.xml contient les dépendances vers le driver JDBC de HSQLDB, et vers
l'outil sqltool qui permet d'exécuter les instructions SQL d'initialisation.

