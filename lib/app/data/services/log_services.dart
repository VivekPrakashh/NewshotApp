// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';

// class LoggingService extends GetxService {
//   late File logFile;

//   @override
//   onInit() {
//     super.onInit();
//     init();
//   }

//   Future<void> init() async {
//     final directory = await getApplicationDocumentsDirectory();
//     logFile = File('${directory.path}/app.log');
//   }

//   Future<void> logEvent(String event) async {
//     final timestamp = DateTime.now().toIso8601String();
//     if (kReleaseMode) {
//       await logFile.writeAsString('$timestamp: $event\n',
//           mode: FileMode.append);
//     }
//   }

//   Future<void> logError(String error) async {
//     final timestamp = DateTime.now().toIso8601String();
//     if (kReleaseMode) {
//       await logFile.writeAsString('$timestamp: ERROR: $error\n',
//           mode: FileMode.append);
//     }
//   }
// }

// class RouteLoggingObserver extends NavigatorObserver {
//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     super.didPush(route, previousRoute);
//     _logRouteChange(route, previousRoute);
//   }

//   @override
//   void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     super.didPop(route, previousRoute);
//     _logRouteChange(previousRoute, route);
//   }

//   void _logRouteChange(Route<dynamic>? newRoute, Route<dynamic>? oldRoute) {
//     // Log the route change here
//     String newRouteName = newRoute?.settings.name ?? 'unknown';
//     String oldRouteName = oldRoute?.settings.name ?? 'unknown';
//     print('Navigated from $oldRouteName to $newRouteName');

//     Get.find<LoggingService>()
//         .logEvent('Navigated from $oldRouteName to $newRouteName');
//     // Here, integrate with your logging system to log to a file
//   }
// }
