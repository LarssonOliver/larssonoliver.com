# Install dependencies only when needed
FROM node:22-alpine AS deps

WORKDIR /app

COPY package*.json ./ 
RUN npm ci

# Rebuild the source code only when needed
FROM node:22-alpine AS builder

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN npm run build

# Production image, copy all the files and run next
FROM nginx:stable-alpine AS runner

ARG PORT=80

WORKDIR /app

ENV NODE_ENV production
ENV PORT $ARG 

EXPOSE $ARG

COPY --from=builder /app/dist /usr/share/nginx/html 

CMD ["nginx", "-g", "daemon off;"]
