#Utiliser une image Node.js officielle pour installer json-server
FROM node:18
#Définir le répertoire de travail dans le conteneur
WORKDIR /app
#Copier le package.json et le package-lock.json
COPY package*.json ./
#Installer les dépendance
RUN npm install
#Copier le code source de l'application
COPY . .
#Exposer le port par défaut utilisé par json-server
EXPOSE 3000
#Ajouter un fichier JSON de données initiales (si non fourni)
COPY db.json /app/db.json
#Commande pour lancer json-server
CMD ["npx", "json-server", "--watch", "/app/db.json", "--host", "0.0.0.0"]

