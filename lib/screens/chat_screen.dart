import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:help_centre_1/providers/providers.dart';

class ChatScreen extends ConsumerWidget {
  ChatScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final msgList = ref.watch(msgListProvider);

    ref.listen<List<Message>>(msgListProvider, (previous, next) {
      if (previous == null || next.length > previous.length) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Help Center"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          shrinkWrap: true,
            controller: _scrollController,
            itemCount: msgList.length,
            itemBuilder: (context,index){
              final message = msgList[index];
              return Align(
                alignment: message.isSender ? Alignment.topLeft : Alignment.topRight,
                child: message.widget,
              );
        }),
      ),
    );
  }
}
