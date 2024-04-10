// Suspension bridge is a singleton Dart class
import 'package:suspension_bridge/src/models/suspension_bridge_method.dart';

class SuspensionBridge {
  static final SuspensionBridge _instance = SuspensionBridge._internal();

  factory SuspensionBridge() {
    return _instance;
  }

  SuspensionBridge._internal();

  final _channelData = <String, Map<String, dynamic>>{};
  final _methodCallHandlers = <String, Function(SuspensionBridgeMethod)>{};

  void addChannelData(String channelName, String key, dynamic data) {
    if (!_channelData.containsKey(channelName)) {
      _channelData[channelName] = {};
    }
    _channelData[channelName]![key] = data;
  }

  dynamic getChannelData(String channelName, String key) {
    if (_channelData.containsKey(channelName)) {
      return _channelData[channelName]![key];
    }
    return null;
  }

  void registerMethodCallHandler(
    String methodName,
    Function(SuspensionBridgeMethod) handler,
  ) {
    _methodCallHandlers[methodName] = handler;
  }

  void invokeMethod(
    String channelName,
    SuspensionBridgeMethod method,
  ) {
    final handler = _methodCallHandlers[channelName];
    if (handler != null) {
      handler(method);
    }
  }
}
