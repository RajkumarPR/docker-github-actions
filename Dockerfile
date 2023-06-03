FROM eclipse-temurin:17.0.4.1_1-jre-alpine
WORKDIR /opt/app
RUN addgroup --system javauser && adduser -S -s /usr/sbin/nologin -G javauser javauser
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./
RUN chown -R javauser:javauser .
USER javauser
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]