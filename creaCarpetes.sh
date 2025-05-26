#!/bin/bash
# Author: Carlos Alonso-Martinez
# Date: 2025-04-26
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

# Si les carpetes ja existeixen s'esborren

if [ -d "/home/cursos" ]; then
   rm -rf /home/cursos
fi
if [ -d "/home/eines" ]; then
   rm -rf /home/eines
fi
 
mkdir -p /home/cursos/{ofimatica,disseny,programacio}
mkdir -p /home/eines/utils

# Propietaris per les diferents carpetes
# per simplicitat ho fem directament amb els usuaris i grups existents
# per escalibilitat es podria fer amb un array de grups i usuaris
chown -R professor1:ofimatica /home/cursos/ofimatica
chown -R professor2:disseny /home/cursos/disseny
chown -R professor3:programacio /home/cursos/programacio
chown -R root:professors /home/eines/

# Permisos per les carpetes
# D'aquesta manera únicament el professor de cada matèria pot escriure a la seva carpeta
# i únicament l'alumne de la seva matèria pot llegir
# A la carpeta eines, els professors poden llegir i escriure i la resta (alumnes) només poden llegir
# Si es vol usar permisos més granulars es podria fer amb ACLs, però encara no les treballem.
chmod -R 750 /home/cursos
chmod -R 775 /home/eines

exit 0
