# Gestion de Stock - Application Jakarta EE

Application web de gestion de stock développée avec Jakarta EE 10 pour une entreprise de produits technologiques.

## Technologies utilisées

- Jakarta EE 10
  - Jakarta Servlet 6.0
  - Jakarta Persistence (JPA)
  - Jakarta CDI
  - EJB
- Payara Server 6
- PostgreSQL
- Maven
- Bootstrap 5

## Fonctionnalités

- Gestion des marques
  - Création et suppression
  - Liste des marques avec leur origine
  - Association avec les produits

- Gestion des produits
  - CRUD complet
  - Association avec une marque
  - Caractéristiques (prix, poids, volume)
  - Listing filtré par marque

- Gestion des stocks
  - Suivi des quantités par produit
  - Entrées/Sorties de stock
  - Multiple sites de stockage

- Système d'authentification
  - Inscription utilisateur
  - Connexion sécurisée
  - Gestion des rôles (Admin/User)

## Installation

1. Prérequis
   - JDK 17 ou supérieur
   - Maven 3.8+
   - Payara Server 6
   - PostgreSQL 12+

2. Configuration de la base de données
   ```sql
   CREATE DATABASE gestionstock;
   ```

3. Configuration Payara
   - Créer un pool de connexion JDBC
   - Créer la ressource JDBC : `jdbc/GestionStockDS`

4. Déploiement
   ```bash
   mvn clean package
   # Copier le WAR généré dans le dossier autodeploy de Payara
   ```

## Comptes de test

- Admin : 
  - Login : `admin`
  - Mot de passe : `admin123`

- Utilisateur : 
  - Login : `user`
  - Mot de passe : `user123`

## Structure du projet

```
src/
├── main/
│   ├── java/
│   │   └── com/
│   │       └── gestionstock/
│   │           ├── entity/
│   │           ├── service/
│   │           ├── servlet/
│   │           ├── filter/
│   │           └── util/
│   ├── resources/
│   │   └── META-INF/
│   └── webapp/
│       └── WEB-INF/
└── test/
```

## Développement

Ce projet a été développé dans le cadre d'un TP Jakarta EE, démontrant l'utilisation des technologies Jakarta EE modernes pour créer une application web d'entreprise. 