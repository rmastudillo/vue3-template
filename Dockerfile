# Imagen base
FROM node:latest

# Cambiar al usuario root para poder ejecutar comandos administrativos
USER root

# Actualizar e instalar paquetes necesarios
RUN apt-get update && apt-get install -y sudo zsh git micro 

# Cambiar el nombre del usuario "node" a "richi" y ajustar su home
RUN usermod -l richi node && \
  usermod -m -d /home/richi richi

RUN echo "richi ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/richi && chmod 0440 /etc/sudoers.d/richi

# Establece el directorio de trabajo dentro del contenedor
# Cambiar de usuario a "richi" para las siguientes instrucciones
USER richi

WORKDIR /usr/src/app

# Copia el contenido local al contenedor
COPY . .


# Instala Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Establece zsh como shell predeterminado
CMD ["zsh"]
