# ---------- Stage 1: Build ----------
FROM node:20-alpine AS builder

WORKDIR /app

# Copy dependency files first (leverage Docker cache)
COPY package*.json yarn.lock ./

# Install dependencies with frozen lockfile for consistency
RUN yarn install --frozen-lockfile

# Copy application source
COPY . .

# Pass build-time API key
ARG TMDB_V3_API_KEY
ENV VITE_APP_TMDB_V3_API_KEY=${TMDB_V3_API_KEY}
ENV VITE_APP_API_ENDPOINT_URL="https://api.themoviedb.org/3"

# Build optimized production bundle
RUN yarn build && yarn cache clean


# ---------- Stage 2: NGINX serve ----------
FROM nginx:stable-alpine


# Set working directory
WORKDIR /usr/share/nginx/html

# Clean default nginx content
RUN rm -rf ./*

# Copy built app from builder
COPY --from=builder /app/dist .

# Expose HTTP port
EXPOSE 80

# Run nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]