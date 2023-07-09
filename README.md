# Set up Local Server
1. Clone repository using cmd
   - Type: git clone https://github.com/rbtc26/malupet-na-server.git

2. Create a License Key on FiveM Keymaster site (https://keymaster.fivem.net/)
   - Add a new Server
   - open https://ipchicken.com/ to get the local IP for the Initial server IP address field
   - Select Home hosted
   - Server Provider: Home Hosted
   - Copy the licenseKey
    
3. Change licenseKey in server.cfg file (D:\FXServer\txData\QBCoreFramework_AAE6E0.base\server.cfg)
   - Find sv_licenseKey "key" line
   - Change the string to your License Key
        - ex: sv_licenseKey "1234567abcde"
    
4. Install and run Xampp (https://sourceforge.net/projects/xampp/)
   - Start Apache and MySQL on XAMPP Control Panel
   - Click the admin on MySQL (It will open the phpMyAdmin page)
   - Create a new database: "rbserverdatabase" and click it.
   - Extract the rar file (D:\FXServer\database-phpmysql.rar)
   - Click Import tab in phpMyAdmin and select the extracted file (.sql)

5. Run the Server
    -start server.bat

# Pre-requisite
-FiveM (https://fivem.net/)
-GTAV
-XAMPP

##RBTC
