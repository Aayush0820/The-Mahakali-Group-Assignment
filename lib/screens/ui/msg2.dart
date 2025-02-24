import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:help_centre_1/providers/providers.dart';

import 'msg3.dart';

class Msg2 extends ConsumerWidget {
  Msg2({super.key});

  final msgs = [
    "I didn't receive my parcel",
    "I want to cancel my order",
    "I want to return my order",
    "Package was damage",
    "Other"
  ];

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final msg2Provider = ref.watch(msg2_provider);

    return SizedBox(
      height: MediaQuery.of(context).size.height*0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Order Issue?"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flexible(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: msgs.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: ChoiceChip(
                        label: Text(msgs[index]),
                        labelStyle: TextStyle(
                          color:
                          msg2Provider.index == index ? Colors.white : Colors.blueGrey,
                        ),
                        showCheckmark: false,
                        backgroundColor: Colors.white,
                        selectedColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        selected: msg2Provider.index == index,
                        onSelected: (bool selected) {
                          ref.read(msg1_provider.notifier).state = BtnAppear(isClick: selected, index: selected?index:-1);
                          ref.read(msgListProvider.notifier).addMsg(Container(
                            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                            child: Text(msgs[index]),),false);
                          if(index==0){
                            ref.read(msgListProvider.notifier).addMsg(Msg3(),true);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
