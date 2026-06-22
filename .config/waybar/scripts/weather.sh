#!/bin/bash
# Forzamos la respuesta de la API en español usando &lang=es
WEATHER=$(curl -s "https://wttr.in/-34.60,-58.38?format=j1&lang=es")

if [ -z "$WEATHER" ]; then
    echo '{"text": "N/A", "tooltip": "Sin conexión"}'
    exit 1
fi

# Extraer temperatura actual
TEMP=$(echo "$WEATHER" | jq -r '.current_condition[0].temp_C')

# Intentar extraer la descripción en español, si falla o da null, cae al inglés como backup
DESC=$(echo "$WEATHER" | jq -r '.current_condition[0].lang_es[0].value // .current_condition[0].weatherDesc[0].value')

# Convertimos a minúsculas para el mapeo de iconos
DESC_LOWER=$(echo "$DESC" | tr '[:upper:]' '[:lower:]')

case "$DESC_LOWER" in
    *sol*|*despejado*|*sunny*|*clear*) ICON="☀️" ;;
    *nublado*|*nubes*|*cloudy*|*overcast*|*parcialmente*) ICON="☁️" ;;
    *lluvia*|*llovizna*|*rain*|*drizzle*|*chubasco*) ICON="🌧️" ;;
    *tormenta*|*thunder*) ICON="⛈️" ;;
    *nieve*|*snow*) ICON="❄️" ;;
    *niebla*|*neblina*|*fog*|*mist*|*neblina*) ICON="🌫️" ;;
    *) ICON="🌤️" ;;
esac

TEXT="$ICON $TEMP°C"

# Extraer info para el Tooltip
MAX=$(echo "$WEATHER" | jq -r '.weather[0].maxtempC')
MIN=$(echo "$WEATHER" | jq -r '.weather[0].mintempC')
WIND_SPEED=$(echo "$WEATHER" | jq -r '.current_condition[0].windspeedKmph')
WIND_DIR=$(echo "$WEATHER" | jq -r '.current_condition[0].winddir16Point')

# Armar el Tooltip detallado 100% en español
TOOLTIP="<b>Estado:</b> $DESC\n<b>Mínima:</b> $MIN°C | <b>Máxima:</b> $MAX°C\n<b>Viento:</b> $WIND_SPEED km/h ($WIND_DIR)"

echo "{\"text\":\"$TEXT\", \"tooltip\":\"$TOOLTIP\"}"