# Utiliser une image légère avec JDK 21 version optimisée
# -----------------------------
# Phase 1 : Build
# -----------------------------
FROM eclipse-temurin:21-jdk-alpine AS build

WORKDIR /app

# Copier le JAR (ou le code source si vous voulez compiler ici)
COPY testecs.jar .

# -----------------------------
# Phase 2 : Runtime léger
# -----------------------------
FROM eclipse-temurin:21-jre-alpine AS runtime

WORKDIR /app

# Copier uniquement le JAR depuis la phase de build
COPY --from=build /app/testecs.jar .

# Créer un utilisateur non root
#RUN addgroup -S appgroup && adduser -S appuser -G appgroup
#USER appuser

# Exposer le port
EXPOSE 8080

# Commande pour exécuter l'application
CMD ["java", "-jar", "testecs.jar"]




# Version non optimisée
#FROM eclipse-temurin:21-jdk-alpine
#WORKDIR /app
#COPY testecs.jar testecs.jar
#EXPOSE 8080
#CMD ["java","-jar","testecs.jar"]