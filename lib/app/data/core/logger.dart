import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';

import 'package:logger/logger.dart';
// import 'package:news_shots_app/app/data/services/log_services.dart';

class ReleaseLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (kDebugMode) {
      return true;
    }

    if (event.level == Level.info || event.level == Level.verbose) return false;
    return true;
  }
}

/// Factory to create a new logger instance every time the object is requested
Logger createLogger() {
  return Logger(
    filter: ReleaseLogFilter(),
    output: _logOutput(),
  );
}

/// Log level to be used with the logger
// LogPrinter _logPrinter() {
//   if (!kDebugMode) {
//     /// this is the log printer crashlytics output
//     return CustomPrinter();
//   }

//   /// this is the log printer for console output
//   return PrettyPrinter();
// }

/// Log level to be used with the logger
LogOutput _logOutput() {
  // return CrashlyticsOutput();
  if (!kDebugMode) {
    return CrashlyticsOutput();
  }
  return ConsoleOutput();
}

class CrashlyticsOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    // Get.find<LoggingService>().logEvent(
    //     "level:${event.origin.level}\nerror:${event.origin.error}\nmessage:${event.origin.message}\nstackTrace:${event.origin.stackTrace}}");

    if (event.level == Level.info || event.level == Level.verbose) return;
    FirebaseCrashlytics.instance.recordError(
        event.origin.error, event.origin.stackTrace,
        reason: event.origin.message,
        fatal: (event.level == Level.error || event.level == Level.wtf),
        printDetails: true);
  }
}

class CustomPrinter extends PrettyPrinter {
  @override
  List<String> log(LogEvent event) {
    String stackTraceStr = (event.stackTrace ?? StackTrace.current).toString();

    /// for firebase crashlytics we need to pass these three params, therefore passing them in an order in the list
    return [event.message.toString(), event.error.toString(), stackTraceStr];
  }
}
