# Bài tập thực hành: Docker + VNC + Desktop Environment

## Yêu cầu
- Tạo một image Docker bằng **docker-compose**, cài đặt **vnc-server** và một DE (Desktop Environment) cho image đó.  
- Thử remote thông qua chương trình **vnc-viewer** trên máy.

## Lưu ý
- **Không** dùng các image có sẵn các gói đã nêu trên.
- **Được phép** cài các package sau khi đã truy cập được máy ảo.
- Gợi ý: sử dụng **SSH** để truy cập máy ảo rồi mới cài DE.

## Hướng dẫn run

### Tạo SSH key và copy vào thư mục

1. **Tạo SSH key:**
	- Mở terminal và chạy lệnh sau:
	  ```sh
	  ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
	  ```
	- Làm theo hướng dẫn, sau khi hoàn thành sẽ có file `id_rsa.pub` trong `C:\Users\<Tên người dùng>\.ssh\` (Windows).

2. **Copy file `id_rsa.pub` vào thư mục W1:**
	- Tìm file `id_rsa.pub` vừa tạo.
	- Copy file này vào thư mục `W1` của project.


### Chạy Docker Compose và kết nối remote

1. **Chạy Docker Compose:**
	 - Mở terminal tại thư mục `W1`.
	 - Chạy lệnh sau :
		 ```sh
		 docker compose up -d
		 ```

2. **Kiểm tra container đã chạy:**
	 - Chạy lệnh:
		 ```sh
		 docker ps
		 ```
	

3. **Thử kết nối remote:**
	 - **SSH:**
		 - Kết nối vào container bằng SSH với lệnh:
			 ```sh
			 ssh -p 2222 hoainam@localhost
			 ```
	 - **VNC:**
		 - Mở phần mềm VNC Viewer.
		 - Nhập địa chỉ IP và port VNC đã cấu hình (`localhost:5901`).


### Cài đặt DE và cấu hình VNC

1. **Cài đặt xfce4 qua SSH:**
	 - Sau khi SSH vào container, chạy các lệnh sau để cài đặt xfce4:
		 ```sh
		sudo apt update
		sudo apt install xfce4 xfce4-goodies dbus-x11 -y
		 ```

2. **Cài đặt và cấu hình VNC để sử dụng xfce4:**

	 - Cấu hình VNC sử dụng xfce4:
		 - Mở file `~/.vnc/xstartup` (bằng nano,.. hoặc dùng cat) và thay nội dung bằng:
			 ```sh
			#!/bin/sh
            unset SESSION_MANAGER
            unset DBUS_SESSION_BUS_ADDRESS
            exec startxfce4
			 ```
		 - Đảm bảo file có quyền thực thi:
			 ```sh
			 chmod +x ~/.vnc/xstartup
			 ```
	 - Khởi động lại VNC server:
		 ```sh
		 vncserver :1
		 ```


