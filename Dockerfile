# Gunakan image resmi Node.js untuk frontend
FROM node:18 AS frontend

WORKDIR /app/frontend

COPY frontend/package.json frontend/package-lock.json ./
RUN npm install

COPY frontend/ ./
# Gunakan npm run build untuk menghasilkan output yang akan disajikan
CMD npm run dev

# Gunakan image resmi Python untuk backend
FROM python:3.9 AS backend

WORKDIR /app/backend

COPY backend/requirements.txt ./
RUN pip install -r requirements.txt

COPY backend/ ./

# Menjalankan backend
CMD ["uvicorn", "main:app", "--reload"]

# Menggabungkan frontend dan backend
FROM nginx:alpine

# Pastikan untuk meng-copy hasil build dari frontend ke nginx
COPY --from=frontend /app/frontend /usr/share/nginx/html
COPY --from=backend /app/backend /usr/share/nginx/html/backend

# Menjalankan Nginx
CMD ["nginx", "-g", "daemon off;"]
