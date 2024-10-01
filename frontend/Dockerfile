# Frontend Dockerfile
FROM node:18.17.0

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json

# Install dependencies
RUN npm install

# Copy all frontend files
COPY . /app

# Expose the port Next.js will run on
EXPOSE 3000

# Command to run the Next.js dev server
CMD ["npm", "run", "dev"]
