FROM eclipse-temurin:21
#Install git
RUN apt-get update && apt-get install -y git
WORKDIR /home
RUN git clone https://github.com/nl-portal/nl-portal-backend-libraries.git
#Set working directory
WORKDIR /home/nl-portal-backend-libraries
ADD backend/application.yml /home/nl-portal-backend-libraries/app/src/main/resources/config/application.yml
RUN chmod +x gradlew
CMD ./gradlew app:bootRun -x test 