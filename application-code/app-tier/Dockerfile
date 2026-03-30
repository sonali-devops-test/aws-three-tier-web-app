# Use official Node.js LTS Alpine image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json / package-lock.json (if exists)
COPY package*.json ./

# Install dependencies (production only)..
RUN npm ci --only=production

# Copy rest of backend code
COPY . .

# Expose port (assuming backend listens on 4000 as per repo README)
EXPOSE 4000

# Start the app
CMD ["node", "index.js"]
