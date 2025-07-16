FROM ubuntu:22.04

RUN apt update && apt install -y wget unzip libpci3 libcurl4 libusb-1.0-0 ocl-icd-libopencl1

WORKDIR /bzminer

RUN wget https://github.com/BzMiner/BzMiner/releases/download/v21.1.5/bzminer_v21.1.5_linux.zip && \
    unzip bzminer_v21.1.5_linux.zip && \
    rm bzminer_v21.1.5_linux.zip && \
    chmod +x bzminer_v21.1.5_linux/bzminer

COPY config.txt /bzminer/config.txt
COPY autostart.sh /bzminer/autostart.sh

RUN chmod +x /bzminer/autostart.sh

ENTRYPOINT ["/bzminer/autostart.sh"]
