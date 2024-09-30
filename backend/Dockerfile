# Gunakan image resmi Python untuk backend
FROM python:3.9 AS backend

WORKDIR /app/backend

COPY backend/requirements.txt ./
RUN pip install -r requirements.txt

COPY backend/ ./

# Menjalankan backend
CMD ["uvicorn", "main:app", "--reload"]
