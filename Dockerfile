FROM debian:10

LABEL maintainer="Kevin Alexander Nolasco  Pajuelo <kalex.nolasco@gmail.com>"

# Set the working directory to /app
WORKDIR /data
VOLUME /data

# Update and install texlive-full
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy texlive-full make git openjdk-11-jre-headless rubber scons && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*