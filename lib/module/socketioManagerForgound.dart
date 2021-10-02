import 'dart:io';

import 'package:fooder/function/dataManagement/Readhostname.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// String host = "https://bypass4-scb-callback.herokuapp.com/";
IO.Socket socket;

class SocketioManagerForgound {
  void init() async {
    socket = IO.io('${HostName()}',
        IO.OptionBuilder().setTransports(['websocket']).build());
    socket.onDisconnect((data) => print("disconnect"));
    socket.onReconnect((data) => print("Connecting........"));
    socket.onConnect((_) {
      print('connect to ${HostName()}');
    });
  }

  void emit(String _topic, String _message) {
    socket.emit('${_topic}', '${_message}');
    // socket.disconnect();
  }

  void subscript(String _topic, Function _func) async {
    print("subscript to ${_topic} connect socket");
    socket.on('$_topic', (data) => _func(data));
    // socket.disconnect();
  }

  void restart() {
    socket.disconnect();
    // Future.delayed(Duration(milliseconds: 100));
    SocketioManagerForgound().init();
  }

  void unsubscript(String _topic) {
    print("unsubcript to ${_topic}");
    socket.off("${_topic}");
  }
}
