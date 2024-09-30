# Gunakan image resmi Node.js untuk frontend
FROM node:18 AS frontend

WORKDIR /app/frontend

COPY frontend/package.json frontend/package-lock.json ./
RUN npm install

COPY frontend/ ./
# Gunakan npm run build untuk menghasilkan output
RUN npm run build
