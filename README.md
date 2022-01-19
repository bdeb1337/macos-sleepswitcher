# Sleepswitcher

Because I sometimes use the macOS built-in VNC server to remote into my macBook from another system, I want it to stay alive when plugged into the power adapter. The only way that reliably worked for me on macOS 10.12 Monterey was to set:

````
sudo pmset disablesleep 1
```

This however causes pretty severe power draining when running on Battery because the system never goes to sleep properly.

That's why I made this launchd daemon that runs a simple shell script to take care of the setting switching.

# Installation
```
git clone macos-sleepswitcher
cd macos-sleepswitcher
sudo cp sleepswitcher.sh /var/root/sleepswitcher.sh
sudo cp sleepDaemon.plist /Library/LaunchDaemons/sleepDaemon.plist
sudo reboot now
```

# Optimisation
Instead of running in a while-loop and sleeping for 5 seconds, we should get rid of the while loop and just run it when the AC is plugged in or out. That would be possible if I knew which file gets altered when that happens.

Instead of RunAtLoad I could try the following:

```
<key>WatchPaths</key>
<array>
	<string>/path/to/directory_or_file</string>
</array>
```