#!/bin/bash

####Gruntwork/Munki Uninstall Script
##Written by Mike Muir for CRTG 11/11/15
#
#This was written as an easy way to uninstall the Gruntwork maintenance tools, as well as the Munki #framework that gets installed as well.
#This was generated for use in the instance that the automatic maintenance uninstall from the Gruntwork #Admin interface doesnt work.

###Step 1: Uninstall Mac-MSP Tools by unloading all Mac-MSP BlueSky and Gruntwork LaunchDaemons, then deleting said items.
sudo launchctl unload /Library/LaunchDaemons/com.mac-msp.*
sudo launchctl unload /Library/LaunchAgents/com.mac-msp.*

sudo rm -f /Library/LaunchDaemons/com.mac-msp.*
sudo rm -f /Library/LaunchAgents/com.mac-msp.*
sudo rm -rf /Library/Mac-MSP

sudo pkgutil --forget com.mac-msp.gruntwork
sudo pkgutil --forget com.mac-msp.gruntwork.munkihelpers

###Step 2: Uninstall all Munki related items.
sudo launchctl unload /Library/LaunchDaemons/com.googlecode.munki.*

sudo rm -rf "/Applications/Utilities/Managed Software Update.app"

#Munki 2 only:
sudo rm -rf "/Applications/Managed Software Center.app"

sudo rm -f /Library/LaunchDaemons/com.googlecode.munki.*
sudo rm -f /Library/LaunchAgents/com.googlecode.munki.*
sudo rm -rf "/Library/Managed Installs"
sudo rm -rf /usr/local/munki
sudo rm /etc/paths.d/munki

sudo pkgutil --forget com.googlecode.munki.admin
sudo pkgutil --forget com.googlecode.munki.app
sudo pkgutil --forget com.googlecode.munki.core
sudo pkgutil --forget com.googlecode.munki.launchd

### reset App Store to pull updates from default Apple servers
sudo defaults delete /Library/Preferences/com.apple.SoftwareUpdate CatalogURL
