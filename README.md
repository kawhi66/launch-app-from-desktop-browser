# launch-app-from-desktop-browser

一种从桌面浏览器（Chrome，Firefox，IE等）中启动本机应用的解决方案

由于浏览器安全策略的影响，正常情况下无法从浏览器直接启动本机的 exe 文件，但我们可以模仿类似迅雷等下载软件，从浏览器点击下载链接即可启动本机安装的迅雷并自动执行下载任务的原理，即操作本机的系统注册表，建立页面与本机exe文件之间的私有协议，来使浏览器可以信任本机的 exe 文件，从而做到直接从浏览器启动本机安装程序的目的。

## Usage ##

	# 在 Windows 平台下以管理员身份启动默认 bash

    # 克隆项目到本地
    git clone https://github.com/yycsrkl/launch-app-from-desktop-browser.git

	# bash 下运行脚本 metro.bat
	metro.bat

	# bash 提示输入搜索路径，这里可以输入 **Windows 资源管理器地址栏**中的任意路径(下面是我本机的一个路径)，脚本会自动搜索该路径下的 exe 文件
	请输入一个搜索路径=F:\QCExplorer\QCExplorer

	# 点击 Enter 键开始搜索
	# 继续点击 Enter 键开始写注册表
	# 操作完成后，bash会自动退出

	# 打开目录下的 index.html 文件，会发现所选目录下的exe文件已经在页面中显示出来，点击即可启动

注：如果需要改变搜索路径，重新选择需要启动的 exe 文件，只需要重新运行脚本即可，在再次启动脚本时，会自动清理上次写入的注册表文件。
	
	
