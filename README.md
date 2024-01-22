# Mine for Blocks with Your Windows Wallet

Follow these instructions to start mining:

1. **Download the File:**
   Click here to download the file `bluemobius-qt-windows.zip`.

2. **Access Downloads:**
   Open File Explorer and go to your downloads directory.

3. **Extract the ZIP File:**
   Extract the `bluemobius-qt-windows.zip` file.

4. **Open Run Dialog:**
   Open "Run" with the keyboard shortcut `WinKey + R`.

5. **Open Notepad:**
   Enter `notepad` behind "Open" and press the "OK" button.

6. **Configure RPC:**
   Paste the following into Notepad:

```
rpcuser=rpc_bluemobius
rpcpassword=dR2oBQ3K1zYMZQtJFZeAerhWxaJ5Lqeq9J2
rpcbind=127.0.0.1
rpcallowip=127.0.0.1
listen=1
server=1
addnode=node1.bluemobius.eu
```


7. **Save Configuration File:**
- Click on "File" -> "Save As...".
- In the dialog box, select "All Files (*.*)" as the file type.
- Enter `bluemobius.conf` as the file name.
- Navigate to `%appdata%` and create a folder named `BlueMobius`.
- Save the file inside the `BlueMobius` folder.

8. **Create Batch File for Mining:**
- Create a new file with the shortcut `Ctrl + N`.
- Paste the following:

  ```
  @echo off
  set SCRIPT_PATH=%cd%
  cd %SCRIPT_PATH%
  echo Press [CTRL+C] to stop mining.
  :begin
   for /f %%i in ('bluemobius-cli.exe getnewaddress') do set WALLET_ADDRESS=%%i
   bluemobius-cli.exe generatetoaddress 1 %WALLET_ADDRESS%
  goto begin
  ```

- Again, click on "File" -> "Save As...".
- Select "All Files (*.*)" as the file type.
- Enter `mine.bat` as the file name.
- Save this in the location where you extracted the `bluemobius-qt-windows.zip`.

9. **Start Mining:**
Open your wallet and execute `mine.bat` to mine your first block.
