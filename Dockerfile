# Usa Node 20 LTS
FROM node:20-alpine

# Crea e usa la directory app
WORKDIR /app

# Copia package.json e package-lock.json prima, per sfruttare la cache dei layer
COPY package*.json ./

# Installa le dipendenze in produzione
RUN npm install

# Copia il resto dei file del progetto
COPY . .

# Costruisci l'app Next.js
RUN npm run build

# Espone la porta 3000
EXPOSE 3000

# Avvia Next.js in modalità produzione
CMD ["npm", "start"]
