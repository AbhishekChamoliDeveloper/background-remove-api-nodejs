# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Update package list and install Python 3 and pip for Python 3
RUN apt-get update
RUN apt-get install -y python3 python3-pip

# Install required Python libraries separately
RUN pip install numpy pandas matplotlib rembg Pillow

# Bundle app source
COPY . .

# Expose the port your Node.js app will run on
EXPOSE 3000

# Command to start the application
CMD [ "node", "index.js" ]
