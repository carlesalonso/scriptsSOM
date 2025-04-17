#!/bin/bash

# Script per crear carpetes i fitxers a Linux

# Comprova si s'executa com a root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

 # Estructura carpetes a crear:
 # home
    # ├── cursos
    # │   ├── ofimatica
    # │   ├── disseny
    # │   └── programacio
    # |__ eines
    #     ├── utils

 mkdir -p /home/cursos/{ofimatica,disseny,programacio}
 mkdir -p /home/eines/utils

# Propietaris per les diferents carpetes
chown -R professor1:ofimatica /home/cursos/ofimatica
chown -R professor2:disseny /home/cursos/disseny
chown -R professor3:programacio /home/cursos/programacio
chown -R professors:professors /home/eines/

# Permisos per les carpetes
chmod -R 750 /home/cursos
chmod -R 775 /home/eines

exit 0
