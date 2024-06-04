FROM eclipse-temurin:17
#Install git
RUN apt-get update && apt-get install -y git
WORKDIR /home
RUN git clone https://github.com/generiekzaakafhandelcomponent/gzac-backend-template.git
#Set working directory
WORKDIR /home/gzac-backend-template
ADD gzacbackendtemplate/application.yml /home/gzac-backend-template/src/main/resources/config/application.yml
ADD gzacbackendtemplate/env.properties /home/gzac-backend-template/.env.properties
WORKDIR /home/gzac-backend-template
RUN chmod +x gradlew
RUN ./gradlew build
CMD ./gradlew bootRun -x test 