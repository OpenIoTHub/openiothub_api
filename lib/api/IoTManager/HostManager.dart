

import 'package:grpc/grpc.dart';
import 'package:iot_manager_grpc_api/pb/common.pb.dart';
import 'package:iot_manager_grpc_api/pb/hostManager.pbgrpc.dart';
import 'package:openiothub_api/openiothub_api.dart';

import 'IoTManagerChannel.dart';

class HostManager {
  // rpc GetAllHosts (Empty) returns (HostInfoList) {}
  static Future<HostInfoList> GetAllHosts() async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = HostManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    Empty empty = Empty();
    HostInfoList hostInfoList = await stub.getAllHosts(empty);
    print('GetAllHosts: ${hostInfoList}');
    channel.shutdown();
    return hostInfoList;
  }
  // rpc AddHost (HostInfo) returns (OperationResponse) {}
  static Future<OperationResponse> AddHost(HostInfo hostInfo) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = HostManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    OperationResponse hostInfoList = await stub.addHost(hostInfo);
    print('OperationResponse: ${hostInfoList}');
    channel.shutdown();
    return hostInfoList;
  }
  // rpc UpdateHost (HostInfo) returns (OperationResponse) {}
  static Future<OperationResponse> UpdateHost(HostInfo hostInfo) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = HostManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    OperationResponse hostInfoList = await stub.updateHost(hostInfo);
    print('OperationResponse: ${hostInfoList}');
    channel.shutdown();
    return hostInfoList;
  }
  // rpc DelHost (HostInfo) returns (OperationResponse) {}
  static Future<OperationResponse> DelHost(HostInfo hostInfo) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = HostManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    OperationResponse hostInfoList = await stub.delHost(hostInfo);
    print('DelHost: ${hostInfoList}');
    channel.shutdown();
    return hostInfoList;
  }
}