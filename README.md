# I5-8259 小主机 黑苹果引导文件

## 一、介绍

这是占美工控主机的黑苹果引导文件, 基本配置如下:

 - CPU: I5-8259U
 - 显卡: Iris 655 集成显卡
 - 声卡: Realtek ALC662
 - 网卡: 2片 RTL8111 千兆网卡.
 - 无线网卡/蓝牙: DW1862A (自行购买)

## 二、安装方法

### 准备好镜像和软件.

1. 准备好一个16G以上的U盘.
2. 下载 黑苹果安装镜像
3. 下载 [balenaEtcher](https://www.balena.io/etcher/)
4. 使用balenaEtcher将下载好到黑苹果dmg镜像写入U盘.

### 让EFI 分区在Windows下变得可操作.

以管理员方式运行cmd并执行如下命令:
```bat
C:\> diskpart
list disk
sel disk 1
list part
sel part 1
set id="ebd0a0a2-b9e5-4433-87c0-68b6b72699c7"
exit
```
完成上述命令后弹出U盘再重新插入U盘, 此时系统会自动给U盘分配盘符了.

### 替换EFI分区内容:

1. 清理U盘EFI分区内容，
2. 将本仓库中的 BOOT CLOVER 目录复制到 EFI分区到EFI目录下.

### BIOS 设置
> 详细到可以对比参考 docs 目录下的bios截图.<br>
> 需要注意到几个重点设置

```
Advanced
  - CPU - PowerManagementControl
    - CPU Lock Configuratin
      - CFG Lock            [Disabled]
      - Overlocking Lock    [Disabled]
  - USB Configuration
    - Legacy USB Support    [Disabled]
    - XHCI Hand-off         [Enabled]
  - Compatibility Support Module Configuration
    - CSM Support           [Disabled]
Chipset
  - USB Cnfiguration
    - XHCI Compliance Mde   [Enabled]
    - xDCI Support          [Disabled]
```


### 隐藏BIOS设置
目的是主要是设置 默认显存分配为64M.

1. 将 EFI\BOOT\BOOTx64.efi 更名为 BOOTx64.bak.efi
2. 将 EFI\BOOT\grub.BOOTX64.efi 更名为 BOOTx64.efi
3. 用U盘引导电脑, 此时会进入GRUB 控制台. 然后执行以下命令:

```shell
GRUB> setup_var 0xA15 0x02
```

4. 完成后重启电脑.
5. 将 EFI\BOOT\BOOTx64.efi 更名为 grub.BOOTX64.efi
6. 将 EFI\BOOT\BOOTx64.bak.efi 更名为 grub.BOOTX64.efi
7. 重启电脑


### 安装系统.

1. U盘引导系统，进行安装.
2. 祝君好运


### 


 ## 更新日志:

 - 2020-11-11 升级驱动到最新
 - 2020-09-29 解决打开Apple Store 查看视屏冻屏死机问题.
 - 2020-09-28 更新Clover到 5122版.
