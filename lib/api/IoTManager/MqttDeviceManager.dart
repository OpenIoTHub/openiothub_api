import 'package:grpc/grpc.dart';
import 'package:iot_manager_grpc_api/pb/common.pb.dart';
import 'package:iot_manager_grpc_api/pb/mqttDeviceManager.pbgrpc.dart';
import 'package:iot_manager_grpc_api/pb/userManager.pb.dart';
import 'package:iot_manager_grpc_api/pb/userManager.pbgrpc.dart';
import 'package:openiothub_api/api/IoTManager/IoTManagerChannel.dart';
import 'package:openiothub_api/utils/utils.dart';

class MqttDeviceManager {
  // rpc AddMqttDevice (MqttDeviceInfo) returns (OperationResponse) {}
  static Future<OperationResponse> AddMqttDevice(
      MqttDeviceInfo mqttDeviceInfo) async {
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = MqttDeviceManagerClient(channel);
    OperationResponse operationResponse =
    await stub.addMqttDevice(mqttDeviceInfo);
    print('OperationResponse: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
  // rpc DelMqttDevice (MqttDeviceInfo) returns (OperationResponse) {}
  static Future<OperationResponse> DelMqttDevice(
      MqttDeviceInfo mqttDeviceInfo) async {
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = MqttDeviceManagerClient(channel);
    OperationResponse operationResponse =
    await stub.delMqttDevice(mqttDeviceInfo);
    print('OperationResponse: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
  // rpc GetAllMqttDevice (Empty) returns (MqttDeviceInfoList) {}
  static Future<MqttDeviceInfoList> GetAllMqttDevice() async {
    Empty empty = Empty();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = MqttDeviceManagerClient(channel);
    MqttDeviceInfoList mqttDeviceInfoList =
    await stub.getAllMqttDevice(empty);
    print('MqttDeviceInfoList: ${mqttDeviceInfoList}');
    channel.shutdown();
    return mqttDeviceInfoList;
  }
  // rpc GetAllMqttDeviceModels (Empty) returns (MqttDeviceModelList) {}
  static Future<MqttDeviceModelList> GetAllMqttDeviceModels() async {
    Empty empty = Empty();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = MqttDeviceManagerClient(channel);
    MqttDeviceModelList mqttDeviceModelList =
    await stub.getAllMqttDeviceModels(empty);
    print('MqttDeviceModelList: ${mqttDeviceModelList}');
    channel.shutdown();
    return mqttDeviceModelList;
  }
}
