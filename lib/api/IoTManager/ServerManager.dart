

import 'package:grpc/grpc.dart';
import 'package:iot_manager_grpc_api/pb/common.pb.dart';
import 'package:iot_manager_grpc_api/pb/serverManager.pb.dart';
import 'package:iot_manager_grpc_api/pb/serverManager.pbgrpc.dart';
import 'package:openiothub_api/openiothub_api.dart';

import 'IoTManagerChannel.dart';

class ServerManager {
  // rpc AddServer (ServerInfo) returns (OperationResponse) {}
  static Future<OperationResponse> AddServer(ServerInfo serverInfo) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = ServerManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    Empty empty = Empty();
    OperationResponse operationResponse = await stub.addServer(serverInfo);
    print('AddServer: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
  // rpc DelServer (ServerInfo) returns (OperationResponse) {}
  static Future<OperationResponse> DelServer(ServerInfo serverInfo) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = ServerManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    OperationResponse operationResponse = await stub.delServer(serverInfo);
    print('DelServer: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
  // rpc UpdateServer (ServerInfo) returns (OperationResponse) {}
  static Future<OperationResponse> UpdateServer(ServerInfo serverInfo) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = ServerManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    OperationResponse operationResponse = await stub.updateServer(serverInfo);
    print('UpdateServer: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
  // rpc QueryServer (StringValue) returns (ServerInfoList) {}
  static Future<ServerInfoList> QueryServer(String value) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = ServerManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    StringValue stringValue = StringValue();
    stringValue.value = value;
    ServerInfoList serverInfoList = await stub.queryServer(stringValue);
    print('QueryServer: ${serverInfoList}');
    channel.shutdown();
    return serverInfoList;
  }
  // rpc GetAllServer (Empty) returns (ServerInfoList) {}
  static Future<ServerInfoList> GetAllServer() async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = ServerManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    Empty empty = Empty();
    ServerInfoList serverInfoList = await stub.getAllServer(empty);
    print('GetAllServer: ${serverInfoList}');
    channel.shutdown();
    return serverInfoList;
  }
}