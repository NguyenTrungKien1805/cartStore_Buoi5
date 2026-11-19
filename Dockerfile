# Giai đoạn 1: Biên dịch code Java và đóng gói thành file .war bằng Maven
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Giai đoạn 2: Chạy ứng dụng trên Tomcat 10.1 (hỗ trợ Jakarta EE / jakarta.servlet.*)
FROM tomcat:10.1-jdk21-temurin

# Xóa toàn bộ web mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Nạp file .war vừa build vào Tomcat và đổi tên thành ROOT.war để chạy ở trang chủ /
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]