FROM node:16-slim AS build
#Install git
RUN apt-get update && apt-get install -y git
WORKDIR /home
RUN git clone https://github.com/generiekzaakafhandelcomponent/gzac-frontend-template.git
#Set working directory
WORKDIR /home/gzac-frontend-template
#ADD proxy.conf.json /home/gzac-frontend-template/conf/proxy.conf.json
RUN npm install
RUN npm run build

FROM nginx:1.17.1-alpine
ADD gzacfrontendtemplate/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /home/gzac-frontend-template/deployment/dist /usr/share/nginx/html