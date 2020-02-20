echo Move script to Desktop
mv face.sh /home/adlink/Desktop
mv classify.sh /home/adlink/Desktop
mv object.sh /home/adlink/Desktop
mv AOP ..
mv *.pfs /home/adlink

echo Modify authority of scripts
echo 'adlink' |sudo -S chmod 777 /home/adlink/Desktop/face.sh
echo 'adlink' |sudo -S chmod 777 /home/adlink/Desktop/classify.sh
echo 'adlink' |sudo -S chmod 777 /home/adlink/Desktop/object.sh

echo auto execute face detection when boot up neon-i1000
echo 'adlink' |sudo -S mv autostart /home/adlink/.config/
echo 'adlink' |sudo -S chmod 777 /home/adlink/.config/autostart/CameraCaptute.desktop
