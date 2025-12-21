# Usamos una imagen base que soporte Java 21
FROM eclipse-temurin:21-jdk

# Establece el directorio de trabajo
WORKDIR /app

# Copia el JAR generado. Cambia por el nombre real de tu archivo
COPY target/blog-api-0.0.1-SNAPSHOT.jar /app/app.jar

# Copia el script de espera
COPY wait-for-mysql.sh /wait-for-mysql.sh
RUN chmod +x /wait-for-mysql.sh

# Expone el puerto que usa Spring Boot (8080)
EXPOSE 8080

# Comando para ejecutar la aplicación después de esperar a MySQL
ENTRYPOINT ["/wait-for-mysql.sh", "mysql", "java", "-jar", "app.jar"]
