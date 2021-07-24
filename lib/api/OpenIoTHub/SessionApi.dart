import 'package:iot_manager_grpc_api/pb/gatewayManager.pb.dart';
import 'package:openiothub_api/api/IoTManager/GatewayManager.dart';
import 'package:openiothub_api/api/IoTManager/HostManager.dart';
import 'package:openiothub_api/api/OpenIoTHub/OpenIoTHubChannel.dart';
import 'package:openiothub_api/api/OpenIoTHub/Utils.dart';
import 'package:openiothub_grpc_api/pb/service.pb.dart';
import 'package:openiothub_grpc_api/pb/service.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class SessionApi {
//  TODO 可以选择grpc所执行的主机，可以是安卓本机也可以是pc，也可以是服务器
  static Future createOneSession(SessionConfig config) async {
    final channel = await Channel.getOpenIoTHubChannel();
    final stub = SessionManagerClient(channel);
    final response = await stub.createOneSession(config);
    print('createOneSession: ${response}');
    channel.shutdown();
  //  从服务器创建配置再同步，所以这里不需要保存到服务器
  }

  static Future deleteOneSession(SessionConfig config) async {
    final channel = await Channel.getOpenIoTHubChannel();
    final stub = SessionManagerClient(channel);
    await stub.deleteOneSession(config);
    channel.shutdown();
    //同步删除服务器上的配置
    GatewayInfo gatewayInfo = GatewayInfo();
    gatewayInfo.gatewayUuid = config.runId;
    GatewayManager.DelGateway(gatewayInfo);
  }

  static Future<SessionList> getAllSession() async {
    final channel = await Channel.getOpenIoTHubChannel();
    final stub = SessionManagerClient(channel);
    final response = await stub.getAllSession(new OpenIoTHubEmpty());
    print('getAllSession received: ${response.sessionConfigs}');
    channel.shutdown();
    return response;
  }

  static Future<SessionConfig> getOneSession(String runId) async {
    final channel = await Channel.getOpenIoTHubChannel();
    final stub = SessionManagerClient(channel);
    SessionConfig sessionConfig = SessionConfig();
    sessionConfig.runId = runId;
    final newSessionConfig = await stub.getOneSession(sessionConfig);
    channel.shutdown();
    return newSessionConfig;
  }

  static Future<PortList> getAllTCP(SessionConfig sessionConfig) async {
    final channel = await Channel.getOpenIoTHubChannel();
    final stub = SessionManagerClient(channel);
    final response = await stub.getAllTCP(sessionConfig);
    print('getAllTCP received: ${response.portConfigs}');
    channel.shutdown();
    return response;
  }

  static Future<OpenIoTHubEmpty> refreshmDNSServices(SessionConfig sessionConfig) async {
    final channel = await Channel.getOpenIoTHubChannel();
    final stub = SessionManagerClient(channel);
    final response = await stub.refreshmDNSProxyList(sessionConfig);
    print('refreshmDNSServices received: ${response}');
    channel.shutdown();
    return response;
  }
  // 通知这个网关删除配置文件中的token
  // rpc DeletRemoteGatewayConfig (SessionConfig) returns (OpenIoTHubOperationResponse) {}
  static Future<OpenIoTHubOperationResponse> deleteRemoteGatewayConfig(SessionConfig sessionConfig) async {
    final channel = await Channel.getOpenIoTHubChannel();
    final stub = SessionManagerClient(channel);
    OpenIoTHubOperationResponse response = await stub.deleteRemoteGatewayConfig(sessionConfig);
    print('deletRemoteGatewayConfig delete: ${sessionConfig.runId}');
    print('deletRemoteGatewayConfig received: ${response}');
    channel.shutdown();
    return response;
  }
}
