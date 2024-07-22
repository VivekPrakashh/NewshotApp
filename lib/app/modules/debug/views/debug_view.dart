import 'dart:developer';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/debug_controller.dart';

class DebugView extends GetView<DebugController> {
  const DebugView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.find<FirebaseCrashlytics>().crash();
          },
          label: const Text("Test Crash"),
        ),
        appBar: AppBar(
          title: const Text('Debug View'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const TabBar(tabs: [
              Tab(
                text: "local session data",
              ),
              Tab(
                text: "Log file",
              )
            ]),
            Expanded(
              child: TabBarView(children: [
                SingleChildScrollView(
                  child: Obx(() {
                    final data = (controller.localsession.value
                            ?.toJson()
                            .entries
                            .map((e) {
                          // final value =;
                          return DataRow(cells: [
                            DataCell(
                              SizedBox(
                                  width: Get.width * 0.4,
                                  child: Row(
                                    children: [
                                      const Icon(Icons.copy),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(child: Text(e.key)),
                                    ],
                                  )),
                              onTap: () {
                                log("${e.key}: ${e.value}");
                                Clipboard.setData(
                                        ClipboardData(text: "${e.value}"))
                                    .then((value) {
                                  EasyLoading.showToast("Copied to clipboard",
                                      toastPosition:
                                          EasyLoadingToastPosition.bottom);
                                });
                              },
                            ),
                            DataCell(SizedBox(
                                width: Get.width * 0.35,
                                child: Text("${e.value}"))),
                          ]);
                        }).toList()) ??
                        [];

                    return DataTable(columns: const [
                      DataColumn(label: Text("Key")),
                      DataColumn(label: Text("Value")),
                      // DataColumn(label: Text("Copy")),
                    ], rows: data);
                  }),
                ),
                const LogPage(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  LogPageState createState() => LogPageState();
}

class LogPageState extends State<LogPage> {
  String _logContents = '';
  File? _logFile;

  @override
  void initState() {
    super.initState();
    _readLogFile();
  }

  Future<void> _readLogFile() async {
    final directory = await getApplicationDocumentsDirectory();
    _logFile = File('${directory.path}/app.log');

    String contents = '';
    if (await _logFile!.exists()) {
      contents = await _logFile!.readAsString();
    }

    setState(() {
      _logContents = contents;
    });
  }

  void _shareLogFile() {
    if (_logFile != null) {
      Share.shareXFiles([XFile(_logFile!.path)], text: 'Here are my app logs.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Logs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _shareLogFile,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_logContents),
        ),
      ),
    );
  }
}
