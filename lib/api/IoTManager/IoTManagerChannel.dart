import 'package:openiothub_constants/openiothub_constants.dart';
import 'package:grpc/grpc.dart';

class Channel {
  static Future<ClientChannel> getDefaultIoTManagerChannel() async {
    final channel = ClientChannel(Config.iotManagergRpcIp,port: Config.iotManagerRpcPort,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));
    return channel;
  }
}
