#!/bin/bash
# Author: Carlos Alonso-Martinez
# Date: 2025-04-23
# Script per crear grups i usuaris a Linux
# Crea grups professors i alumnes
# Crea usuaris professors i alumnes amb contrasenyes inicials i assignació de grups

# Comprova si s'executa com a root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

## Variables
# Llista de grups
grups=(professors alumnes)
# Llista de professors
professors=(professor1 professor2 professor3)
# Llista d'alumnes
alumnes=(ofimatica disseny programacio)

# Crear grups
# Comprova si els grups ja existeixen i els crea si no

for grup in ${grups[*]}
do
    if ! getent group "$grup" &> /dev/null 2>&1; then
        groupadd "$grup"
        echo "Grup $grup creat."
    else
        echo "Grup $grup ja existeix."
    fi
done

# Contrasenya inicial per a tots els professors
password="123456" 

# Crear professors
# Als professors se'ls assigna una contrasenya inicial
# aquí usem alternativament @ enlloc de * per recòrrer l'array

for user in "${professors[@]}"
do
   
    if ! id "$user" &> /dev/null 2>&1; then
        useradd -s /bin/bash -m -G professors "$user"
        echo "$user:$password" | chpasswd -c SHA512
        echo "Usuari $user creat i afegit al grup professors."
    else
        echo "L'usuari $user ja existeix."
    fi
done

# Crear alumnes aula
for user in ${alumnes[*]}
do
    if ! id "$user" &> /dev/null 2>&1; then
        useradd -s /bin/bash -m -G alumnes "$user"
        echo "Usuari $user creat i afegit al grup alumnes."
    else
        echo "L'usuari $user ja existeix."
    fi
done

echo "Grups i usuaris creats amb èxit."
exit 0