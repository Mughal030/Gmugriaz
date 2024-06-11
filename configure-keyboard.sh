#!/bin/sh

# Preconfigure the keyboard layout to "English (UK)"
echo 'keyboard-configuration keyboard-configuration/layoutcode string gb' | debconf-set-selections
echo 'keyboard-configuration keyboard-configuration/layout select English (UK)' | debconf-set-selections
echo 'keyboard-configuration keyboard-configuration/variant select English (UK)' | debconf-set-selections
echo 'keyboard-configuration keyboard-configuration/modelcode string pc105' | debconf-set-selections

# Apply the keyboard configuration
dpkg-reconfigure -f noninteractive keyboard-configuration
