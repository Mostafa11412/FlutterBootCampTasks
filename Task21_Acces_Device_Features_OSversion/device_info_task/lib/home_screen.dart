import 'package:device_info_task/device_info_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getInfo();
  }

  getInfo() async {
    await DeviceInfoManager.getDeviceInfo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Device Info Task'),
      ),
      body: Center(
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Device Model: ${DeviceInfoManager.deviceModel}"),
            Text("Os Type: ${DeviceInfoManager.os}"),
            Text("Os Version: ${DeviceInfoManager.osVersion}"),
          ],
        ),
      ),
    );
  }
}
