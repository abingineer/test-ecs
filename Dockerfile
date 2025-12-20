# Utiliser une image légère avec JDK 21 version optimisée
# -----------------------------
# Phase 1 : Build
# -----------------------------
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Mise à jour de l'OS Alpine (corrige libpng) après le scan de trivy
RUN apk update && apk upgrade --no-cache

# Copier le JAR (ou le code source si vous voulez compiler ici)
COPY testecs.jar .

# Créer un utilisateur non root
#RUN addgroup -S appgroup && adduser -S appuser -G appgroup
#USER appuser

# Exposer le port
EXPOSE 8080

# Commande pour exécuter l'application
CMD ["java", "-jar", "testecs.jar"]

## Utiliser une image légère avec JDK 21 version optimisée
## -----------------------------
## Phase 1 : Build
## -----------------------------
#FROM eclipse-temurin:21-jdk-alpine AS build
#
#WORKDIR /app
#
## Copier le JAR (ou le code source si vous voulez compiler ici)
#COPY testecs.jar .
#
## -----------------------------
## Phase 2 : Runtime léger
## -----------------------------
#FROM eclipse-temurin:21-jre-alpine AS runtime
#
#WORKDIR /app
#
## Copier uniquement le JAR depuis la phase de build
#COPY --from=build /app/testecs.jar .
#
## Créer un utilisateur non root
##RUN addgroup -S appgroup && adduser -S appuser -G appgroup
##USER appuser
#
## Exposer le port
#EXPOSE 8080
#
## Commande pour exécuter l'application
#CMD ["java", "-jar", "testecs.jar"]




# Version non optimisée
#FROM eclipse-temurin:21-jdk-alpine
#WORKDIR /app
#COPY testecs.jar testecs.jar
#EXPOSE 8080
#CMD ["java","-jar","testecs.jar"]


## Étape 1 : Build avec Maven
#FROM maven:3.9.3-eclipse-temurin-20 AS build
#WORKDIR /app
#
## Copier les fichiers de configuration Maven
#COPY pom.xml .
#COPY src ./src
#
## Compiler le projet et créer le jar
#RUN mvn clean package -DskipTests
#
## Étape 2 : Image finale pour exécution
#FROM eclipse-temurin:20-jre-alpine
#WORKDIR /app
#
## Copier seulement le jar compilé depuis l'étape build
#COPY --from=build /app/target/myapp.jar ./myapp.jar
#
## Définir la commande d'exécution
#CMD ["java", "-jar", "myapp.jar"]
