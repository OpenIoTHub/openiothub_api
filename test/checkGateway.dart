import 'package:flutter_test/flutter_test.dart';
import 'package:gateway_grpc_api/pb/service.pb.dart';
import 'package:iot_manager_grpc_api/pb/common.pb.dart';
import 'package:iot_manager_grpc_api/pb/userManager.pb.dart';

import 'package:openiothub_api/openiothub_api.dart';

void main() async {
  String ip = "iotserv-desktop.local";
  int port = 38825;
  LoginResponse loginResponse = await GatewayLoginManager.CheckGatewayLoginStatus(ip, port);
  print(loginResponse.message);
}
