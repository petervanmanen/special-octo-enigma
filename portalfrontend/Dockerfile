FROM node:20-slim AS base
#Install git
RUN apt-get update && apt-get install -y git
WORKDIR /home
RUN git clone https://github.com/nl-portal/nl-portal-frontend-libraries.git
#Set working directory
WORKDIR /home/nl-portal-frontend-libraries
ADD /portalfrontend/config.js /home/nl-portal-frontend-libraries/packages/app/public/config.js
ADD /portalfrontend/vite.config.ts /home/nl-portal-frontend-libraries/packages/app/vite.config.ts
RUN npm install -g pnpm
RUN pnpm install
RUN pnpm build
CMD pnpm run dev