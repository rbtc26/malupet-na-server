# Set up Local Server
1. Clone repository using cmd
   - Type: git clone https://github.com/rbtc26/fivemserver2.git

2. Create a License Key on FiveM Keymaster site (https://keymaster.fivem.net/)
   - Add a new Server
   - open https://ipchicken.com/ to get the local IP for the Initial server IP address field
   - Select Home hosted
   - Server Provider: Home Hosted
   - Copy the licenseKey
    
3. Change licenseKey in server.cfg file (D:\FXServer\server-data\server.cfg)
   - Find sv_licenseKey "key" line
   - Change the string to your License Key
        - ex: sv_licenseKey "1234567abcde"

4. Run the Server in cmd
   - Open cmd and locate the server-data directory
       - cd D:\FXServer\server-data
   - Type: D:\FXServer\server\FXServer.exe +exec server.cfg

# Pre-requisite
-FiveM (https://fivem.net/)
-GTAV

##RBTC
