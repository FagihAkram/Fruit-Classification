# Frontend Dockerfile
FROM node:16

# Set work directory
WORKDIR /app

# Install dependencies
COPY ./frontend/package.json /app/package.json
COPY ./frontend/package-lock.json /app/package-lock.json
RUN npm install

# Copy project
COPY ./frontend /app

# Expose the port Next.js will run on
EXPOSE 3000

# Command to run the Next.js dev server
CMD ["npm", "run", "dev"]
