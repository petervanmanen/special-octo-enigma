FROM eclipse-temurin:21
#Install git
RUN apt-get update && apt-get install -y git
WORKDIR /home
RUN git clone https://github.com/nl-portal/nl-portal-backend-libraries.git
#Set working directory
WORKDIR /home/nl-portal-backend-libraries
ADD portalbackend/application.yml /home/nl-portal-backend-libraries/app/src/main/resources/config/application.yml
RUN chmod +x gradlew
RUN ./gradlew app:build
CMD ./gradlew app:bootRun -x test 