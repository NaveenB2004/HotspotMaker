# Hotspot Maker

![GitHub repo size](https://img.shields.io/github/repo-size/NaveenB2004/HotspotMaker)
[![GitHub license](https://img.shields.io/github/license/NaveenB2004/HotspotMaker)](LICENSE)
[![GitHub Repo stars](https://img.shields.io/github/stars/NaveenB2004/HotspotMaker)](https://github.com/NaveenB2004/HotspotMaker/stargazers)
[![GitHub release (with filter)](https://img.shields.io/github/v/release/NaveenB2004/HotspotMaker)](https://github.com/NaveenB2004/HotspotMaker/releases)
[![GitHub release (by tag)](https://img.shields.io/github/downloads/NaveenB2004/HotspotMaker/v3.6/total)](https://github.com/NaveenB2004/HotspotMaker/releases/tag/v3.6)

![Hotspot Maker](Others/Media/hotspot%20maker.jpg "A tool for make hotspots!")

Hotspot Maker is a software you can use to basically start & stop hotspots in a Windows environment. There we release `Java-based` GUI applications to make a better experience for users. Our good old CLI application is also [here](https://github.com/NaveenB2004/HotspotMaker/releases/tag/v2.7) for experiments. Try this out! And make sure to send feedback!

![Hotspot Maker Preview](Others/Media/hotspot%20maker%20preview.jpg "Main Interface with Different Themes!")

>![Notice](Others/Media/exclamation-mark.png "Notice")
>
>- Some network interfaces may not support the `Hotspot Maker` application. If you're using `Windows 10` or so, you have a native option `Mobile Hotspot` in `settings` to turn on the hotspot with the mentioned interfaces. I'm studying Windows Native Wi-Fi methods to fix this issue. But it will take more time. I hope it will help you!
>- Also, the `Hotspot Maker` only supports the `English` language. Some indicators may not work using another language as the OS default language.
>- Also, this project's source code is not recommended for use for educational purposes. Cuz it's not following the Java language general guidelines and OOP concepts correctly. I'm looking forward to fixing these issues with the next version.

- [Hotspot Maker](#hotspot-maker)
  - [Download](#download)
  - [Features](#features)
  - [The Basic Interfaces](#the-basic-interfaces)
  - [How to use it?](#how-to-use-it)
  - [Extensions](#extensions)
  - [Troubleshooting](#troubleshooting)
  - [Build from source](#build-from-source)
  - [For developers](#for-developers)
  - [Bug reporting, Questions \& Suggestions](#bug-reporting-questions--suggestions)
  - [License](#license)

## Download

You can download the `Hotspot Maker` from [here!](https://github.com/NaveenB2004/HotspotMaker/releases) We release **3 types** of `Hotspot Maker` applications.

1. Hotspot Maker Full Installer: This is a release of `Hotspot Maker` that pack with all additional packages like `Java Runtime` to install offline with the application. Recommended for users that don't like to bother about `Java Runtime`.
2. Hotspot Maker Portable: This is a release of `Hotspot Maker` that only contains a wrapped `.exe` file. It's lightweight but to run, you need to install [Java Runtime][jdk] (**v17.x** or above) on your PC. Some anti-virus software will detect this as a `malicious application` because of the `.exe` wrapper. If you face any problem like that, try to run this by **disabling** anti-virus.
3. Hotspot Maker Demo: This is a release of `Hotspot Maker` that have only the `.jar` package. It's also lightweight & made for development purposes. To run, you need to install [Java Runtime][jdk] (**v17.x** or above) on your PC. Open `CMD` or `PowerShell` with `enabled UAC` & use `java -jar Hotspot.Maker.Demo.jar` to execute (`Hotspot.Maker.Demo.jar` is the name of the `.jar` file).

## Features

- Start hotspot
- Stop hotspot
- Save a default profile (name & password)
- Start hotspot with one-time profile (name & password)
- Start hotspot with one-time generated profile
- Minimize to tray after closing
- Different themes (default, light & dark)
- Automatic update check
- Automatic update install (you can config.)
- Hotspot status indicator
- Connected client count indicator
- Extensions for advanced tasks

## The Basic Interfaces

It's very easy to use `Hotspot Maker`. Let's take a look at each interface.

- Main Interface\
  ![Main Interface](Others/Media/Interface1.PNG "Main Interface")\
  Here, you can perform the basic tasks of `Hotspot Maker`. It's easy to understand & well organized. You can start the hotspot using the default & one-time username & password. To set the default profile, go to settings & set it.

- Settings Interface\
  ![Settings Interface](Others/Media/Interface2.PNG "Settings Interface")\
  Here, you can save a default profile, set themes, change the automatic app update settings & change automatic extensions update settigs.

- About Interface\
  ![About Interface](Others/Media/Interface3.PNG "About Interface")\
  Here, you can get the details about the developer and the application.

- Extensions Interface\
  ![Extensions Interface](Others/Media/Interface4.PNG "Extensions Interface")\
  Here, you can download & use the advanced extension built for Hotspot Maker.

- System Tray Icon\
  ![System Tray](Others/Media/Interface5.PNG "System Tray Menu")\
  After you close the application, it will minimize the `system tray`. You can find the `Hotspot Maker` icon from there. If you double-click the icon, you can open up the `main interface`. If you right-click the icon, you can see a menu for quick access. You can quickly start & stop `hotspot` if you already created a default profile. Also, the `system tray` icon will change with your `hotspot status` (running status will indicate with `green` color & ready to start will indicate with `yellow` color).

## How to use it?

In the main interface,

- To start a hotspot, you can use the default (if you do not set a default profile, you can do it in settings) or a one-time profile. Select the profile you want & click on the `start` button.
- To stop the hotspot, just click on the `stop` button.
- You can see the hotspot start & stop details in the console as well.
- The status indicator will show the current status of the hotspot.
- The connected clients count indicator will show the maximum number of clients who can connect & the present connected clients count.

In the settings interface,

- To save a default profile, fill in the SSID (name) & Password fields & click on the save button.
- To change the theme, select a theme from the dropdown menu & click on the save button.
- To change the automatic updates, you can enable or disable it from the button in the `Automatic Update` section. (Defaultly, it came with automatic update enabled)

## Extensions

For the extensions, we have documentation for you! [Read it from here!](Extensions/README.md)\
(Extensions are coming from 3rd party. So, install at your own risk)

## Troubleshooting

- Application not opening.\
  `Hotspot Maker` uses the port `2004` to catch up if the application is triggered more than one time. Sometimes, you have other applications running on port `2004` already. You can change the default port of `Hotspot Maker` by running the command in `CMD` or `PowerShell` (search for `CMD` or `PowerShell` -> right-click on the icon -> select `Run as administrator`). (Change `your_port` to usable port in range 0 to 65536)

  ```shell
  echo your_port >"C:\ProgramData\NaveenB2004\HospotMaker\defPort.ini"
  ```

- Get the message "Your network interface doesn't support make hotspot!"\
  Unfortunately, your wireless network adapter doesn't support making hotspots. Sometimes, that may be the case because the driver is out-of-date. Try to update the driver (by updating `Windows` or by 3rd party app).
- Can't start hotspot.\
  Make sure the `Wi-Fi` is turned on. If you turn off the `Wi-Fi`, also hotspot will shut-down.
- Can't connect to the hotspot by using other devices.\
  Try to run the `Windows` troubleshooter. If the case is still on, open `CMD` or `PowerShell` (search for `CMD` or `PowerShell` -> right-click on the icon -> select `Run as administrator`) & run `netcfg -d` to perform a cleanup on all networking devices. This will erase all your network settings such as saved credentials, VPNs, etc. After that reboot your pc.\

Not listed your trouble? [Look at this too!](#bug-reporting-questions--suggestions)

## Build from source

The basic needs,

- [Java Development Kit][jdk] version `17.x` (recommended) or above.
- [Maven](https://maven.apache.org/download.cgi "Download Maven") (for build purpose)(latest is recommended)(if you install  NetBeans IDE this will be installed with it)
- [NetBeans IDE](https://netbeans.apache.org/download/index.html "Download NetBeans IDE") (latest is recommended)(this is for load UI if you edit the source)

Build with NetBeans IDE

- Clone the repository
- Open `HotpotMaker` (HotspotMaker\HotspotMaker) as a project.
- Select `clean and build`

Build with command-line

- Clone the repository
- Open Command Prompt (`CMD`) or `PowerShell`
- Run the command,

  ```shell
  mvn package --file "projectDir\HotspotMaker\HotspotMaker\pom.xml"
  ```

## For developers

We are happy to announce our `Extensions` feature! We are grateful to invite you to contribute to it! Please read the [documentation](https://github.com/NaveenB2004/HotspotMaker/blob/main/Extensions/README.md "Extensions Documentation") about the `Extensions` & make a move!

## Bug reporting, Questions & Suggestions

Feel free to create an issue from [here!](https://github.com/NaveenB2004/HotspotMaker/issues)\
Let's discuss this from [here!](https://github.com/NaveenB2004/HotspotMaker/discussions)\
Contact me by [email](mailto:naveennbalasooriya2004@gmail.com "naveennbalasooriya2004@gmail.com") or [telegram](https://t.me/NaveenB2004 "@NaveenB2004")

## License

[The Unlicense](LICENSE)

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <https://unlicense.org>

[jdk]: https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html "Download Java Development Kit v17.x"
