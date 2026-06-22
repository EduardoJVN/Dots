#!/bin/bash

updates=$(checkupdates 2> /dev/null | wc -l)

if [ "$updates" -gt 0 ]; then
    # Devuelve el texto y le clava la clase "pending"
    echo "{\"text\": \"󰚰 $updates\", \"class\": \"pending\"}"
else
    # Si está al día, el texto normal y sin clase especial
    echo "{\"text\": \"󰚰\", \"class\": \"updated\"}"
fi