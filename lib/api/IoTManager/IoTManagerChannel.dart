import 'dart:io';

import 'package:openiothub_constants/openiothub_constants.dart';
import 'package:grpc/grpc.dart';

class Channel {
  static Future<ClientChannel> getDefaultIoTManagerChannel() async {
    ClientChannel channel;
    if (Platform.isMacOS) {
      final channel = ClientChannel("127.0.0.1",port: Config.iotManagerRpcPort,
          options: const ChannelOptions(
              credentials: const ChannelCredentials.insecure()));
      return channel;
    }
    channel = ClientChannel(Config.iotManagergRpcIp,port: Config.iotManagerRpcPort,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));
    return channel;
  }
}
