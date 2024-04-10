# Suspension Bridge

This simple but powerful package provides a communication layer that can bridge multiple Flutter projects together.

Suspension Bridge facilitates the following:

1. Two way data communication
2. Two way method call handling and method invocations

This project is heavily inspired by the Method Channel API.

## Data Passage

You can save data to a channel.

```
SuspensionBridge().addChannelData(
      'investment',
      'authData',
      {
        "accessToken": "<some token string>",
        "refreshToken" "<some token string>"
      },
    );
```

The same data can then be extracted in another Flutter project.

```
final authData = SuspensionBridge().getChannelData(
      'investment',
      'authData',
    );
```

## Method Call Handling

Register method call hanlders.

```
SuspensionBridge().registerMethodCallHandler(
    'golden-gate-bridge',
    (SuspensionBridgeMethod method) {
      print('Received method call: ${method.methodName}');
      if (method.methodName == 'print') {
        print(method.methodData?.runtimeType);
        print(method.methodData);
      } else if (method.methodName == 'prettyPrint') {
        print('-- Pretty print starts --');
        print(method.methodData?.runtimeType);
        print(method.methodData);
        print('-- Pretty print ends --');
      }
    },
  );
```

Invoke methods from different locations.
```
SuspensionBridge().invokeMethod(
'golden-gate-bridge',
SuspensionBridgeMethod(
    'prettyPrint',
    methodData: 'Hello, world! Welcome to Golden Gate Bridge!',
),
);

SuspensionBridge().invokeMethod(
'golden-gate-bridge',
SuspensionBridgeMethod(
    'print',
    methodData: ['Hello', 'world!'],
),
);
```