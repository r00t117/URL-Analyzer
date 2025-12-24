# URL-Analyzer
A small, purpose-built launcher for safely analyzing suspicious URLs and files using an isolated Firefox 52 environment. The script wraps Firefox in Firejail, optionally cuts network access, and captures traffic to a PCAP when needed, making it easy to inspect browser behavior without contaminating the host. Designed for quick, repeatable analysis with minimal setup.

## Disclaimer:
- I still recommend that you run this in a isoloated VM with a clean snapshot before hand. I would not rely on Firejail as a complete safe isolation. Then just recvert the snapshot VM afterwards.
PS: Don't forget to harden your VM and isolate it from your host!

1. Launches an isolated Firefox 52 instance for analyzing suspicious URLs or files.
2. Allows choosing between online analysis with full network access or a fully offline sandbox.
3. Captures all network traffic to a timestamped PCAP for later inspection.
4. Uses Firejail to reduce host exposure during analysis.

### Why it’s useful:
- Makes quick malware and phishing analysis repeatable and low-effort.
- Provides clean traffic captures without extra setup or tooling.
- Reduces risk to the host system while interacting with untrusted content.
- Fits easily into manual analysis workflows and lab environments.

### Prerequisites / Setup:

Installed packages:
```
sudo apt update
sudo apt install -y firejail tcpdump
```
Firefox 52 binary placed at:
```
$HOME/Extra-Tools/firefox/firefox
```
Script marked executable:
```
chmod +x url-analyzer.sh
```
Make Directory to store Packet Captures:
```
mkdir ~/pcaps/
```

### Usage:
1. Run the script:
```
./firefox-analyze.sh
```
2. Select mode:
- `1` = online analysis with PCAP capture
- `2` = offline analysis (no network)
3. Enter a case name or tag when prompted.
4. PCAPs are saved to:
```
~/pcaps/
```
