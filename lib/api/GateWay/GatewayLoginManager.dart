import 'package:openiothub_api/api/GateWay/GateWayChannel.dart';
import 'package:gateway_grpc_api/pb/service.pb.dart';
import 'package:gateway_grpc_api/pb/service.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class GatewayLoginManager {
  static Future<LoginResponse> CheckGatewayLoginStatus(
      String gatewayIp, int gatewayPort) async {
    final channel = await Channel.getGateWayChannel(gatewayIp, gatewayPort);
    final stub = GatewayLoginManagerClient(channel);
    LoginResponse loginResponse = await stub.checkGatewayLoginStatus(Empty());
    print('GetOpenIoTHubToken: ${loginResponse}');
    channel.shutdown();
    //未登录返回false，登录了返回true
    return loginResponse;
  }

  static Future<LoginResponse> LoginServerByToken(
      String tokenValue, String gatewayIp, int gatewayPort) async {
    final channel = await Channel.getGateWayChannel(gatewayIp, gatewayPort);
    final stub = GatewayLoginManagerClient(channel);
    Token token = Token();
    token.value = tokenValue;
    LoginResponse loginResponse =
        await stub.loginServerByToken(token);
    print('LoginServerByServerInfo: ${loginResponse}');
    channel.shutdown();
    return loginResponse;
  }
}
