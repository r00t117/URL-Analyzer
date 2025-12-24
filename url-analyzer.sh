#!/bin/bash

echo -e "[+] Firefox 52 Malware Analysis Launcher"
echo "1) Analyze malicious link (with network)"
echo "2) Open offline attachment (no network)"
read -p "Choose mode [1/2]: " mode
read -p "Enter case name or tag: " case

timestamp=$(date +%Y%m%d-%H%M%S)
mkdir -p ~/pcaps
pcapfile="$HOME/pcaps/firefox-$case-$timestamp.pcap"
firefox_path="$HOME/Extra-Tools/firefox/firefox"

if [[ ! -x "$firefox_path" ]]; then
    echo "[-] Error: Firefox executable not found at $firefox_path"
    exit 1
fi

if [[ "$mode" == "1" ]]; then
    echo "[+] Launching Firefox with internet access..."
    echo "[+] Capturing only traffic from Firefox process..."

    sudo tcpdump -i any -w "$pcapfile" &
    capture_pid=$!

    firejail --noprofile "$firefox_path" &
    firefox_pid=$!

    wait $firefox_pid
    sudo kill $capture_pid

    echo "[+] PCAP saved to $pcapfile"

elif [[ "$mode" == "2" ]]; then
    echo "[+] Opening Firefox in full offline sandbox..."
    firejail --noprofile --net=none "$firefox_path"

else
    echo "[-] Invalid option selected."
    exit 1
fi
