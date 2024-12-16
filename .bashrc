# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
# Source custom command completions
if [ -d ~/.bash_completion.d ]; then
    for file in ~/.bash_completion.d/*.sh; do
        [ -r "$file" ] && source "$file"
    done
fi

if ! pgrep -x "Xorg" > /dev/null && ! pgrep -x "X" > /dev/null; then
    startx
fi

#pacman commands guide 
   # pacman -Q
   #pacman -Qi
   #pacman -Qs <package_name>








#packages i installed 
# sudo dnf install ranger 
# cheat.sh 
# sudo dnf install ncdu
# sudo dnf install navi 
# sudo dnf instal tdlr 
#  sudo dnf install xargs it pipes one input to next command 
# awk its a scripting language 
# Neovim insted of vim 
# lsof command 
# sudo dnf install extension manager
#pihole ,Nmap ,
# this scripts uses tgpt model from the  githu commuity https://github.com/aandrew-me/tgpt
# extensions -> dash to dock , vitals , cafein , 

#apps https://github.com/luong-komorebi/Awesome-Linux-Software , https://github.com/kahun/awesome-sysadmin
#vlc, firefox,chromium , extensionmanager ,vim , vscode conatiner , syncthing 
#proton ,7zip,midnight commander,obsidian,syncthing,local send , 

# User specific environment
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

unset rc
# Basic options




export HISTCONTROL=ignoredups
export COLORFGBG='default;default'
# Initialize zoxide and fzf with the bash  , zoxide hellps to auto jumps and add directory to its database 
eval "$(zoxide init bash)"
# Set zoxide data directory
export _ZO_DATA_DIR=/home/asdf/zoxide
# Configure fzf
export FZF_DEFAULT_COMMAND='ls -1'
export FZF_DEFAULT_OPTS="--layout=reverse --info=inline"
export FZF_DEFAULT_OPTS_FILE="$HOME/.fzf_defaults"
export FZF_DEFAULT_OPTS_FILE=/home/asdf/.fzf-defaults
export _ZO_ECHO='1'
export CHEAT_DIR=/home/my_cheat_sheets
export TERM=xterm-256color
export PATH=$PATH:/var/lib/snapd/snap/bin
export $(dbus-launch)
export TZ="Asia/Kolkata"
date '+%b %d (%a) %I:%M%p'
export GTK_THEME=Adwaita:dark


### Binding part 
# Map Alt+A to send 'b'
bind '"\ea": "b"'
# Map Alt+S to send 'n'
bind '"\es": "n"'
# Bind Ctrl + M to run the function






### i  use arch btw 
# fun part 
alias zeb-duke='blueman-manager'
alias s='. ~/.bashrc'
alias c='clear'
alias vi='sudo -E nvim'
alias ls='exa -all'
alias ll='exa -l'
alias la='exa -la'
alias lla='exa -la --git'
alias lt='exa -T'
alias vi=' nvim'
alias grep='grep --color=auto'
alias vbash='nvim ~/.bashrc'
alias zdata='zoxide edit'
alias diskspace="du -S | sort -n -r |more"
alias remove_with_dependency="sudo pacman -Rns"
alias iinstall="sudo pacman -S"
alias psg='ps aux | grep'
alias ip='ip addr show | grep inet'
#system monitoring 
alias topcpu='top -o %CPU'
alias topmem='top -o %MEM'
alias watchdisk='watch -n 5 df -h'
alias meminfo='cat /proc/meminfo'
alias qq='list_custom_methods'
alias desktop='cd ~/Desktop'
#system aliases 
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'
alias status='sudo systemctl status'
alias enable='sudo systemctl enable'
alias disable='sudo systemctl disable'
#KERNAL RELATED 
alias kernel='uname -r'        # Show kernel version
alias sysinfo='hostnamectl'    # Show system info
alias uinfo='lsb_release -a'   # Show distribution info (if available)
alias sensors='sensors'        # Show sensor information (requires lm_sensors)
alias back-one='git reset --hard '
alias wifi='sudo nmcli dev wifi list'
alias wifi_status='nmcli connection show'
alias wifi_connect='nmcli dev  wifi connect'
# docker aliases 
alias docker_images='sudo docker images'
alias kitty_image='kitty +kitten icat'
# default storage of docker is /var/lib/docker
#Check running containers: Use docker ps to see which containers are currently running.
#Running a new container: If you want to create and start a new instance of an image, use docker run <image_name>

### Arch linux 













# system architecture commands or notes 
# sudo su --> changes user  to root user 
# sudo su - asdf --> changes  user  to defined user 
## Navigating backwards 
..() { cd "$(eval printf '../%.0s' {1..$1})" || return 1; }

## cheat sheet 
cht(){ 
    curl "cheat.sh/$1" 
}

extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
netinfo ()
{
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
/sbin/ifconfig | awk /'Bcast/ {print $3}'
/sbin/ifconfig | awk /'inet addr/ {print $4}'
/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
echo "${myip}"
echo "---------------------------------------------------"
}



speedtest() {
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
}



google() {
  # Replace these with your actual Google API key and Custom Search Engine ID
  local api_key="AIzaSyC_CLBRGCDosY9r9nog7RhkGvOjUtnjfNY"
  local cx="d7f8aa1cd5d1c4adc"

  # Join all arguments into a single search query
  local query="$*"

  # URL encode the query
  local encoded_query=$(echo "$query" | jq -sRr @uri)

  # Make a request to the Google Custom Search JSON API
  local response=$(curl -s "https://www.googleapis.com/customsearch/v1?key=${api_key}&cx=${cx}&q=${encoded_query}")

  # Extract the titles and links from the response
  echo "$response" | jq -r '.items[] | "\(.title)\n\(.link)\n"'
}

public_ip() {
    curl -s ifconfig.me
    echo " "
}

system_health() {
    echo "Disk Usage:"
    df -h
    echo ""
    echo "Memory Usage:"
    free -h
    echo ""
    echo "CPU Load:"
    uptime
}




envr() {
    echo "------------------------------------------"
    echo -e "\033[1;36mEnvironment Variables:\033[0m"  # Cyan title
    echo "------------------------------------------"
    
    printenv | awk -F= '{printf "\033[1;34m%-30s\033[0m = \033[1;32m%s\033[0m\n", $1, $2}'  # Blue keys, Green values

    echo "------------------------------------------"
}


check_running_services() {
    echo "------------------------------------------"
    echo -e "\033[1;36mRunning Services:\033[0m"  # Cyan title
    echo "------------------------------------------"
    
    # List running services with formatting
    systemctl list-units --type=service --state=running | awk 'NR==1 {print; next} {printf "\033[1;34m%-30s\033[0m %-10s %s\n", $1, $3, $4}'

    echo "------------------------------------------"
}



weather() {
    curl wttr.in/"$1"?format=3
}

dir_size() {
    du -sh ./* 2>/dev/null | sort -rh
}

clean_memory() {
    echo "Cleaning memory cache..."
    sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
    echo "Memory cache cleaned!"
}




filefinder() {
    local exact_match
    local pattern_match

    # Colors
    local green="\033[1;32m"  # Green for exact matches
    local blue="\033[1;34m"   # Blue for pattern matches
    local reset="\033[0m"     # Reset color

    # First, try an exact match
    exact_match=$(sudo find / -type f -name "$1" 2>/dev/null)

    # If there's an exact match, print it
    if [[ -n "$exact_match" ]]; then
        echo -e "${green}Exact match found:${reset}"
        echo -e "${green}$exact_match${reset}"
    fi

    # Try a fuzzy match with wildcards
    pattern_match=$(sudo find / -type f -iname "*$1*" 2>/dev/null)

    # Print a space before pattern matches if they exist
    if [[ -n "$pattern_match" ]]; then
        echo -e "\n${blue}Pattern matches found (case insensitive):${reset}"
        echo -e "${blue}$pattern_match${reset}"
    fi

    # If neither match is found
    if [[ -z "$exact_match" && -z "$pattern_match" ]]; then
        echo "No files found matching '$1'."
    fi
}


list_custom_methods() {
    echo "------------------------------------------"
    echo "Custom Methods in .bashrc:"
    echo "------------------------------------------"
    methods=$(grep -E '^[a-zA-Z_][a-zA-Z0-9_]*\(\) {' ~/.bashrc | awk '{print $1}' | sort)

    if [[ -z "$methods" ]]; then
        echo "No custom methods found."
    else
        echo "$methods" | column -t
    fi

    echo "------------------------------------------"
}
# Function to use tgpt with various options
tgpts() {
    # Default command
    CMD="tgpt"

    # Parse flags
    while [[ $# -gt 0 ]]; do
        case $1 in
            -s|--shell)
                CMD+=" -s"
                shift
                ;;
            -c|--code)
                CMD+=" -c"
                shift
                ;;
            -q|--quiet)
                CMD+=" -q"
                shift
                ;;
            -w|--whole)
                CMD+=" -w"
                shift
                ;;
            -img|--image)
                CMD+=" -img"
                shift
                ;;
            --provider)
                CMD+=" --provider \"$2\""
                shift 2
                ;;
            --model)
                CMD+=" --model \"$2\""
                shift 2
                ;;
            --key)
                CMD+=" --key \"$2\""
                shift 2
                ;;
            --url)
                CMD+=" --url \"$2\""
                shift 2
                ;;
            --temperature)
                CMD+=" --temperature \"$2\""
                shift 2
                ;;
            --top_p)
                CMD+=" --top_p \"$2\""
                shift 2
                ;;
            --max_length)
                CMD+=" --max_length \"$2\""
                shift 2
                ;;
            --log)
                CMD+=" --log \"$2\""
                shift 2
                ;;
            --preprompt)
                CMD+=" --preprompt \"$2\""
                shift 2
                ;;
            -y)
                CMD+=" -y"
                shift
                ;;
            -v|--version)
                CMD+=" -v"
                shift
                ;;
            -h|--help)
                CMD+=" -h"
                shift
                ;;
            -i|--interactive)
                CMD+=" -i"
                shift
                ;;
            -m|--multiline)
                CMD+=" -m"
                shift
                ;;
            -cl|--changelog)
                CMD+=" -cl"
                shift
                ;;
            -u|--update)
                CMD+=" -u"
                shift
                ;;
            *)  # Anything else is treated as the prompt
                CMD+=" \"$1\""
                shift
                ;;
        esac
    done

    # Execute the command
    eval $CMD
}
#set of example files for the above method 
#tgpt --model "gpt-3.5" "Explain quantum physics."
#tgpt --provider "AnotherProvider" --model "gpt-3.5" "Explain quantum physics."



search() {
    if [ -z "$1" ]; then
        echo "Usage: search <pattern> [<directory>]"
        return 1
    fi

    dir="${2:-.}"
    color=""
    
    # Set color based on the directory
    case "$dir" in
        "$HOME")
            color="\033[1;32m"  # Green for home directory
            ;;
        "/var")
            color="\033[1;34m"  # Blue for /var
            ;;
        "/etc")
            color="\033[1;33m"  # Yellow for /etc
            ;;
        "/usr")
            color="\033[1;35m"  # Magenta for /usr
            ;;
        *)
            color="\033[0m"      # Default color
            ;;
    esac

    # Perform the search and apply color to output
    find "$dir" -type f -exec grep -Hn --color=never "$1" {} + | \
    awk -v color="$color" '{print color $0 "\033[0m"}'
}

# Search for files using ripgrep and fzf
rgf() {
    rg --files --hidden --no-ignore-vcs | fzf --preview "cat {}"
}

shopt -s cmdhist
#  Create a Multi-Line Command: Next, type a command that spans multiple lines. For example:
# Bind Ctrl + M to run the function


# Use like: weather "city_name"
# Example: weather "London"
sys_info() {
    whiptail --msgbox "$(uname -a)\n$(free -h)\n$(df -h)" 20 50
}

generate_password() {
    tr -dc 'A-Za-z0-9_@#!$%&*' < /dev/urandom | head -c "${1:-12}" && echo
}

#PS1='\[\e[38;5;79m\]\u\[\e[0;48;5;127;1m\]\w\[\e[0m\]'
PS1='\[\e[38;5;82m\]\u@\h \[\e[38;5;208m\] \[\e[38;5;75m\]\w \[\e[0;48;5;236;1m\]💻 \[\e[0m\] \$ '

fastfetch
