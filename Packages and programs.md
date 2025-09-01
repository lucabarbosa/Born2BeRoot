# Debian 13 installation packages

Guide for the **Debian 13.0.0 Trixie** of the project.

Always that we put login in this documento you should put your own login from 42.
Login with your `login` from 42 and password that have you created for the user (VM) then:

```bash
login@login42:~# su
Password: #(put-the-root-password)
```
To you login as `root` to install `vim` and another packages.

## Optional - Installing vim

In your terminal as root:

```bash
root@login42:~# apt install vim
```

## 1 - Installing sudo & adding it in groups

```bash
root@login42:~# apt install sudo
root@login42:~# adduser msousa sudo
root@login42:~# reboot
```
Login again and now you can use the sudo functions

```bash
login@login42:~# sudo addgroup user4
login@login42:~# sudo adduser login user42
login@login42:~# sudo apt update
```

Verify if user was successfully added to **sudo** group.

```bash
login@login42:~# getent group sudo user42
```

## 2 - Configuring sudo

```bash
login@login42:~# sudo visudo
```
Enter this data below **Defaults    passwd_tries=3**

```
Defaults	env_reset
Defaults	mail_badpass
Defaults	passwd_tries=3
Defaults	badpass_message="Password unrecognized. Please try again."
Defaults	logfiles="/var/log/sudo/sudo.log"
Defaults	log_input, log_output
Defaults	iolog_dir="/var/log/sudo"
Defaults	requiretty
Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```

Save the file pressing **esc** **:wq**

## 3 - Installing SSH

```bash
login@login42:~# sudo apt install openssh-server
login@login42:~# sudo vim /etc/ssh/sshd_config
```

`#Port 22` to `Port 4242` and
`#PermitRootLogin prohibit-password` to `PermitRootLogin no`

Diference between `sshd_config` and `ssh_config`?

```bash
login@login42:~# sudo vi /etc/ssh/ssh_config
```

`#Port 22` to `Port 4242`

for changes to take effect:

```bash
login@login42:~# sudo reboot
```
```bash
login@login42:~# sudo service ssh status
```

Apply port forwarding rule on VirtualBox can be `4242:4242`.

`ssh` into VM

```bash
ssh login@127.0.0.1 -p 4242 # or
ssh login@0.0.0.0 -p 4242 # or
ssh login@localhost -p 4242
```

## 4 - Installing UFW

```bash
login@login42:~# sudo apt install ufw
login@login42:~# sudo ufw enable
login@login42:~# sudo ufw allow 4242
login@login42:~# sudo ufw status
```

List rules numbered

```bash
sudo ufw status
```
Delete rule

```bash
sudo ufw delete $NUMBER
```

## 5 - Setting up a strong password policy

```bash
login@login42:~# sudo vim /etc/login.defs
```
Change the numbers of the days following this values:

```
PASS_MAX_DAYS	30
PASS_MIN_DAYS	2
PASS_WARN_AGE	7
```
Save the file pressing **esc** **:wq**

```bash
login@login42:~# sudo apt install libpam-pwquality
login@login42:~# sudo vim /etc/pam.d/common-password
```

Add to the end of the `password requisite pam_pwqiality.so retry=3` line:

```
retry=3 minlen=10 ucredit=-1 dcredit=-1 lcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root
```

Change previous passwords.

```bash
login@login42:~# passwd
login@login42:~# sudo passwd
```

## 6 - Setting crontab

Create script file

```bash
login@login42:~# sudo vim /home/monitoring.sh
```

Make executable

```bash
login@login42:~# sudo chmod +x /home/monitoring.sh
```

Editing cron jobs

```bash
login@login42:~# sudo crontab -e
```

After line23 `# m h dom mon dow command`

Put line24

```
*/10 * * * * sh /home/monitoring.sh
```
Press **ctrl** **x** **y** and **enter**

```bash
login@login42:~# sudo reboot
```

Check scheduled jobs

Done !

Now everything was configurd following the subject rules and must be working as it should.
