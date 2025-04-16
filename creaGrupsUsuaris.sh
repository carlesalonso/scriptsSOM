#!/bin/bash

# Script to create groups and users in Linux
# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Array of groups to create
groups=("professors" "alumnes")
# Array of professors
professors=("professor1" "professor2" "professor3")
# Array of students
students=("ofimatica" "disseny" "programacio")
# Array of random passwords for the users
passwords=("pass1" "pass2" "pass3" "ofipass" "dispass" "progpass")

# Create groups
for group in "${groups[@]}"; do
    if ! getent group "$group" > /dev/null; then
        groupadd "$group"
        echo "Group $group created."
    else
        echo "Group $group already exists."
    fi
done

# Create professors
for i in "${!professors[@]}"; do
    user="${professors[$i]}"
    password="${passwords[$i]}"
    if ! id "$user" > /dev/null 2>&1; then
        useradd -m -G professors -p "$(openssl passwd -1 "$password")" "$user"
        echo "User $user created and added to group professors."
    else
        echo "User $user already exists."
    fi
done

# Create students
for i in "${!students[@]}"; do
    user="${students[$i]}"
    password="${passwords[$i + 3]}" # Offset for student passwords
    if ! id "$user" > /dev/null 2>&1; then
        useradd -m -G alumnes -p "$(openssl passwd -1 "$password")" "$user"
        echo "User $user created and added to group alumnes."
    else
        echo "User $user already exists."
    fi
done

echo "All groups and users have been created successfully."
exit 0