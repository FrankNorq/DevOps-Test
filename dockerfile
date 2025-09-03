# ======= Dev-image för Vite =======
FROM node:20-alpine

WORKDIR /app

# Snabbare builds: kopiera bara beroendefiler först
COPY package*.json ./
RUN npm ci

# Kopiera resten av koden
COPY . .

# Vite kör på 5173 i dev-läge
EXPOSE 5173

# Starta dev-servern
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
