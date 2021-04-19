import 'package:iot_manager_grpc_api/pb/mqttDeviceManager.pb.dart';
import 'package:openiothub_api/api/IoTManager/MqttDeviceManager.dart';

void main() async {
  MqttDeviceModelList mqttDeviceModelList = await MqttDeviceManager.GetAllMqttDeviceModels();
  print(mqttDeviceModelList.mqttDeviceModelsList);
}
