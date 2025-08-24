#!/bin/bash
# Backup de programas y configuraciones (no incluye multimedia)
# Compatible con Debian/Ubuntu/Kali y Arch/Manjaro

# Carpeta donde se guardará el backup
DEST="/media/tony/TONY-TOAF/Backups"
DATE=$(date --iso)

mkdir -p "$DEST"

echo "📦 Iniciando backup en $DEST ..."

# 1. Guardar lista de paquetes instalados
if command -v dpkg >/dev/null 2>&1; then
    echo "➤ Detectado sistema basado en Debian/Ubuntu/Kali"
    dpkg --get-selections > "$DEST/paquetes-$DATE.list"
elif command -v pacman >/dev/null 2>&1; then
    echo "➤ Detectado sistema basado en Arch/Manjaro"
    pacman -Qqe > "$DEST/paquetes-$DATE.list"
else
    echo " No se detectó gestor de paquetes compatible"
fi

# 2. Crear archivo tar con configuraciones
BACKUP_FILE="$DEST/configs-$DATE.tar.gz"

sudo tar -cvpzf "$BACKUP_FILE" \
--exclude="$DEST" \
--exclude=/home/*/Descargas \
--exclude=/home/*/Downloads \
--exclude=/home/*/Videos \
--exclude=/home/*/Imágenes \
--exclude=/home/*/Desktop/ISOS \
--exclude=/home/*/Música \
--exclude=/home/*/.cache \
--exclude=/home/*/.local/share/Trash \
--exclude=/home/*/'VirtualBox VMs' \

/etc \
$HOME/.config \
$HOME/.local \
$HOME/.bashrc \
$HOME/.zshrc 2>/dev/null


echo " Backup completado:"
echo " - Lista de paquetes: $DEST/paquetes-$DATE.list"
echo " - Configuraciones:   $BACKUP_FILE"



#restaurar los programas 
#sudo dpkg --set-selections < paquetes-2025-08-24.list
#sudo apt-get dselect-upgrade

#restaurar la configuracion
#tar -xvpzf configs-2025-08-24.tar.gz -C /

