import 'dart:async';

import 'package:get/get.dart';
import 'package:news_shots_app/app/data/db/database.dart';

class DebugController extends GetxController {
  final AppLocalDB _db;
  final localsession = Rxn<LocalSessionData>();

  StreamSubscription? _localSessionSubs;

  DebugController(this._db);
  @override
  void onInit() {
    _localSessionSubs = _db.localSessionsDao.getLocalSession().listen((event) {
      event.fold((l) => null, (r) {
        localsession.value = r;
      });
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _localSessionSubs?.cancel();
    super.onClose();
  }
}
