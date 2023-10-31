ARG NODE_VERSION=21-bookworm
ENV NODE_USER=${NODE_USER}
ENV NODE_VERSION=${NODE_VERSION}

# Imagen base
FROM node:${NODE_VERSION}

ARG NODE_ENV_USER=richi
ENV NODE_USER $NODE_ENV_USER

# Cambiar al usuario root para poder ejecutar comandos administrativos
USER root

# Actualizar, instalar paquetes necesarios y luego limpiar la caché
RUN apt-get update && \
    apt-get install -y sudo nano micro git openssl openssh-client openssh-server \
    sshfs rsync zsh-syntax-highlighting zsh-common zsh-dev zsh zsh-autosuggestions \
    zsh-doc htop && \
    rm -rf /var/lib/apt/lists/*

# Cambiar el nombre del usuario "node" a "${NODE_USER}" si no existe y ajustar su home
RUN id -u ${NODE_USER} || \
    (usermod -l ${NODE_USER} node && \
    usermod -m -d /home/${NODE_USER} ${NODE_USER})

# Configurar sudo para el nuevo usuario
RUN echo "${NODE_USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${NODE_USER} && chmod -R 0440 /etc/sudoers.d/${NODE_USER}

# Cambiar de usuario a "${NODE_USER}" para las siguientes instrucciones
USER ${NODE_USER}

WORKDIR /usr/src/app

# Copia el contenido local al contenedor
COPY . .

# Instala Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

expose 8080

# Establece zsh como shell predeterminado
CMD ["zsh"]


