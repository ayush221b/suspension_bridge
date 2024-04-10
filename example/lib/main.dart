import 'package:flutter/material.dart';
import 'package:suspension_bridge/suspension_bridge.dart';

void main() {
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
