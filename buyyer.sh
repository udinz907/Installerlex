#!/bin/bash
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LIGHT_BLUE='\033[1;34m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
MAGENTA="\e[35m"
LIGHT_GREEN='\033[1;32m'
ORANGE='\033[0;33m'
PURPLE='\033[0;35m'
BOLD='\033[1m'
RESET='\033[0m'
PINK='\033[1;35m'
WHITE='\033[1;37m'
DARK_BLUE='\033[0;94m'
DARK_GREEN='\033[0;32m'
GRAY='\033[1;90m'
TEAL='\033[0;96m'
apt install lolcat -y
if command -v lolcat > /dev/null 2>&1; then
            echo -e "${GREEN}[✓] Depends Installed${RESET}"
else
            echo -e "${RED}[x] Depends not installed, Install Process...${RESET}"
exit 1
fi
if [[ ! -d "/var/www/pterodactyl" ]]; then
    read -p "Apakah anda telah menginstal Panel pterodactyl? (y/n): " answer
    if [[ "$answer" == "y" ]]; then
        while true; do
            read -p "Dimanakah file pterodactyl berada (contoh: /path/to/file): " pterodactyl_path
            if [[ -d "$pterodactyl_path" ]]; then
                cp -rL "$pterodactyl_path" /var/www/pterodactyl_backup
                echo "Backup berhasil dari $pterodactyl_path ke /var/www/pterodactyl_backup"
                break
            else
                echo "File pterodactyl tidak ada disana! Silakan coba lagi."
            fi
        done
    else
        echo "BACKUP DIBATALKAN"
    fi
else
    cp -rL /var/www/pterodactyl /var/www/pterodactyl_backup > /dev/null 2>&1
    echo "Backup berhasil dari /var/www/pterodactyl ke /var/www/pterodactyl_backup"
fi
clear
echo ""
echo -e "
══════════════════════════════════════════════
_         _      __ _                           _ _
| | ____ _| |__  / _(_)_ __ ___   ___   ___   __| | |_ _____   _
| |/ / _ | _ \| |_| | _   _ \ / _ \ / _ \ / _  | __|_  / | | |
|   < (_| | | | |  _| | | | | | | (_) | (_) | (_| | |_ / /| |_| |
|_|\_\__,_|_| |_|_| |_|_| |_| |_|\___/ \___/ \___|\__/___|\__ |
                                                           |___/
══════════════════════════════════════════════
  KAHFIMOODTZY DEVELOPER
  WhatsApp: +62 857-1889-58256
══════════════════════════════════════════════
OPSI - OPSI YANG TERSEDIA
══════════════════════════════════════════════
>> THEME (PLUGINS)
   1. INSTALL NEBULA THEME PTERODACTYL
      Preview: https://builtbybit.com/resources/nebula.32442/
══════════════════════════════════════════════
>> DEPEND INSTALL
   D. INSTALL DEPENDS PLUGINS
══════════════════════════════════════════════
>> PTERODACTYL (EDIT)
   1A. UBAH BACKROUND PTERODACTYL
   1B. HAPUS THEME/ADDON (NOT RECOMMENDED)
══════════════════════════════════════════════
>> ROLLBACK FILES
   R. ROLLBACK FILES PTERODACTYL (TIDAK MEMENGARUHI DATA - DATA SERVER)
══════════════════════════════════════════════
" | lolcat

read -p "PILIH OPSI (1-3): " OPTION

case "$OPTION" in
1)

show_progress() {
    local percent=$1
    local message=$2

    if [ "$percent" -le 40 ]; then
        COLOR=$RED
    elif [ "$percent" -le 70 ]; then
        COLOR=$ORANGE
    else
        COLOR=$GREEN
    fi

    clear
    echo -e "${CYAN}============================================================${RESET}"
    echo -e "${BOLD}${COLOR}PROSES: ${percent}% - ${message}${RESET}"
    echo -e "${GREEN}          © kahfimoodtzy${RESET}"
    echo -e "${CYAN}============================================================${RESET}"
echo -e "${GREEN}》 LOGS INSTALLER${RESET}"
    sleep 2
}

clear
echo -e "${CYAN}============================================================${RESET}"
echo -e "${BOLD}${CYAN}          WELCOME TO kahfimoodtzy INSTALLER      ${RESET}"
echo -e "${CYAN}============================================================${RESET}"
echo -e "${GREEN}            © kahfimoodtzy                            ${RESET}"
echo -e "${CYAN}============================================================${RESET}"
sleep 3

show_progress 1 "Memeriksa Files Theme Nebula"
cd /var/www
BLUEPRINT_FILE="/var/www/pterodactyl/blueprint.sh"

if [ ! -f "$BLUEPRINT_FILE" ]; then
    echo -e "${BOLD}${RED}DEPEND PLUGINS BELUM DIINSTAL${RESET}"
    exit 1
fi
cd /var/www/ && rm -r RainPrem > /dev/null 2>&1
show_progress 10 "Mengunduh Repository kahfimoodtzy"
GITHUB_TOKEN="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"
REPO_URL="https://${GITHUB_TOKEN}@github.com/kontolmeki12/kahfimoodtzy.git"
TEMP_DIR="kahfimoodtzy"
git clone "$REPO_URL" > /dev/null 2>&1
sudo mv "$TEMP_DIR/nebulaptero.zip" /var/www/ > /dev/null 2>&1

unzip -o /var/www/nebulaptero.zip -d /var/www/
cd /var/www/pterodactyl && echo -e "y" | blueprint -install nebula
rm /var/www/nebulaptero.zip /var/www/pterodactyl/nebula.blueprint

show_progress 20 "Membersihkan Cache..."
php artisan view:clear

show_progress 50 "Menginstal Yarn ( Mungkin akan sedikit lama )"
cd /var/www/pterodactyl
yarn 
sleep 5

if [ $? -eq 0 ]; then
    echo -e "${GREEN}File berhasil diunduh ke ${DESTINATION}${RESET}"
else
    echo -e "${RED}Gagal mengunduh file${RESET}"
fi

show_progress 100 "Instalasi Selesai!"
clear
echo -e "${CYAN}============================================================${RESET}"
echo -e "${GREEN}                      INSTALL SELESAI                    ${RESET}"
echo -e "${GREEN}                      © kahfimoodtzy                      ${RESET}"
echo -e "${CYAN}============================================================${RESET}"
    ;;
1A)
DEFAULT_URL="https://telegra.ph/file/28c25edd617126d1056d9.jpg"
read -p "Masukkan URL gambar (tekan Enter untuk menggunakan URL default): " USER_URL
if [ -z "$USER_URL" ]; then
    URL="$DEFAULT_URL"
else

    URL="$USER_URL"
fi
cd /var/www/pterodactyl/resources/views/templates || exit
if grep -q 'background-image' wrapper.blade.php; then
    echo "APAKAH ANDA SUDAH MENGHAPUS BACKGROUND ANDA SEBELUM MEMASANG?"
    read -p "JIKA BELUM PERNAH / SUDAH Ketik y, JIKA BELUM KETIK n: " CONFIRM
    if [ "$CONFIRM" != "y" ]; then

        echo -e "${RED}SILAHKAN HAPUS TERLEBIH DAHULU${RESET}"
        exit 1
    fi
fi
{

  echo '<!DOCTYPE html>'

  echo '<html lang="en">'

  echo '<head>'

  echo '    <meta charset="UTF-8">'

  echo '    <meta name="viewport" content="width=device-width, initial-scale=1.0">'

  echo '    <title>Pterodactyl Background</title>'

  echo '    <style>'

  echo "        body {"

  echo "            background-image: url('$URL');"

  echo '            background-size: cover;'

  echo '            background-repeat: no-repeat;'

  echo '            background-attachment: fixed;'

  echo '            margin: 0;'

  echo '            padding: 0;'

  echo '        }'

  echo '    </style>'

  echo '</head>'

  echo '<body>'

  echo '    <!-- Konten lain di sini -->'

  echo '</body>'

  echo '</html>'

  echo ''
  cat wrapper.blade.php
} > /tmp/new_wrapper.blade.php
mv /tmp/new_wrapper.blade.php wrapper.blade.php
echo -e "${BLUE}BACKGROUND BERHASIL DI GANTI${RESET}"
    ;;
     1B)

        echo "HAPUS THEME/ADDON DIPILIH"
       cd /var/www/pterodactyl
 php artisan down
curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar -xzv 
chmod -R 755 storage/* bootstrap/cache 
composer install --no-dev --optimize-autoloader
php artisan view:clear
php artisan config:clear
php artisan migrate --seed --force
chown -R www-data:www-data /var/www/pterodactyl/*
php artisan up
        echo "Semua tema dan addon telah dihapus."
        ;;
R)
        show_progress() {
            local percent=$1
            local message=$2
            local colors=("${CYAN}" "${MAGENTA}" "${YELLOW}" "${GREEN}" "${BLUE}")
            local color=${colors[$((percent % ${#colors[@]}))]}

            clear
            echo -e "${color}============================================================${RESET}"
            echo -e "${color}PROSES: ${percent}% - ${message}${RESET}"
            echo -e "${color}============================================================${RESET}"
            echo -e "${BOLD}${color}》 LOGS INSTALLER${RESET}"
            sleep 2
        }

        clear
        echo -e "${CYAN}============================================================${RESET}"
        echo -e "${BOLD}${CYAN}       VALIDASI DAN PROSES INSTALASI PTERODACTYL      ${RESET}"
        echo -e "${CYAN}============================================================${RESET}"
        sleep 2

        if [ ! -d "/var/www/pterodactyl_backup" ]; then
            clear
            echo -e "${RED}Direktori pterodactyl_backup tidak ada! Silakan hubungi Dev.${RESET}"
            exit 1
        else
            echo -e "${BLUE}MEMPROSES...${RESET}"
            sleep 2
        fi

        clear
        show_progress 20 "Menghapus Direktori Lama"
        cd /var/www/ && rm -r pterodactyl
        sleep 1
        show_progress 40 "Mengembalikan Direktori Backup"
        mv pterodactyl_backup pterodactyl
        sleep 1
        show_progress 60 "Membuat Salinan Backup Baru"
        cd /var/www/pterodactyl && rm -r pterodactyl > /dev/null 2>&1
        cp -rL /var/www/pterodactyl /var/www/pterodactyl_backup
        sleep 1
        show_progress 70 "Mengatur Hak Akses dan Izin Direktori"
        sudo chown -R www-data:www-data /var/www/pterodactyl
        sudo chmod -R 755 /var/www/pterodactyl
        sleep 2
        show_progress 80 "Menjalankan composer untuk Optimasi"
        composer install --no-dev --optimize-autoloader --no-interaction > /dev/null 2>&1
        sleep 1
        show_progress 90 "Membersihkan Cache dan Konfigurasi Laravel"
        php artisan cache:clear
        php artisan config:cache
        php artisan view:clear
        sleep 1
        show_progress 100 "Restart Nginx dan Proses Selesai"
        sudo systemctl restart nginx
        sleep 2
        clear
        echo -e "${CYAN}============================================================${RESET}"
        echo -e "${GREEN}                   PROSES SELESAI                     ${RESET}"
        echo -e "${MAGENTA}               © PTERODACTYL CONFIGURATOR             ${RESET}"
        echo -e "${CYAN}============================================================${RESET}"
        ;;
D)

show_progress() {
    local percent=$1
    local message=$2

    if [ "$percent" -le 40 ]; then
        COLOR=$RED
    elif [ "$percent" -le 70 ]; then
        COLOR=$ORANGE
    else
        COLOR=$GREEN
    fi

    clear
    echo -e "${CYAN}============================================================${RESET}"
    echo -e "${BOLD}${COLOR}PROSES: ${percent}% - ${message}${RESET}"
    echo -e "${GREEN}          © kahfimoodtzy${RESET}"
    echo -e "${CYAN}============================================================${RESET}"
    echo -e "${GREEN}》 LOGS INSTALLER${RESET}"
    sleep 2
}

clear
echo -e "${CYAN}============================================================${RESET}"
echo -e "${BOLD}${CYAN}          WELCOME TO DEPEND INSTALLER      ${RESET}"
echo -e "${CYAN}============================================================${RESET}"
echo -e "${GREEN}            © kahfimoodtzy                        ${RESET}"
echo -e "${CYAN}============================================================${RESET}"
sleep 3

show_progress 10 "Memulai Instalasi Dependensi"
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor --yes -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
npm i -g yarn

show_progress 50 "Menginstal Dependensi Tambahan"
apt install -y zip unzip git curl wget > /dev/null 2>&1
wget "$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest | grep 'browser_download_url' | cut -d '"' -f 4)" -O release.zip
mv release.zip /var/www/pterodactyl/release.zip
cd /var/www/pterodactyl
unzip -o release.zip
yarn add react-feather
yarn add cross-env

show_progress 80 "Melakukan Konfigurasi"
WEBUSER="www-data"
USERSHELL="/bin/bash"
PERMISSIONS="www-data:www-data"
sed -i -E -e "s|WEBUSER=\"www-data\" #;|WEBUSER=\"$WEBUSER\" #;|g" -e "s|USERSHELL=\"/bin/bash\" #;|USERSHELL=\"$USERSHELL\" #;|g" -e "s|OWNERSHIP=\"www-data:www-data\" #;|OWNERSHIP=\"$PERMISSIONS\" #;|g" ./blueprint.sh
chmod +x blueprint.sh

show_progress 99 "Memasang Blueprint"
bash blueprint.sh < <(yes "y")
sleep 3
show_progress 100 "Instalasi Selesai!"
clear
echo -e "${CYAN}============================================================${RESET}"
echo -e "${GREEN}                      INSTALL SELESAI                    ${RESET}"
echo -e "${GREEN}                      © kahfimoodtzy                       ${RESET}"
echo -e "${CYAN}============================================================${RESET}"
        ;;
    *)

        echo -e "${RED}Pilihan tidak valid.${RESET}"

        ;;
