# 💬 The Gossip Project

Bienvenue sur **The Gossip Project** !
Une application Ruby on Rails pour gérer et afficher des potins 🕵️‍♀️.

---

## 🚀 Fonctionnalités

* Accueil avec la liste des gossips
* Page individuelle pour chaque gossip (titre, contenu, auteur, date de création)
* Page auteur (informations sur l’utilisateur)
* Pages **Contact** et **Team** avec un joli affichage Bootstrap
* Navbar responsive avec Bootstrap 5

---

## 🛠️ Installation

1. **Cloner le repo**

```bash
git clone https://github.com/bbkouty/the_gossip_project.git
cd the_gossip_project
```

2. **Installer les gems**

```bash
bundle install
```

3. **Créer et migrer la base de données**

```bash
rails db:create
rails db:migrate
```

4. **Ajouter des données de test (seed)**

```bash
rails db:seed
```

5. **Lancer le serveur**

```bash
rails server
```

Puis ouvre ton navigateur sur 👉 `http://localhost:3000`

---

## 📸 Aperçu (exemple avec Bootstrap)

### Page d’accueil

* Liste des potins sous forme de cartes
* Bouton "Voir plus" pour accéder aux détails

### Page Gossip

* Titre du potin
* Contenu
* Auteur avec lien vers sa page
* Date de création

### Pages Contact & Team

* Mise en page avec Bootstrap Cards
* Navigation via la navbar

---

## 📂 Structure du projet

```
the_gossip_project/
├── app/
│   ├── controllers/    # PagesController, GossipsController, UsersController
│   ├── models/         # Gossip, User
│   ├── views/          # pages/, gossips/, users/
│   └── assets/         # CSS, JS
├── config/
│   ├── routes.rb       # Définition des routes
│   └── database.yml    # Config base de données
├── db/
│   ├── migrate/        # Migrations
│   └── seeds.rb        # Données de test
```

---

## 👥 Auteurs

Projet réalisé dans le cadre de l’apprentissage Rails.
Team :

* 🤓 [Boubacar] – Développeur principal
* 💡 Collaborateurs & contributeurs éventuels

---

## 📜 Licence

Projet open-source – libre d’utilisation pour l’apprentissage.

---
