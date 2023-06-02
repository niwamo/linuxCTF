1. An obviously labeled file in the home dir - use find, ls, etc.
    ```bash
    find /home
    ```
2. tmp directory is cleared on reboot; look here 
    ```bash
    ls /tmp
    cat /tmp/flag2 | base64 -d  # could use cyberchef if not recognizable b64
    ```
3. Look in /var/log/; strings + grep
    ```bash
    ls /var/log
    strings /var/log/flaglog | grep -i flag
    ```
4. nc, curl, wget, etc.
    ```bash
    curl http://localhost
    ```
5. Find out who's running the server with netstat, ss, ps, etc. Look at group membership
    ```bash
    sudo ps -AfH
    cat /etc/group | grep kevin
    ```
6. (it's a cookie)
    ```bash
    curl -i http://localhost
    ```
7. "oddfile" under /etc/cron.d; `file` or viewing magic byte reveals gz file; unzip
    ```bash
    find /etc -type f   # can grep for "odd" or search for recently modified files to narrow down
    file /etc/cron.d/oddfile
    gunzip /etc/cron.d/oddfile  # will get 'unrecognized extension' error
    cp /etc/cron.d/oddfile ~/oddfile.gz && gunzip ~/oddfile.gz
    cat ~/oddfile
    ```
8. We need to search for file contents in /etc 
    ```bash
    grep -ir flag /etc
    ```
9. Use ps to discover service was started by systemd. Flag in unit file
    ```bash
    sudo ps -AfH
    sudo systemctl cat boot.target
    sudo systemctl cat nginx.service
    ```