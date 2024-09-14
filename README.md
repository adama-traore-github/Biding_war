

## README

Ce projet est une application web de gestion des enchères , permettant aux utilisateurs de créer, gérer et participer à des enchères sur divers produits. Il utilise le framework Ruby on Rails et repose sur plusieurs fonctionnalités clés comme l'authentification des utilisateurs via Devise, la gestion des rôles, et la création et la gestion des enchères. Active Storage est intégré pour gérer les fichiers et les images associés aux produits, assurant ainsi un stockage et une gestion efficaces des fichiers téléversés. Pour démarrer avec le projet, clonez le dépôt avec la commande `git clone <URL_DU_REPOSITORY>`, puis installez les dépendances en exécutant `bundle install`. Configurez la base de données avec `rails db:create db:migrate`, et lancez le serveur avec `rails server`. Assurez-vous également de configurer Active Storage en exécutant `rails active_storage:install` . 

**Structure complete du projet**

    */app/admin/*
    */app/assets/*
    */app/channels/*
    */app/controller/*
    */app/helpers/*
    */app/javascript/*
    */app/jobs/*
    */app/mailers/*
    */app/models/*
    */app/views/*
    */bin/*
    */config/*
    */db/*
    */lib/*
    */log/*
    */node_modules/*
    */public/*
    */storage/*
    */test/*
    */tmp/*
    */vendor/*
    */.browserslistrc*
    */.gitattributes*
    */.gitignore*
    */.ruby-version*
    */badel.config.js*
    */biding_war_development.sql*
    */config.ru*
    */Gemfile*
    */Gemfile.lock*
    */package-lock.json*
    */package.json*
    */postcss.config.js*
    */Rakefile*
    */README.md*
    */yarn.lock*

**Tache du Developer Back-end**



    *Conception de la Base de Données et Modélisation des Données :*

        Définissez les schémas de la base de données pour les utilisateurs, les objets en vente, les enchères et les transactions.
        Créez des migrations pour gérer les changements de schéma de manière contrôlée.

    *Développement des Modèles :*

        Créez des modèles pour gérer les informations des utilisateurs, y compris l'authentification et l'autorisation.
        Définissez des modèles pour les objets en vente, les enchères et les transactions.

    
    *Sécurité et Authentification :*

        Gérez les rôles et les permissions pour assurer que seuls les utilisateurs autorisés peuvent accéder à certaines fonctionnalités.
        

    *Gestion des Transactions :*

        Intégrez des services de paiement pour gérer les transactions financières.
        Implémentez des fonctionnalités pour suivre l'état des transactions (paiement en attente, livré, etc.).

    *Gestion des Notifications :*

        Implémentez un système pour envoyer des notifications par e-mail ou des notifications in-app pour les nouvelles offres, la fin des enchères, et les finalisations de vente.
        Utilisez WebSockets pour permettre les mises à jour en temps réel des enchères.

    *Panneau Administratif :*

        Utilisez ActiveAdmin pour créer une interface de gestion des utilisateurs, des enchères, et des transactions.
        Développez des fonctionnalités spécifiques pour permettre aux administrateurs de gérer les utilisateurs, les enchères, et les transactions.

    *Tests et Débogage :*

        Écrivez des tests unitaires et d'intégration pour assurer la qualité et la robustesse du code.
        Effectuez des opérations de débogage pour identifier et corriger les bugs dans le code backend.



**Payement**
    
    *1 - Les utilisateurs peuvent interagir avec les enchères, et leurs offres sont enregistrées.*

    *2 - Le bouton de paiement Stripe est automatiquement désactivé tant que l'enchère n'est pas terminée.*

    *3 - Une fois l'enchère terminée, le bouton de paiement est activé uniquement pour l'utilisateur qui a remporté l'enchère.*

    *4 - La sécurité est renforcée dans le contrôleur pour s'assurer que seuls les gagnants peuvent effectuer un paiement.*

**Maildev**

*Maildev est un outil simple pour tester les emails en développement local.*
*Pour l'executer dans le projet il suffit de lancé le serveur par ``maildev`` dans le terminale du projet*
*Au niveau du navigateur on clique sur la barre de recherche et taper ``localhost:1080`` *
