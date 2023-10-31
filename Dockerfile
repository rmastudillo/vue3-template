ARG NODE_VERSION=21-bookworm

# Imagen base
FROM node:${NODE_VERSION}

ARG NODE_ENV_USER=richi
ENV NODE_USER $NODE_ENV_USER

# Cambiar al usuario root para poder ejecutar comandos administrativos
USER root

# Actualizar e instalar paquetes necesarios y luego limpiar la caché
RUN apt-get update && \
    apt-get install -y sudo nano micro && \
    apt-get install -y git openssl openssh-client openssh-server sshfs rsync && \
    apt-get install -y zsh-syntax-highlighting zsh-common zsh-dev zsh zsh-autosuggestions zsh-doc && \
    apt-get install -y htop && \
    rm -rf /var/lib/apt/lists/*

# Cambiar el nombre del usuario "node" a "${NODE_USER}" y ajustar su home
RUN usermod -l ${NODE_USER} node && \
  usermod -m -d /home/${NODE_USER} ${NODE_USER}

RUN echo "${NODE_USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/richi && chmod -R 0440 /etc/sudoers.d/richi

# Establece el directorio de trabajo dentro del contenedor
# Cambiar de usuario a "richi" para las siguientes instrucciones
USER ${NODE_USER}

WORKDIR /usr/src/app

# Copia el contenido local al contenedor
COPY . .

# Instala Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

expose 8080

# Establece zsh como shell predeterminado
CMD ["zsh"]
