FROM eclipse-temurin:21
#Install git
RUN apt-get update && apt-get install -y git
WORKDIR /home
RUN git clone https://github.com/nl-portal/nl-portal-backend-template.git
#Set working directory
WORKDIR /home/nl-portal-backend-template
ADD portalbackendtemplate/application.yml /home/nl-portal-backend-template/src/main/resources/application.yml
WORKDIR /home/nl-portal-backend-template/src/main/resources/
RUN rm application-dev.yml
#RUN ls -l
WORKDIR /home/nl-portal-backend-template
RUN chmod +x gradlew
RUN ./gradlew build
CMD ./gradlew bootRun -x test 