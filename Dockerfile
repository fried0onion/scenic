# Build Stage
FROM node:18-alpine AS build

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Build arguments for environment variables
ARG REACT_APP_API_KEY
ARG REACT_APP_MOVIE_SERVER1
ARG REACT_APP_TV_SERVER1

# Set environment variables for the build process
ENV REACT_APP_API_KEY=$REACT_APP_API_KEY
ENV REACT_APP_MOVIE_SERVER1=$REACT_APP_MOVIE_SERVER1
ENV REACT_APP_TV_SERVER1=$REACT_APP_TV_SERVER1

# Build the production application
RUN npm run build

# Runtime Stage
FROM node:18-alpine AS runtime

WORKDIR /app

# Install 'serve' package to serve static files
RUN npm install -g serve

# Copy only the build output from the build stage
COPY --from=build /app/build ./build

# Expose the port 'serve' will run on
EXPOSE 3000

# Start the application in standalone mode (-s for SPA routing)
CMD ["serve", "-s", "build", "-l", "3000"]
