# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Install Python and required Python libraries
RUN apt-get update && apt-get install -y python3
COPY requirements.txt .  
RUN pip install -r requirements.txt
RUN rm requirements.txt

# Bundle app source
COPY . .

# Expose the port your Node.js app will run on
EXPOSE 3000

# Command to start the application
CMD [ "node", "index.js" ]
