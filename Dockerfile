FROM nvidia/cuda:12.2.0-base-ubuntu22.04

# Instala dependencias necesarias
RUN apt-get update && apt-get install -y \
    wget unzip curl pciutils lshw \
    ocl-icd-libopencl1 && \
    rm -rf /var/lib/apt/lists/*

# Descarga BZMiner
RUN wget https://github.com/BzMiner/BzMiner/releases/download/v21.1.5/bzminer_v21.1.5_linux.tar.gz && \
    tar -xvzf bzminer_v21.1.5_linux.tar.gz && \
    rm bzminer_v21.1.5_linux.tar.gz && \
    chmod +x bzminer_v21.1.5_linux/bzminer

# Copia archivos locales
COPY config.txt .
COPY autostart.sh .

# Da permisos y ejecuta el script
RUN chmod +x autostart.sh
CMD ["./autostart.sh"]

