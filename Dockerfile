# Gunakan image resmi Node.js untuk frontend
FROM node:18 AS frontend

WORKDIR /app/frontend

COPY frontend/package.json frontend/package-lock.json ./
RUN npm install

COPY frontend/ ./
# Gunakan npm run build untuk menghasilkan output
RUN npm run build

# Gunakan image resmi Python untuk backend
FROM python:3.9 AS backend

WORKDIR /app/backend

COPY backend/requirements.txt ./
RUN pip install -r requirements.txt

COPY backend/ ./



# Menjalankan frontend
FROM node:18

WORKDIR /app/frontend

COPY --from=frontend /app/frontend/ ./

# Menjalankan frontend di port 3000
CMD ["npm", "run", "dev"]

WORKDIR /app/backend

COPY --from=backend /app/backend/ ./

# Menjalankan backend
CMD ["uvicorn", "main:app", "--reload"]


