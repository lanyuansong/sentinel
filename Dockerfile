FROM openjdk:8

ENV sentinel_password sentinel

RUN mkdir /home/sentinel && cd /home/sentinel && wget https://github.com/alibaba/Sentinel/releases/download/v1.8.0/sentinel-dashboard-1.8.0.jar

EXPOSE 8858 8719

CMD java -Dserver.port=8858 \
  -Dserver.port=8858 \
  -Dcsp.sentinel.api.port=8719 \
  -Dcsp.sentinel.dashboard.server=localhost:8858\
  -Dproject.name=sentinel-dashboard \
  -Dsentinel.dashboard.auth.username=sentinel \
  -Dsentinel.dashboard.auth.password=$sentinel_password \
  -jar /home/sentinel/sentinel-dashboard-1.8.0.jar
