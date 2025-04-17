#!/bin/bash
# Script per crear grups i usuaris a Linux
# Crea grups professors i alumnes
# Crea usuaris professors i alumnes amb contrasenyes inicials i assignació de grups

# Comprova si s'executa com a root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Llista de grups
grups=(professors alumnes)
# Llista de professors
professors=(professor1 professor2 professor3)
# Llista d'alumnes
students=(ofimatica disseny programacio)
# Llista per posar les contrasenyes inicials

# Crear grups
for grup in ${grups[*]}
do
    if ! getent group "$grup" > /dev/null; then
        groupadd $group
        echo "Grup $grup created."
    else
        echo "Grup $grup already exists."
    fi
done

# Crear professors
for user in ${professors[*]}
do
    password="123456" # Contrasenya inicial per a tots els professors
    if ! id "$user" > /dev/null 2>&1; then
        useradd -m -G professors "$user"
        echo "$user:$password" | chpasswd -c SHA512
        echo "Usuari $user creat i afegit al grup professors."
    else
        echo "L'usuari $user ja existeix."
    fi
done

# Crear alumnes
for user in ${students[*]}
do
    if ! id "$user" > /dev/null 2>&1; then
        useradd -m -G alumnes "$user"
        echo "Usuari $user creat i afegit al grup alumnes."
    else
        echo "L'usuari $user ja existeix."
    fi
done

echo "All groups and users have been created successfully."
exit 0