# Install

Guide to install the **Debian** version of the project.

Install [**VirtualBox v6.1**](https://www.virtualbox.org/wiki/Downloads).

Download the [**Debian**](https://www.debian.org/download.en.html) image.

## Virtual Machine Settings

Launch **VirtualBox** and follow the create wizard:

1.  Create a new Virtual Machine
2.  Name: **Born2beRoot** \
    Type: **Linux** \
    Version: **Debian (64-bit)**
3.  Base Memory: 2048 MB (2GB or more)
4.  Choose **Create Virtual Hard Disk**
5.  10GB (This will be the "size" of your VM, for the mandatory part 10 GB is enough)
6.  Finish.

Additional configuration via **Settings**:

1.  Select the **Storage** tab
2.  Select the IDE Controller Empty disk
3.  Select the CD icon and pick the Debian Image file "debian-xx-x-x-amd64-netinst.iso"

## Debian Installation

Run the virtual machine and follow the OS install wizard, every time tha you see
your 'login', you must fill in your 42 student login.

1.  `Install` (NOT `Graphical install`)
2.  Select Language and Locations and keyboard layout
3.  Hostname: **login42** \
    Domain name: **(press enter)** \
    Root password:  (set the password following the subject rules)\
    Re-enter: (put the same password) \
    Full name: **login** \
    Username: **login** \
    Password: (Another password for the user) \
    Time zone: (set your location clock)

### Partition setup

For non-bonus part:

1.  Select: **Guided - use entire disk and set up encrypted LVM**
2.  `SCSIX (0,0,0) (sda) -> *.* GB ATA VBOX HARDDISK`
3.  Select: **Separete /home partition**
4.  Select: **Yes**
5.  If you want click on: **Cancel**, the erasing data is not required.
6.  Again choose desired password for the LVM part encrypt.
7.  In amout of volume group to use for guided partitioning put: **MAX**
8.  Select:** Finish partitioning and write changes to disk** 
9.  Select: **Yes**

### Package manager

In this part we will configure the package manager in your OS.

1.  Scan extra installation media ? **No** (Is not required addicional packages)
2.  Chose your country.
3.  Chose **deb.debian.org**
4.  **(press enter)**
5.  Participate in the package usage survey? Select: **No**
6.  In this part we will left in blank all software choises and click on **Continue**
7.  Install the GRUB boot loader to you primary drive? Select: **Yes**
8.  Select: **/dev/sda (ata-VBOX_HARDDISK_VB445b058c-9267b2d4)**
9.  Select: **Continue**

Done your VM is configured and will start.
