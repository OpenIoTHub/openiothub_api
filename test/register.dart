import 'package:flutter_test/flutter_test.dart';
import 'package:iot_manager_grpc_api/pb/common.pb.dart';
import 'package:iot_manager_grpc_api/pb/userManager.pb.dart';

import 'package:openiothub_api/openiothub_api.dart';

void main() async {
  LoginInfo loginInfo = LoginInfo();
  loginInfo.userMobile = "17076241859";
  loginInfo.password = "123456";
  OperationResponse operationResponse = await UserManager.RegisterUserWithUserInfo(loginInfo);
  print(operationResponse);
}
