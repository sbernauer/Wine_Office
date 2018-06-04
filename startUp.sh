echo "When the container can't connect to X11-Server run the command 'xhost +' on this host to allow access to the x11-server"
echo "This should normaly not be neccassary, because the \".Xauthority\" ist mounted inside the container" 
echo

docker run -it --rm -e DISPLAY \
--network none \
--entrypoint bash \
--volume $HOME/.Xauthority:/home/office/.Xauthority \
--volume /tmp/.X11-unix:/tmp/.X11-unix \
--volume /home/sbernauer/Desktop/Microsoft\ Office\ 2010/:/office \
office:german \
-c "wine explorer & bash"
#-c "wine explorer C:\Program Files\Microsoft Office\Office14 & bash"
