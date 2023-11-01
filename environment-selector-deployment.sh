#!/bin/bash

#alias docker="sudo docker"

source ./.env

compose_method() {
	local FILE="${1}"
	local ACTION="${2}"
	
	docker compose -f "${FILE}" "${ACTION}"
}

compose_down() {
	compose_method ./compose.yml down
	compose_method ./compose.production.yml down
}

compose_launch() {
	local FILE="${1}"

	compose_method "${FILE}" pull
	compose_method "${FILE}" build
	docker compose -f "${FILE}" up -d
}

compose_relaunch() {
	local FILE="${1}"

	compose_down
	compose_launch "${FILE}"
}


if [[ "${NODE_ENV}" == "production" ]] ; then
	echo "Producción"
	COMPOSE_FILE="./compose.production.yml"

else
	echo "Development"
	COMPOSE_FILE="./compose.yml"
fi

compose_relaunch "${COMPOSE_FILE}"
