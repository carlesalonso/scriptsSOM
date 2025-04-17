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
grups=("professors" "alumnes")
# Llista de professors
professors=("professor1" "professor2" "professor3")
# Llista d'alumnes
students=("ofimatica" "disseny" "programacio")
# Llista per posar les contrasenyes inicials
passwords=("pass1" "pass2" "pass3" "ofipass" "dispass" "progpass")

# Crear grups
for group in grups
do
    if ! getent group "$group" > /dev/null; then
        groupadd "$group"
        echo "Group $group created."
    else
        echo "Group $group already exists."
    fi
done

# Crear professors
for user in professors
do
    password="${passwords[$i]}"
    if ! id "$user" > /dev/null 2>&1; then
        useradd -m -G professors "$user"
        echo "$user:$password" | chpasswd -c SHA512
        echo "Usuari $user creat i afegit al grup professors."
    else
        echo "L'usuari $user ja existeix."
    fi
done

# Crear alumnes
for user in students
do
    password="${passwords[$i + 3]}" # Desplaçament per passwords alumnes
    if ! id "$user" > /dev/null 2>&1; then
        useradd -m -G alumnes "$user"
        echo "$user:$password" | chpasswd -c SHA512
        echo "Usuari $user creat i afegit al grup alumnes."
    else
        echo "L'usuari $user ja existeix."
    fi
done

echo "All groups and users have been created successfully."
exit 0