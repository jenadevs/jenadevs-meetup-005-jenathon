#!/bin/bash
CURRENT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ "$#" -ne 1 ] ;then
    cat <<EOF

Run reveal-md presentation.

Usage
    ./keynote.app <DIR>
Examples
    ./keynote.app presentations

EOF
    exit 1
fi

# Get needed vars.
PRESENTATION_PATH="${CURRENT_PATH}/${1}"
CONTAINER_NAME="docs"
echo -e "\n--- PRESENT FROM:\n${PRESENTATION_PATH}"
echo -e "\n--- VIEW PRESENTATION:\nopen http://${DOCKER_IP}:9000"
echo -e "\n--- STOP WITH:\ndocker stop ${CONTAINER_NAME}\n"

# Run presentation.
docker run --rm -it \
  --name ${CONTAINER_NAME} \
  -v ${PRESENTATION_PATH}:/usr/src/app/ \
  -p 9000:1948 \
  "epages/reveal-md:latest"
