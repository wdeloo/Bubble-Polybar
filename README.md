# **Bubble Polybar**

**Bubble Polybar** is designed to prioritize **user comfort** and **elevate productivity** on Linux systems. These Polybar dotfiles have been curated with a keen emphasis on **streamlining your experience**, offering a **seamless computing environment**.
<p align="center">
<img src="imgs/black.jpg"
	alt="black bar"
	width="100%"
/>
</p>

## Installation
### **Install Polybar**
Ensure you have **Polybar** installed in your system. You can use the packet manager of your Linux distribution to install it (you should run this as root).
- **Debian**:

        #: apt install polybar
- **Fedora**:

        #: dnf install polybar
- **openSUSE**:

        #: zypper install polybar
- **Arch**:

        #: pacman -S polybar
If you prefer to build it from source, you can download it from [the official Polybar GitHub repository](https://github.com/polybar/polybar).
### **Install dependencies**
In order to run this polybar dotfiles, you have to install the following dependencies:
- **bash**, **zsh**, **net-tools**, **sed**, **bc**, **awk**, **coreutils**, **grep**, **ffmpeg**, **procps-ng**, **cron** (install them through the packet manager of your linux distribution).
- **CodeNewRoman Nerd Font** (download it from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)) and **Hack Font** (download it from [source-foundry's GitHub](https://github.com/source-foundry/Hack/releases/tag/v3.003)). Unzip them and place them in **/usr/share/fonts**.

        $: unzip folder.zip
        #: mv folder /usr/share/fonts
### **Install Bubble Polybar**
Clone this repository into your system:

        $: git clone https://github.com/wdeloo/bubble-polybar
Move the **config.ini** file and **scripts** folder to **~/.config/polybar**. There might be an existing **config.ini** file, you must move it or remove it before moving the new one:

        $: rm ~/.config/polybar/config.ini
        $: mv bubble-polybar/* ~/.config/polybar
Edit the **cron** file running the following command:

        $: crontab -e
Add the following line to the opened file:

        * * * * * ~/.config/polybar/scripts/xip/xcc.sh
## Run Bubble Polybar
To **run** or **refresh** the bubble polybar run the "**bubble-run.sh**" script:

        $: ~/.config/polybar/scripts/bubble-run.sh
