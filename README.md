# nvidia-full-reinstall
A script that uninstalls all Nvidia packages on your Ubuntu machine and reinstalls the latest Nvidia drivers.

## How to use it
if it is not already, make the script executable with the following command: 
```bash
sudo chmod +x ./autoreinstall.sh
```

All you have to do is runnig the `autoreinstall.sh` bash script by using the following command:

```bash
./autoreinstall.sh
```

> ⚠️ To reinstall the Nvidia drivers, the script use the `ubuntu-drivers autoinstall` command, so it works only under Ubuntu, and it will automaticaly install all required and not installed drivers.

You can use `-r` or `--reboot` argument to automaticaly reboot your comuputer at the end of the installation

```bash
./autoreinstall.sh -r
```
```bash
./autoreinstall.sh --reboot
```

> ℹ️ sudo is required to run the script, so you will have to enter your password