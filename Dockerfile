FROM ubuntu:latest

COPY ./Perimeter81.deb ./
COPY ./chrome.json ./
COPY ./packages.txt ./

WORKDIR ./

ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir app_data
ENV XDG_CONFIG_HOME=./app_data

RUN apt-get update && apt-get install -y \
    software-properties-common
RUN add-apt-repository universe
RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    git \
    python3.8 \
    python3-pip
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN cat packages.txt | xargs apt-get install -y
RUN apt install ./Perimeter81.deb -y
RUN chown root:root /opt/Perimeter81/chrome-sandbox
RUN chmod 4755 /opt/Perimeter81/chrome-sandbox

CMD ["opt/Perimeter81/perimeter81"]
