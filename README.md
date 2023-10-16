# LinuxCTF

A simple, containerized Linux CTF. Intended to assess a student's familiarity with basic Linux
commands, tools, and services.

Inspired by [KiddoCTF](https://github.com/IPvFletch/KiddoCTF).

~~See CLUES.md and SOLVES.md.~~<br/>
Write-up (including the CTF questions) available [here](https://nicholas-morris.com/articles/linuxCTF).

To get set up:

```powershell
# note: provided commands are for PowerShell

git clone https://github.com/niwamo/linuxCTF; cd linuxCTF
$image = "tfc/linuxCTF:1.0"
docker build -t $image .
docker save -o linuxCTF.tar $image

# Provide the students with only linuxCTF.tar, CLUES.md, and the following commands:
docker load --input linuxCTF.tar
docker run --rm --privileged -td --volume /sys/fs/cgroup:/sys/fs/cgroup:ro tfc/linuxCTF:1.0
docker exec -it -u tfc (docker ps | select -First 2 | select -Last 1).split(' ')[0] /bin/bash
```
