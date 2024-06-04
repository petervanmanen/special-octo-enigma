FROM node:16-slim AS base
#Install git
RUN apt-get update && apt-get install -y git
WORKDIR /home
RUN git clone https://github.com/nl-portal/nl-portal-frontend-template.git
#Set working directory
WORKDIR /home/nl-portal-frontend-template
ADD /portalfrontendtemplate/config.js /home/nl-portal-frontend-template/public/config.js
RUN yarn install
RUN yarn run build
CMD yarn run start