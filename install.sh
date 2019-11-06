sudo mkdir -p /etc/smore
sudo cp smore.sh /etc/smore/.
sudo cp smore_check.sh /etc/smore/.
sudo cp KEYS.txt /etc/smore/.
sudo chown $USER:$USER -R /etc/smore
cp smore.service $HOME/.config/systemd/user/.
cp restart_smore.service $HOME/.config/systemd/user/.
cp smore.timer $HOME/.config/systemd/user/.
xmodmap -pke > /etc/smore/.Xmodmap
