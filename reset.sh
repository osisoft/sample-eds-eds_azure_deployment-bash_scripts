echo "Reset: Read settings from config.ini..."
source <(grep = config.ini | tr -d "\r")

echo "Reset: Deleting IoT Edge device in IoT Hub..."
az iot hub device-identity delete --device-id $DeviceId --hub-name $HubName

echo "Reset: Send device reset script to device..."
scp -r reset-device.sh $UserName@$IpAddress:/usr/local/eds-install

echo "Reset: Running device reset script..."
ssh $UserName@$IpAddress /usr/local/eds-install/reset-device.sh

echo "Reset: Complete!"
