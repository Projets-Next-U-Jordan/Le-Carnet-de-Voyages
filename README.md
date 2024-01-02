# Mini-Projet Rails : "Le Carnet de Voyages"
## Description du Projet
Créer une application Rails "Le Carnet de Voyages" où les utilisateurs peuvent enregistrer des détails
sur leurs voyages, y compris les destinations, les dates, et les expériences.
## Objectifs Pédagogiques
Tldr; Tout se qui tourne autours de l’accès à une donnée SQL
- Comprendre et utiliser les routes, modèles, vues, et contrôleurs dans Rails.
- Pratiquer l'écriture de migrations.
- Explorer les relations entre les modèles.
- Utiliser ActiveRecord pour les requêtes de base de données.
## Étapes du Projet
### Étape 1 : Configuration de Base
- Créer une nouvelle application Rails.
- Créer un modèle `User` avec les attributs : nom,  email.
- Créer un modèle `Trip` (Voyage) avec les attributs : destination, description, date de début, date
de fin.
- Établir une relation `one-to-many` entre `User` et `Trip` .
### Étape 2 : Manipulation des Données
- Créer des routes RESTful pour `User` et `Trip` .
- Dans le contrôleur `Trips` , ajouter des actions pour afficher, créer, modifier, et supprimer des
voyages.
- Créer des vues simples pour ces actions.
### Étape 3 : Requêtes et Affichage
- Créer une page d'accueil listant tous les voyages.
### Étape 4 : Finitions et Style
- Utiliser CSS pour améliorer l'apparence des pages.
### <u><i>Points Bonus</i></u>
- Formulaires de création de `Trip`
## Caisse à Outils
### Commandes Rails Utiles
- `rails new <nom_app>` : Créer une nouvelle application Rails.
- `rails g model <nom_model>` : Générer un nouveau modèle.
- `rails g controller <nom_controller>` : Générer un nouveau contrôleur.
- `rails db:migrate` : Exécuter les migrations de base de données.
- `rails s` : Lancer le serveur Rails.
### Syntaxes ActiveRecord
- `User.find(id)` : Trouver un utilisateur par son ID.
- `User.create(name: 'Alice', email: 'alice@example.com')` : Créer un nouvel utilisateur.
- `Trip.where(user_id: user.id)` : Trouver tous les voyages d'un utilisateur.
- `@trip.destroy` : Supprimer un voyage.
### Relations
- `user.trips.create(destination: 'Paris')` : Créer un voyage associé à un utilisateur.
### Validations
- Dans le modèle : `validates :name, presence: true` .
### Établir la Relation One-to-Many
#### Étape 1 : Création des Modèles
- Créer les modèles `User` et `Trip` .
- Utiliser `user:references` dans le modèle `Trip` pour générer une clé étrangère `user_id` .
#### Étape 2 : Définir la Relation dans les Modèles
- Dans `app/models/user.rb` : Ajouter `has_many :trips` .
- Dans `app/models/trip.rb` : Ajouter `belongs_to :user` .
#### Étape 3 : Migration de la Base de Données
- Exécuter `rails db:migrate` pour mettre à jour la base de données.
#### Utilisation de la Relation
- Créer des voyages associés à un utilisateur avec `user.trips.create` .
---
# Deadline 
# À retourner à cet email <a href="mailto:nextu@sidali.dev">nextu@sidali.dev</a> pour le `11 Janvier 2024`

# Instructions 
- Rapport de moins de 10 pages 
- Pourquoi j'ai fait ci et ca
- Incomprehensions
- Conclusion

---