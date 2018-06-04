FROM debian:stretch

RUN apt-get update && apt-get install -y apt-transport-https wget gnupg
RUN wget -nc https://dl.winehq.org/wine-builds/Release.key
RUN apt-key add Release.key
RUN echo "deb https://dl.winehq.org/wine-builds/debian/ stretch main" >> /etc/apt/sources.list

RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get install --assume-yes --install-recommends winehq-stable zenity mesa-utils mesa-utils-extra libgl1-mesa-glx:i386 libgl1-mesa-dev winbind x11-xserver-utils cabextract
ENV DISPLAY :0
ENV WINEARCH="win32"
#RUN xhost +

RUN mkdir ~/bin
RUN wget http://winetricks.org/winetricks -O /winetricks
RUN chmod +x /winetricks 

#RUN mkdir -p /home/office
RUN adduser office --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password --home /home/office
USER office



#FROM debian:wheezy
#RUN dpkg --add-architecture i386 

#RUN apt-get update
#RUN apt-get install --no-install-recommends --assume-yes wine 32 wine
#ENV DISPLAY :0

#RUN apt update
#RUN apt install -y apt-transport-https wget gnupg
#RUN wget -nc https://dl.winehq.org/wine-builds/Release.key
#RUN apt-key add Release.key
#RUN rm Release.key
#RUN echo "deb https://dl.winehq.org/wine-builds/debian/ stretch main" > /etc/apt/sources.list
#RUN apt update

#RUN apt install wine-stable-amd64
#RUN apt-get install -y --install-recommends wine-stable-amd64 wine-stable winehq-stable


#FROM ubuntu:16.04

#RUN apt-get update && apt-get install -y firefox

# Replace 1000 with your user / group id
#RUN export uid=1000 gid=1000 && \
#    mkdir -p /home/developer && \
#    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:${uid}:" >> /etc/group && \
#    mkdir /etc/sudoers.d && \
#    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#    chmod 0440 /etc/sudoers.d/developer && \
#    chown ${uid}:${gid} -R /home/developer

#USER developer
#ENV HOME /home/developer
#CMD /usr/bin/firefox