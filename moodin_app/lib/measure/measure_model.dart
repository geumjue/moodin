import 'package:flutter/material.dart';

enum MeasureState { idle, measuring, done }

class MeasureModel extends ChangeNotifier {
  // ✅ 여기 반드시 extends ChangeNotifier
  bool isMeasuring = false;
  bool isDone = false;

  int hrv = 0;
  int gsr = 0;

  // 예시로 값을 바꾸면 알림 보내기
  void setMeasuredValues({required int newHrv, required int newGsr}) {
    hrv = newHrv;
    gsr = newGsr;
    isDone = true;
    notifyListeners(); // ✅ 이게 있어야 UI가 바뀜
  }
}
