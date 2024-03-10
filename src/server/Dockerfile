# Use an official Node.js base image based on Alpine linux (lightweight)
FROM node:17-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the source files into the image
COPY . .

# Expose the port that the application listens on
EXPOSE 3000

# ENV MONGO_URL mongodb+srv://<user>:<pwd>@cluster0.kua20.mongodb.net/?retryWrites=true&w=majority

# Run the application
CMD npm start