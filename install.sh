sudo mkdir -p /etc/smore
sudo chown $USER:$USER -R /etc/smore
cp smore.sh /etc/smore/.
cp smore.service $HOME/.config/systemd/user/.
cp restart_smore.service $HOME/.config/systemd/user/.
cp smore.timer $HOME/.config/systemd/user/.
xmodmap -pke > /etc/smore/.Xmodmap
systemctl --user daemon-reload
systemctl --user start smore.service
systemctl --user start smore.timer
