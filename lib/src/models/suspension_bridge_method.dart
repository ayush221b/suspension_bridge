import 'package:flutter/widgets.dart';

class SuspensionBridgeMethod {
  final String methodName;
  final dynamic methodData;
  final BuildContext? context;

  SuspensionBridgeMethod(
    this.methodName, {
    this.methodData,
    this.context,
  });

  // This is a helpful getter that tells if the method carries context
  bool get hasContext => context != null;
}
