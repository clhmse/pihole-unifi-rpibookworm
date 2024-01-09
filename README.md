# pihole-unifi-rpibookworm
Install script &amp; guide for PiHole + Unifi controller on Rpi Bookworm

### Requirements:
Raspberry Pi running Pi OS Bookworm\
Networking setup with a reserved ip for your Pi (For DNS fowarding)

### Simply: 
Setup your Pi running Pi OS Bookworm\
Clone this script (Anywhere is fine but I would put it in Downloads)\
Change into the directory and run "**sudo** bash install.sh" 

### Once done:
Pihole will be hosted @ http://localhost/admin \
Unifi will be hosted @ https://localhost:8443 \
Pihole and Unifi will be hosted on the same ip - Unifi on port 8433 and Pihole on port 80\
Further Doco (unaffliated with this script) for installing Unifi and Pihole can be accessed in the Credits section.

### Credits:
**Pihole** - [Pihole Installation](https://docs.pi-hole.net/main/basic-install/) \
**@jimdigriz** - [Self-Hosting a UniFi Network Server on Debian "bookworm" 12](https://gist.github.com/jimdigriz/3a12e519e97f671c9df1174f203c8516#file-debian-unifi-md)

