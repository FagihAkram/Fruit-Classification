# Backend Dockerfile
FROM python:3.11-slim

# Install dependencies
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir --upgrade -r /requirements.txt

# Copy the entire backend folder
COPY . 

# Expose the port FastAPI will run on
EXPOSE 8000

# Command to run the FastAPI server
CMD ["uvicorn", "main:app", "--reload"]

