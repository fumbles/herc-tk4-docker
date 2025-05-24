## Information  

The MVS 3.8j Tur(n)key 4- System  
  
*Website*: https://wotho.pebble-beach.ch/tk4-/  
  
  
```
cd tk4; docker build -t tk4-mvs .

For an arm macbook:
podman buildx build --platform linux/amd64 -t tk4-mvs --load .
```

https://github.com/skunklabz/tk4-hercules


## Resources

https://github.com/skunklabz/tk4-hercules/tree/master  
  
https://github.com/mainframed/docker-hercules/blob/main/Dockerfile  
https://sdl-hercules-390.github.io/html/hercconf.html  
https://www.reddit.com/r/mainframe/comments/17gljxc/anyone_have_a_source_for_tk4/  
  
*Passwords*:  
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