## Information  

The MVS 3.8j Tur(n)key 4- System  for Hercules
  
*Websites*: 
TK4-: https://wotho.pebble-beach.ch/tk4-/    
Hercules: http://www.hercules-390.org/  
  
  
```
cd tk4_data; docker build -t tk4-mvs .

For an arm macbook:
podman buildx build --platform linux/amd64 -t tk4-mvs --load .
```

https://github.com/skunklabz/tk4-hercules


## Screenshots  

<img width="952" alt="image" src="https://github.com/user-attachments/assets/8d6f7ba6-bd9c-44aa-bd53-14158358a42e" />

<img width="773" alt="image" src="https://github.com/user-attachments/assets/5c35fa5a-dd20-4827-9825-a9bd608f1d5a" />



## Resources

https://github.com/skunklabz/tk4-hercules/tree/master  
  
https://github.com/mainframed/docker-hercules/blob/main/Dockerfile  
https://sdl-hercules-390.github.io/html/hercconf.html  
https://www.reddit.com/r/mainframe/comments/17gljxc/anyone_have_a_source_for_tk4/  

https://petr-vacula.medium.com/how-to-connect-to-mainframe-from-your-mac-laptop-using-x3270-16243667478
- mainframe icon for app:  
- ![png-transparent-mainframe-computer-ibm-z-ibm-mainframe-ubuntu-ibm-angle-computer-linux-thumbnail](https://github.com/user-attachments/assets/f532a734-875b-41c2-95de-461be386c3c1)

script for macbook to launch x3270 in iterm2: 
```
tell application "iTerm"
	activate
	set newWindow to (create window with profile "3270")
	delay 0.5
	tell current session of newWindow
		write text "c3270 -model 3279-5 -oversize 160x48 <host>:3270"
	end tell
end tell
```  
### Passwords: 
https://hercules-390.yahoogroups.narkive.com/zJ27fQr5/all-the-passwords  



```
# Passwords for the default users
The following are the default userids and passwords for the MVS TK4UPD system. These are used to log in to the system after it has been set up.
The userid/passwords for the original MVS TK3UPD by Volker Bandke are:
Userid Description Password

IBMUSER Emergency user none
HERC01 SysProg Userid none
HERC02 SysProgr Userid CUL8TR
HERC03 Standard user none
HERC04 Standard user PASS4U
The master catalog password is SECRET.
```

```
The userid/passwords for MVS TK4 update by Juergen Winkelmann are:
Userid Description Password

IBMUSER Emergency user IBMPASS
HERC01 Fully Authorized CUL8TR
HERC02 Fully Authorized CUL8TR
HERC03 Standard user PASS4U
HERC04 Standard user PASS4U
```

```
The userid/passwords for the VM/370 Six Pack are:
UserID Password

MAINT CPCMS
CMSUSER CMSUSER

The userid/passwords for MTS are:
UserID Password

mts aardvarks
acc aardvarks
st01 st01

The userid/passwords for MUSIC/SP are:
UserID Password

$000 music
```


