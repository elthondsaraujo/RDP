! root password = 0000

! senha root = 0000

! su pass = 0000

! rclone gui adress: 127.0.0.1:5572

! Rclone Gui user = user

! Rclone Gui pass = user

! Fixed Terminal error...

# CREATE rclone.conf in terminal:
comand: rclone config

# Start Rclone Gui
rclone rcd --rc-web-gui --rc-user=user --rc-pass=user --rc-serve

rclone rcd --drive-server-side-across-configs --rc-web-gui --rc-user=user --rc-pass=user --rc-serve
