

import 'package:grpc/grpc.dart';
import 'package:iot_manager_grpc_api/pb/common.pb.dart';
import 'package:iot_manager_grpc_api/pb/portManager.pb.dart';
import 'package:iot_manager_grpc_api/pb/portManager.pbgrpc.dart';
import 'package:openiothub_api/openiothub_api.dart';

import 'IoTManagerChannel.dart';

class PortManager {
  // rpc GetAllPorts (Empty) returns (PortInfoList) {}
  static Future<PortInfoList> GetAllPorts() async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = PortManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    Empty empty = Empty();
    PortInfoList portInfoList = await stub.getAllPorts(empty);
    print('GetAllPorts: ${portInfoList}');
    channel.shutdown();
    return portInfoList;
  }
  // rpc AddPort (PortInfo) returns (OperationResponse) {}
  static Future<OperationResponse> AddPort(PortInfo portInfo) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = PortManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    OperationResponse operationResponse = await stub.addPort(portInfo);
    print('AddPort: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
  // rpc UpdatePort (PortInfo) returns (OperationResponse) {}
  static Future<OperationResponse> UpdatePort(PortInfo portInfo) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = PortManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    Empty empty = Empty();
    OperationResponse operationResponse = await stub.updatePort(portInfo);
    print('UpdatePort: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
  // rpc DelPort (PortInfo) returns (OperationResponse) {}
  static Future<OperationResponse> DelPort(PortInfo portInfo) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = PortManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    Empty empty = Empty();
    OperationResponse operationResponse = await stub.delPort(portInfo);
    print('DelPort: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
}