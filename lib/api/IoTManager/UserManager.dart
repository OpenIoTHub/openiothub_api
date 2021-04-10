import 'package:iot_manager_grpc_api/pb/common.pb.dart';
import 'package:openiothub_api/api/IoTManager/IoTManagerChannel.dart';
import 'package:iot_manager_grpc_api/pb/userManager.pb.dart';
import 'package:iot_manager_grpc_api/pb/userManager.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class UserManager {
//  注册用户
//  rpc RegisterUserWithUserInfo (LoginInfo) returns (OperationResponse) {}
  static Future<OperationResponse> RegisterUserWithUserInfo(LoginInfo userInfo) async {
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = UserManagerClient(channel);
    OperationResponse operationResponse =
    await stub.registerUserWithUserInfo(userInfo);
    print('RegisterUserWithUserInfo: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
//  登录 获取Token
//  rpc LoginWithUserLoginInfo (LoginInfo) returns (UserLoginResponse) {}
  static Future<UserLoginResponse> LoginWithUserLoginInfo(LoginInfo loginInfo) async {
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = UserManagerClient(channel);
    UserLoginResponse userLoginResponse = await stub.loginWithUserLoginInfo(loginInfo);
    print('GetUserLoginResponse: ${userLoginResponse}');
    channel.shutdown();
    return userLoginResponse;
  }
//  rpc GetUserInfo (Empty) returns (UserInfo) {}
//  更新用户信息
//  rpc UpdateUserNanme (StringValue) returns (OperationResponse) {}
  static Future<OperationResponse> UpdateUserNanme(StringValue stringValue) async {
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = UserManagerClient(channel);
    OperationResponse operationResponse = await stub.updateUserNanme(stringValue);
    print('UpdateUserNanme: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
//  rpc UpdateUserEmail (StringValue) returns (OperationResponse) {}
  static Future<OperationResponse> UpdateUserEmail(StringValue stringValue) async {
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = UserManagerClient(channel);
    OperationResponse operationResponse = await stub.updateUserEmail(stringValue);
    print('UpdateUserEmail: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
//  rpc UpdateUserMobile (StringValue) returns (OperationResponse) {}
  static Future<OperationResponse> UpdateUserMobile(StringValue stringValue) async {
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = UserManagerClient(channel);
    OperationResponse operationResponse = await stub.updateUserMobile(stringValue);
    print('UpdateUserMobile: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
//  rpc UpdateUserPassword (StringValue) returns (OperationResponse) {}
  static Future<OperationResponse> UpdateUserPassword(StringValue stringValue) async {
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = UserManagerClient(channel);
    OperationResponse operationResponse = await stub.updateUserPassword(stringValue);
    print('UpdateUserPassword: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
//  rpc UpdateUserAvatar (UpdateAvatar) returns (OperationResponse) {}
  static Future<OperationResponse> UpdateUserAvatar(UpdateAvatar updateAvatar) async {
    final channel = await Channel.getDefaultIoTManagerChannel();
    final stub = UserManagerClient(channel);
    OperationResponse operationResponse = await stub.updateUserAvatar(updateAvatar);
    print('OperationResponse: ${operationResponse}');
    channel.shutdown();
    return operationResponse;
  }
}
