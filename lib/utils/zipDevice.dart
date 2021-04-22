import 'dart:convert';
import 'dart:io';

import 'package:iot_manager_grpc_api/pb/mqttDeviceManager.pb.dart';

class ZipLocalDevice {
  String name;
  String ip;
  String mac;
  String type;
  String type_name;

  ZipLocalDevice(this.name, this.ip, this.mac, this.type, this.type_name);

  void configMqttServer(MqttInfo mqttInfo) async {
    var DESTINATION_ADDRESS = InternetAddress("255.255.255.255");
    String config = '''{
                "mac":"${mac}",
                "setting":
                {
                  "mqtt_uri":"${mqttInfo.mqttServerHost}",
                  "mqtt_port":${mqttInfo.mqttServerPort},
                  "mqtt_user":"${mqttInfo.mqttClientUserName}",
                  "mqtt_password":"${mqttInfo.mqttClientUserPassword}"
                }
              }''';
    await RawDatagramSocket.bind(InternetAddress.anyIPv4, 10181)
        .then((RawDatagramSocket socket) async {
      socket.broadcastEnabled = true;
      await socket.send(config.codeUnits, DESTINATION_ADDRESS, 10182);
      await Future.delayed(Duration(seconds: 1));
      await socket.send(config.codeUnits, DESTINATION_ADDRESS, 10182);
    });
  }

  static ZipLocalDevice fromMap(Map<String, dynamic> device) {
    ZipLocalDevice zipLocalDevice = ZipLocalDevice(
        device["name"].toString(),
        device["ip"].toString(),
        device["mac"].toString(),
        device["type"].toString(),
        device["type_name"].toString());
    return zipLocalDevice;
  }

  @override
  String toString() {
    return '{name: $name, ip: $ip, mac: $mac, type: $type, type_name: $type_name}';
  }
}

Future<List<ZipLocalDevice>> findZipDevicesFromLocal(int timeOut) async {
  var DESTINATION_ADDRESS = InternetAddress("255.255.255.255");
  List<ZipLocalDevice> zipLocalDeviceList = [];
  await RawDatagramSocket.bind(InternetAddress.anyIPv4, 10181)
      .then((RawDatagramSocket socket) async {
    print('Datagram socket ready to receive');
    print('${socket.address.address}:${socket.port}');
    socket.broadcastEnabled = true;
    socket.send(
        '{"cmd":"device report"}'.codeUnits, DESTINATION_ADDRESS, 10182);
    socket.listen((RawSocketEvent e) {
      Datagram d = socket.receive();
      if (d == null) {
        return;
      }
      String message = new String.fromCharCodes(d.data).trim();
      print('Datagram from ${d.address.address}:${d.port}: ${message}');
      Map<String, dynamic> device = jsonDecode(message);
      print(device);
      //去掉非本格式数据
      if (!device.containsKey("name") ||
          !device.containsKey("ip") ||
          !device.containsKey("mac") ||
          !device.containsKey("type") ||
          !device.containsKey("type_name")) {
        return;
      }
      ZipLocalDevice zipLocalDevice = ZipLocalDevice.fromMap(device);
      //去重
      for (int i = 0; i < zipLocalDeviceList.length; i++) {
        if (zipLocalDeviceList[i].mac == zipLocalDevice.mac) {
          return;
        }
      }
      zipLocalDeviceList.add(zipLocalDevice);
    });
    socket.send(
        '{"cmd":"device report"}'.codeUnits, DESTINATION_ADDRESS, 10182);
    await Future.delayed(Duration(seconds: timeOut))
        .then((value) => socket.close());
    print("findZipDevicesFromLocal:${zipLocalDeviceList.length}");
  });
  return zipLocalDeviceList;
}

main() async {
  List<ZipLocalDevice> zipLocalDeviceList = await findZipDevicesFromLocal(3);
  print(zipLocalDeviceList.length);
  if (zipLocalDeviceList != null) {
    await zipLocalDeviceList.forEach((ZipLocalDevice zipLocalDevice) {
      print("main:$zipLocalDevice");
    });
  }
}
