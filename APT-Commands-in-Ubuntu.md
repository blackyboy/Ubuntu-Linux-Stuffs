#### APT Commands in Ubuntu

```
sudo apt-get update		# update the Repository List's
sudo apt-get install vlc	# Install the package
sudo apt-get -d install vlc	# Download the package and kept in /var/cache/apt/archives. this wont get install 
sudo apt-get upgrade		# check updates for installed package
sudo apt-get dist-upgrade	# updated the entire system
sudo apt-get autoclean		# Remove the packages no longer installed
sudo apt-get clean		# Remove all cached pakages from /var/cache/apt/archives to free disk space
sudo apt-get --purge remove vlc # Remove the package and its configuration file's
sudo apt-get -f install vlc	# Tries to fix any unmetdependency message'e while install
sudo apt-key list		# Display the gpg keys that APT knows
apt-cache search vlc		# Search the package database
apt-config -v			# Information about Current APT utility
apt-cache show			# shows the package information
apt-cache stats			# Print statistics on all packages installed
apt-cache depends		# Print Dependencies for a package, Installed or not
apt-cache pkgnames		# List all packages installed in the system
```
