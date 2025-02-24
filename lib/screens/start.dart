import 'package:flutter/material.dart';
import 'package:help_centre_1/screens/chat_screen.dart';
class StartScr extends StatefulWidget {
  const StartScr({super.key});

  @override
  State<StartScr> createState() => _StartScrState();
}

class _StartScrState extends State<StartScr> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return ChatScreen();
          })
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

