#!/bin/bash
sudo systemctl restart dbus
sleep 1
sudo systemctl restart NetworkManager
