FROM centos:7
LABEL key="Dhruvel"

# Install necessary packages and clean up
RUN yum install -y httpd zip unzip && \
    yum clean all && \
    rm -rf /var/cache/yum

# Copy the zip file to the container
COPY photogenic.zip /var/www/html/

WORKDIR /var/www/html/

# Unzip the file and clean up
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22