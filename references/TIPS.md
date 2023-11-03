## STEAM

- paradox celeste 这些存档 都在 /home/ljl/.local/share下
- steam 游戏都在/home/ljl/.steam/steam/steamapps
- steam 很多存档都在/home/ljl/.local/share/Steam/steamapps/compatdata/
- steam加速器在/home/ljl/Desktop/ascf_v2.0.0_Linux_x64

## TTY

亮度

```
sudo modprobe i2c-dev
sudo ddcutil setvcp 10 13
```

## 找

`find . -name " "`

## 放缩

找到启动文件在/usr/share/applications

- GTK:exec=env GTK_SCALE_FACTOR=2 env GTK_DPI_SCALE_FACTOR=0.5 .......
- QT:exec=env QT_SCALE=2
- steam 好像是
  - Exec=/usr/bin/steam-runtime %U -forcedesktopscaling 1.25 GDK_SCALE=1.5
- 钉钉自带
- wechat:
  - env WINEPREFIX="$HOME/.deepinwine/Deepin-WeChat" /usr/bin/deepin-wine6-stable winecfg
  - dpi 改成120 (or 1

## 安装微信输入框乱码问题解决方法

复制windows某个字体到 $HOME/.deepinwine/Deepin-WeChat/drive_c/windows/Fonts下，并安装

## Debug Attach

Ptrace (attach process protection)<br/>
`echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope`

## 声卡缺失：

- Use pavucontrol to take it back
- On page "Configuration (c)"

## 京造键盘F keys 驱动问题

```
echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf

sudo update-initramfs -u //Ubuntu
mkinitcpio -P //ArchLinux
```

## git:

`git config --global credential.helper store` 存github凭证

## Firefox:

1. Text size of menu
   - in about:config layout.css.devPixelsPerPx 1.25
2. Text size of devtools (scaling)
   - devtools.toolbox.zoomValue 1.25
3. Tab bar height
   - https://www.reddit.com/r/firefox/wiki/userchrome/: find userchrome.css
   - paste the userchrome.css in this repository to ur css
     `https://github.com/dddddjent/SlimBarsFirefox`
