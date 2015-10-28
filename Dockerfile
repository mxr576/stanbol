FROM java:openjdk-7-jdk

MAINTAINER Dezső BICZÓ "mxr576@gmail.com"

# Update the image.
RUN apt-get update &&\
  apt-get -y upgrade

# Install some additional packages.
RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get -y install supervisor && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Defaults from https://stanbol.apache.org/docs/trunk/tutorial.html
ENV JAVA_OPTS="-Xmx1g -XX:MaxPermSize=256m"

# Download Stanbol.
RUN mkdir -p /opt && \
  wget -nv --output-document=/opt/stanbol-launcher.jar http://dev.iks-project.eu/downloads/stanbol-launchers/0.12.0/org.apache.stanbol.launchers.full-0.12.0.jar

# Create directory for log files.
RUN mkdir -p /var/log/supervisord

# Add supervisord.conf.
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080

VOLUME ["/var/log/supervisord"]

CMD ["/usr/bin/supervisord"]
