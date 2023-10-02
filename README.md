

![AWADH](https://entrackr.com/storage/2022/01/mooofarm.jpg)


![AWADH](https://businessconnectindia.in/wp-content/uploads/2023/08/IIT-Ropar.jpg)




# COW HEALTH MONITORING SYSTEM

A REAL TIME Cow Health Monitoring Platform/System, to track cow's activities between any two entered time intervals.

This Projects is Sponsered by MOOOFARM

Developed and Maintained by AWADH, IIT ROPAR India

Developer ~ Sarthak Jain (shubh2002jain@gmail.com)

Github ~ https://github.com/SarthakJaindebugger



## Detailed Installation Instructions

*Note: All the below steps were tried and tested for the below mentioned H/W & S/W :

MacOs:

MacOs Monterey 12.6.8

intel i5, dual core 1800MHz

8GB RAM

intel HD graphics 6000 1563

Ubuntu:

Ubuntu 22.04.3 LTS

8GB RAM

intel i7

NVIDIA 4GB dedicated GPU(graphic card)

Windows:

Windows 11

8Gb RAM

intel i7

NVIDIA 4GB dedicated GPU(graphic card)


1)Common instructions for all OS:

->Install Android Studio:
https://developer.android.com/codelabs/basic-android-kotlin-compose-install-android-studio#4


->Install a flutter version bases on your OS:
**Before that create a src folder (windows C drive or drive where windows is installed) or a Developer folder(MacOs/Linux home directory)

https://docs.flutter.dev/get-started/install

->Install a Git version based on OS:
https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

->Install VSCode :
https://code.visualstudio.com/download

->Install Dart SDK:
https://dart.dev/get-dart#install


=>System specific instructions:

1)Unix based systems(MacOS/Linux) :

a)Only for MacOs

->Install a XCode version based on your system hardware compatibility:
https://xcodereleases.com/


->Install homebrew/macports:
homebrew: https://brew.sh/
macports: https://guide.macports.org/#installing.macports.source

*For Linux users, use sudo command wherever nessessary no need for either homebrew or macports.


To set flutter sdk path follow this video link, skip to 2:29 :
https://youtu.be/hL7pkX1Pfko?feature=shared






2)Windows:

**MUST INSTALL THE FOLLOWING:

->Install Using Powershell

When installing the software via PowerShell, we must ensure the local Get-ExecutionPolicy is not set to restricted. Chocolately suggests using Bypass to bypass the policy to get things installed or AllSigned for increased security.

First, we need to run the Get-ExecutionPolicy. If it returns Restricted, then we need to run one of the two commands below.

Set-ExecutionPolicy AllSigned

OR

Set-ExecutionPolicy Bypass -Scope Process

Now run the following command in the Windows shell.

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

If there are no errors, Chocolatey will be installed. We can verify the installation using the choco or choco -? command.

->Install Using Windows Cmd Shell

First, we need ensure that we are using an administrative shell.
Next, copy the following command to the cmd.exe shell.

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

And then press enter.

The installation should look something like this.

Microsoft Windows [Version 10.0.18363.900] (c) 2019 Microsoft Corporation. All rights reserved. C:\WINDOWS\system32>@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object Sy




->To set Flutter SDK path follow this video link, skip to 5:33 :
https://youtu.be/BqHOtlh3Dd4?feature=shared







->Now run this command if the installation was successful:

flutter --version
flutter doctor


If both the commands run successfully n give no errors, then follow the next below steps. Otherwise check for any dependencies or open an issue in Github tagging me @SarthakJaindebugger.

**Sometimes Android Licenses might not get accepted by default and one needs to do it manually. Follow this command:

flutter doctor --android-licenses

Keep pressing 'y' wherever asked by terminal

For any other isseus please check all the dependencies in pubspec.yaml file, present in root directory.





## HOW TO RUN THE PROJECT AFTER SUCCESSFUL INSTALLATION OF ALL OF THE ABOVE:

I presume the following:

->You are using Androis Studio IDE for all types of editing, running and debugging.

->Dart SDK version is selected

->Flutter bin path is managed properly

*In SDK Mangager select the option for Enable Dart Support/Version for this project IF DISABLED


*recommended and tested Android Stidio version: Flamingo 2022.2.1

With reference to the below screenshot attached, Select Chrome Web from top navigation bar, as setting up a virtual device may be hetic for beginers and may not support some h/w requirements. Also, selcted main.dart configuration and hit the green run button to run the project.


![Android Studio](https://media.geeksforgeeks.org/wp-content/uploads/20211018094329/6a.jpg)
