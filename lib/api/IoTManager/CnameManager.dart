
import 'package:grpc/grpc.dart';
import 'package:iot_manager_grpc_api/pb/cnameManager.pbgrpc.dart';
import 'package:iot_manager_grpc_api/pb/common.pb.dart';
import 'package:openiothub_api/openiothub_api.dart';

import 'IoTManagerChannel.dart';

class CnameManager {
  //    普通配置一次性操作多个
  // rpc GetCnameByKey (StringValue) returns (StringValue) {}
  static Future<StringValue> GetCnameByKey(String value) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = CnameManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    StringValue stringValueKey = StringValue();
    stringValueKey.value = value;
    StringValue stringValue = await stub.getCnameByKey(stringValueKey);
    print('GetCnameByKey: ${stringValue}');
    channel.shutdown();
    return stringValue;
  }
  // rpc GetAllCname (Empty) returns (CnameMap) {}
  static Future<CnameMap> GetAllCname() async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = CnameManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    Empty empty = Empty();
    CnameMap cnameMap = await stub.getAllCname(empty);
    print('GetAllCname: ${cnameMap}');
    channel.shutdown();
    return cnameMap;
  }
  //    创建或者更新
  // rpc SetCnameByKey (CnameMap) returns (OperationResponse) {}
  static Future<OperationResponse> SetCnameByKey(CnameMap cnameMap) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = CnameManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    OperationResponse operationResponse = await stub.setCnameByKey(cnameMap);
    print('SetCnameByKey: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
  //    删除
  // rpc DelAllCname (CnameMap) returns (OperationResponse) {}
  static Future<OperationResponse> DelAllCname(CnameMap cnameMap) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = CnameManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    OperationResponse operationResponse = await stub.delAllCname(cnameMap);
    print('DelAllCname: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
  // rpc DelCnameByKey (StringValue) returns (OperationResponse) {}
  static Future<OperationResponse> DelCnameByKey(String value) async {
    String jwt = await getJWT();
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = CnameManagerClient(channel,
        options: CallOptions(metadata: {'jwt': jwt}));
    StringValue stringValue = StringValue();
    stringValue.value = value;
    OperationResponse operationResponse = await stub.delCnameByKey(stringValue);
    print('DelCnameByKey: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
}