# Hyprland Configuration

Configuración personal de **Hyprland 0.55+** desarrollada con la nueva API oficial en **Lua**.

El objetivo de este repositorio no es únicamente personalizar Hyprland, sino construir una configuración limpia, modular, bien documentada y fácil de mantener a largo plazo.

---

# Filosofía

Esta configuración sigue algunos principios fundamentales.

## Simplicidad

Cada archivo debe tener una única responsabilidad.

Si un archivo empieza a mezclar conceptos diferentes, probablemente deba dividirse.

---

## Modularidad

La configuración está organizada en módulos independientes.

Cada módulo puede modificarse sin afectar el resto del sistema.

---

## Documentación

Cada bloque importante posee comentarios explicando:

* Qué hace.
* Cuándo modificarlo.
* Qué impacto tiene sobre el sistema.

La idea es que incluso después de varios meses sea posible entender rápidamente cualquier parte de la configuración.

---

## Compatibilidad

Siempre se utilizará la API oficial de Hyprland.

No se implementarán soluciones que dependan de proyectos externos si Hyprland ya ofrece una alternativa oficial.

---

## Evolución

La configuración evolucionará por etapas.

### Fase 1

Migración desde la configuración clásica (`hyprland.conf`) hacia Lua.

No se modificarán comportamientos.

El objetivo es únicamente trasladar la configuración.

### Fase 2

Refactorización.

Se eliminará código repetido aprovechando las capacidades de Lua.

### Fase 3

Sistema de temas.

Paletas de colores, tipografías y personalización visual reutilizable.

### Fase 4

Perfiles.

Configuraciones específicas para:

* Desarrollo
* Gaming
* Presentaciones
* Portátil

---

# Estructura

```text
~/.config/hypr/

hyprland.lua

config/
├── hardware.lua
├── applications.lua
├── autostart.lua
├── appearance.lua
├── input.lua
├── windowrules.lua
├── bindings.lua
└── workspaces.lua

lib/
├── bind.lua
├── workspace.lua
├── utils.lua
└── logger.lua

themes/
├── colors.lua
└── fonts.lua

scripts/
```

---

# Descripción de los módulos

## hardware.lua

Configuración relacionada con el hardware.

Incluye:

* Monitores
* Variables de entorno
* NVIDIA / AMD
* OpenGL
* Cursor
* Opciones específicas del hardware

---

## applications.lua

Variables utilizadas por toda la configuración.

Ejemplos:

* Terminal
* Navegador
* Editor
* Gestor de archivos
* Lanzador de aplicaciones

---

## autostart.lua

Servicios iniciados automáticamente al arrancar Hyprland.

Ejemplos:

* Waybar
* SwayNC
* Hypridle
* Cliphist
* Waypaper

---

## appearance.lua

Configuración visual.

Incluye:

* Layout
* Gaps
* Bordes
* Blur
* Animaciones
* Decoración

---

## input.lua

Configuración de entrada.

Incluye:

* Teclado
* Ratón
* Touchpad
* Gestos

---

## windowrules.lua

Reglas específicas para ventanas.

Ejemplos:

* Aplicaciones flotantes
* Tamaños por defecto
* Posiciones
* Exclusiones

---

## bindings.lua

Todos los atajos de teclado.

Organizados por categorías.

* Audio
* Multimedia
* Capturas
* Aplicaciones
* Ventanas
* Navegación
* Portapapeles
* Sesión

---

## workspaces.lua

Configuración de los espacios de trabajo.

Actualmente:

* Cambio de workspace
* Movimiento de ventanas

En el futuro:

* Scratchpads
* Workspaces persistentes
* Asignación automática de aplicaciones
* Reglas por monitor

---

# Convenciones

## Organización

Cada bloque debe comenzar con un encabezado claramente identificado.

Ejemplo:

```lua
-------------------------------------------------------
-- NVIDIA
-------------------------------------------------------
```

---

## Comentarios

Se comentará el "por qué", no solamente el "qué".

Un buen comentario explica el motivo de una decisión.

---

## Código

Siempre se priorizará la claridad sobre la cantidad de líneas.

El objetivo no es escribir menos código.

El objetivo es escribir código que pueda entenderse rápidamente.

---

# Objetivo final

Construir una configuración de Hyprland moderna, mantenible y bien documentada, inspirada en proyectos como Omarchy, pero adaptada completamente a mi flujo de trabajo como desarrollador.

Cada cambio deberá mejorar la legibilidad, la modularidad o la mantenibilidad de la configuración.
