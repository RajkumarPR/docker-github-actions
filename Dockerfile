FROM eclipse-temurin:17.0.4.1_1-jre-alpine@sha256:e1506ba20f0cb2af6f23e24c7f8855b417f0b085708acd9b85344a884ba77767
WORKDIR /opt/app
RUN addgroup --system javauser && adduser -S -s /usr/sbin/nologin -G javauser javauser
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./
RUN chown -R javauser:javauser .
USER javauser
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]