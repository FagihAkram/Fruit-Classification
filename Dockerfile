# Gunakan image resmi Node.js untuk frontend
FROM node:18 AS frontend

WORKDIR /Fruit-Classification/frontend

COPY frontend/package.json frontend/package-lock.json ./
RUN npm install

COPY frontend/ ./
# Gunakan npm run build untuk menghasilkan output
RUN npm run build

# Gunakan image resmi Python untuk backend
FROM python:3.9 AS backend

WORKDIR /Fruit-Classification/backend

COPY backend/requirements.txt ./
RUN pip install -r requirements.txt

COPY backend/ ./

# Menjalankan backend
# CMD ["uvicorn", "main:app", "--reload"]

# Menggunakan image Node.js untuk menjalankan kedua aplikasi
FROM node:18

WORKDIR /Fruit-Classification

# Menyalin hasil build frontend
COPY --from=frontend /Fruit-Classification/frontend/ ./frontend

# Menyalin backend
COPY --from=backend /Fruit-Classification/backend/ ./backend

# Install concurrently untuk menjalankan kedua proses
RUN npm install -g concurrently

# Menjalankan kedua aplikasi secara bersamaan
CMD ["concurrently", "npm run dev --prefix frontend", "uvicorn main:app --reload --prefix backend"]
