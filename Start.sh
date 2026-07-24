#!/data/data/com.termux/files/usr/bin/bash

# Termux All-in-One Setup Script
# Created By PritomX-IT

clear

# Colors for output
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

# Welcome Message
echo -e "\e[1;32mCreated By PritomX-IT\e[0m"
echo "----------------------------" | lolcat 2>/dev/null || echo "----------------------------"

figlet "CodeX-IT" | lolcat 2>/dev/null || figlet "CodeX-IT"

echo "
██████╗ ██████╗ ██╗████████╗ ██████╗ ███╗   ███╗
██╔══██╗██╔══██╗██║╚══██╔══╝██╔═══██╗████╗ ████║
██████╔╝██████╔╝██║   ██║   ██║   ██║██╔████╔██║
██╔═══╝ ██╔══██╗██║   ██║   ██║   ██║██║╚██╔╝██║
██║     ██║  ██║██║   ██║   ╚██████╔╝██║ ╚═╝ ██║
╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝
X-IT" | lolcat 2>/dev/null || echo "
██████╗ ██████╗ ██╗████████╗ ██████╗ ███╗   ███╗
██╔══██╗██╔══██╗██║╚══██╔══╝██╔═══██╗████╗ ████║
██████╔╝██████╔╝██║   ██║   ██║   ██║██╔████╔██║
██╔═══╝ ██╔══██╗██║   ██║   ██║   ██║██║╚██╔╝██║
██║     ██║  ██║██║   ██║   ╚██████╔╝██║ ╚═╝ ██║
╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝
X-IT"

echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}          TERMUX FULL SETUP SCRIPT v1.0${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

# Function to print status messages
print_status() {
    echo -e "${YELLOW}[+]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Step 1: Setup Storage
print_status "Setting up storage access..."
termux-setup-storage
sleep 2
print_success "Storage setup completed!"

# Step 2: Update and Upgrade Packages
print_status "Updating and upgrading packages..."
pkg update -y && pkg upgrade -y
apt update -y && apt upgrade -y
print_success "System updated!"

# Step 3: Install Core Packages (Removed Node.js, npm, Rust, Go, Java, CMake, Clang)
print_status "Installing core packages..."

# Install essential packages (without Node.js, npm, rust, golang, openjdk-17, cmake, clang)
pkg install -y \
    git \
    php \
    curl \
    wget \
    python \
    python2 \
    python3 \
    python-pip \
    mpv \
    figlet \
    termux-tools \
    openssh \
    termux-api \
    ffmpeg \
    nmap \
    proot-distro \
    net-tools \
    dnsutils \
    cowsay \
    toilet \
    ruby \
    perl \
    make \
    binutils

print_success "Core packages installed!"

# Step 4: Install Python Packages
print_status "Installing Python packages..."

# Install pip for Python 3
python3 -m pip install --upgrade pip

# Install Python packages
pip3 install \
    yt-dlp \
    requests \
    wget \
    pyshorteners \
    lolcat \
    colorama \
    bs4 \
    youtube-dl \
    pyfiglet \
    termcolor

print_success "Python packages installed!"

# Step 5: Install Ruby Gems
print_status "Installing Ruby gems..."
gem install lolcat colorize

print_success "Ruby gems installed!"

# Step 6: Fix and Cleanup
print_status "Fixing dependencies and cleaning up..."

# Fix missing dependencies
pkg install --fix-missing -y
dpkg --configure -a

# Clean cache
pkg autoclean -y
pkg autoremove -y
pkg clean -y
pip cache purge 2>/dev/null

print_success "Cleanup completed!"

# Step 7: Clone PritomTX Repository
print_status "Cloning PritomTX repository..."
git clone https://github.com/pritomit/pritomTX
if [ -d "pritomTX" ]; then
    print_success "Repository cloned successfully!"
    cd pritomTX
    if [ -f "pritom.sh" ]; then
        print_status "Running pritom.sh script..."
        bash pritom.sh
        print_success "pritom.sh executed successfully!"
    else
        print_error "pritom.sh not found in repository!"
    fi
    cd ..
else
    print_error "Failed to clone repository!"
fi

# Step 8: Version Check
echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}INSTALLED VERSIONS:${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"

# Show installed versions
echo -e "${YELLOW}Python:${NC} $(python --version 2>/dev/null || echo 'Not installed')"
echo -e "${YELLOW}Python3:${NC} $(python3 --version 2>/dev/null || echo 'Not installed')"
echo -e "${YELLOW}Git:${NC} $(git --version 2>/dev/null || echo 'Not installed')"
echo -e "${YELLOW}PHP:${NC} $(php --version 2>/dev/null | head -n1 || echo 'Not installed')"
echo -e "${YELLOW}Ruby:${NC} $(ruby --version 2>/dev/null || echo 'Not installed')"
echo -e "${YELLOW}Perl:${NC} $(perl --version 2>/dev/null | head -n1 || echo 'Not installed')"
echo -e "${YELLOW}FFmpeg:${NC} $(ffmpeg -version 2>/dev/null | head -n1 || echo 'Not installed')"
echo -e "${YELLOW}Nmap:${NC} $(nmap --version 2>/dev/null | head -n1 || echo 'Not installed')"

# Step 9: Create Welcome Banner
print_status "Creating welcome banner..."

mkdir -p ~/.termux
cat > ~/.termux/termux.properties << 'EOF'
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
bell-character = ignore
use-black-ui = true
EOF

cat > ~/.bashrc << 'EOF'
# Welcome Message
echo -e "\e[1;32mCreated By PritomX-IT\e[0m"
echo "----------------------------" | lolcat 2>/dev/null || echo "----------------------------"

figlet "CodeX-IT" | lolcat 2>/dev/null || figlet "CodeX-IT"

echo "
██████╗ ██████╗ ██╗████████╗ ██████╗ ███╗   ███╗
██╔══██╗██╔══██╗██║╚══██╔══╝██╔═══██╗████╗ ████║
██████╔╝██████╔╝██║   ██║   ██║   ██║██╔████╔██║
██╔═══╝ ██╔══██╗██║   ██║   ██║   ██║██║╚██╔╝██║
██║     ██║  ██║██║   ██║   ╚██████╔╝██║ ╚═╝ ██║
╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝
X-IT" | lolcat 2>/dev/null || echo "
██████╗ ██████╗ ██╗████████╗ ██████╗ ███╗   ███╗
██╔══██╗██╔══██╗██║╚══██╔══╝██╔═══██╗████╗ ████║
██████╔╝██████╔╝██║   ██║   ██║   ██║██╔████╔██║
██╔═══╝ ██╔══██╗██║   ██║   ██║   ██║██║╚██╔╝██║
██║     ██║  ██║██║   ██║   ╚██████╔╝██║ ╚═╝ ██║
╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝
X-IT"

echo -e "\033[1;32m═══════════════════════════════════════════════════════════\033[0m"
echo -e "\033[1;33m  All packages installed successfully!  \033[0m"
echo -e "\033[1;32m═══════════════════════════════════════════════════════════\033[0m"
echo -e "\033[1;36m  Type 'help' for available commands  \033[0m"
echo -e "\033[1;32m═══════════════════════════════════════════════════════════\033[0m"
EOF

print_success "Welcome banner created!"

# Step 10: Final Message
echo ""
echo -e "${GREEN}═══════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}✨ INSTALLATION COMPLETED SUCCESSFULLY! ✨${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${YELLOW}📦 Installed packages:${NC}"
echo -e "  • Python 2/3, PHP, Ruby, Perl"
echo -e "  • Git, FFmpeg, Nmap, OpenSSH, MPV"
echo -e "  • curl, wget, figlet, cowsay, toilet"
echo -e "  • yt-dlp, requests, lolcat, pyshorteners"
echo -e "  • And many more tools..."
echo ""
echo -e "${YELLOW}💡 Quick commands:${NC}"
echo -e "  • python3 script.py  - Run Python script"
echo -e "  • php -S 0.0.0.0:8080 - Start PHP server"
echo -e "  • ssh user@host      - SSH connection"
echo -e "  • ffmpeg -i input.mp4 output.mp3 - Convert media"
echo -e "  • yt-dlp 'URL'       - Download YouTube videos"
echo ""
echo -e "${BLUE}📁 Storage location: /storage/emulated/0/${NC}"
echo -e "${BLUE}📱 Restart Termux to apply all changes${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════════════${NC}"

# List installed packages
echo ""
echo -e "${YELLOW}Installed packages list:${NC}"
pkg list-installed | head -n 20
echo -e "${YELLOW}... and more!${NC}"

# Final cleanup
print_status "Performing final cleanup..."
pkg clean -y
print_success "All done!"

echo ""
echo -e "${GREEN}✅ Termux is now 100% ready to use!${NC}"
echo -e "${GREEN}   Happy coding! 🚀${NC}"

# Exit with success
exit 0
