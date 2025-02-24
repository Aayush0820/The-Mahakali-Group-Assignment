
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:help_centre_1/screens/ui/msg1.dart';

class BtnAppear{
  bool isClick;
  int index;
  BtnAppear({
    required this.isClick,
    required this.index
});
}

class Message{
  Widget widget;
  bool isSender;
  Message({
    required this.widget,
    required this.isSender
});
}

class ClickNotifier extends StateNotifier<BtnAppear> {
  ClickNotifier() : super(BtnAppear(isClick: false, index: -1));

  void toggleClick(int index) {
    if(state.isClick){
      state = BtnAppear(isClick: false, index: -1);
    }else{
      state = BtnAppear(isClick: true, index:index);
    }
  }
}

final msg1_provider = StateNotifierProvider<ClickNotifier, BtnAppear>((ref) {
  return ClickNotifier();
});

final msg2_provider = StateNotifierProvider<ClickNotifier, BtnAppear>((ref) {
  return ClickNotifier();
});

class MsgsNotifier extends StateNotifier<List<Message>> {
  MsgsNotifier() : super([Message(widget: Msg1(), isSender: true)]);
  void addMsg(Widget widget,bool isSender){
    state = [...state,Message(widget: widget, isSender: isSender)];
  }
}

final msgListProvider = StateNotifierProvider<MsgsNotifier,List<Message>>((ref){
  return MsgsNotifier();
});

final selectedOrderProvider = StateProvider<int?>((ref) => null);

final ratingProvider = StateProvider<int>((ref) => 0);