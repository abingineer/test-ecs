# Utiliser une image légère avec JDK 21 version optimisée
FROM eclipse-temurin:21-jdk-alpine AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier uniquement le fichier JAR nécessaire
COPY testecs.jar .

# Exposer le port de l'application
EXPOSE 8080

# Exécuter l'application avec un utilisateur non root
# Créer un utilisateur non privilégié
#RUN addgroup -S appgroup && adduser -S appuser -G appgroup
#USER appuser

# Commande pour lancer l'application
CMD ["java", "-jar", "testecs.jar"]



# Version non optimisée
#FROM eclipse-temurin:21-jdk-alpine
#WORKDIR /app
#COPY testecs.jar testecs.jar
#EXPOSE 8080
#CMD ["java","-jar","testecs.jar"]