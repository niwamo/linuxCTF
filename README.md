# LinuxCTF

A simple, containerized Linux CTF. Intended to assess a student's familiarity with basic Linux
commands, tools, and services.

Inspired by [KiddoCTF](https://github.com/IPvFletch/KiddoCTF).

~~See CLUES.md and SOLVES.md.~~<br/>
Write-up available [here](https://nicholas-morris.com/articles/linuxCTF).

To get set up:

```powershell
git clone https://github.com/niwamo/linuxCTF; cd linuxCTF
$image = "tfc/easy-ctf:1.0"
docker build -t $image .
docker save -o easyCTF.tar $image

# Provide the students with only easyCTF.tar, CLUES.md, and the following commands:
docker load --input easyCTF.tar
docker run --rm --privileged -td --volume /sys/fs/cgroup:/sys/fs/cgroup:ro tfc/easy-ctf:1.0
docker exec -it -u tfc (docker ps | select -First 2 | select -Last 1).split(' ')[0] /bin/bash
