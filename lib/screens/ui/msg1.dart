import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:help_centre_1/providers/providers.dart';
import 'package:help_centre_1/screens/ui/msg2.dart';

import '../../utils/widget_dimensions.dart';
class Msg1 extends ConsumerWidget {
  Msg1({super.key});

  final List<String> issues = [
    "Order Issue",
    "Technical Assistance",
    "Product Quality",
    "Payment Issue",
    "Track Order",
    "Cancel Order",
    "Other"
  ];

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final isClick = ref.watch(msg1_provider);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            width: getTextMessageWidth(context),
            decoration: BoxDecoration(
              color: Color(0xFFEFF3FF), // Light blue background
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            child: Text("Welcome to Indiazona Help! We're sorry for any inconvenience, Please select your issue."),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("What is your issue?",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 12, // Horizontal spacing
              runSpacing: 12, // Vertical spacing
              children: List.generate(
                issues.length,
                    (index) => ChoiceChip(
                  label: Text(issues[index]),
                  showCheckmark: false,
                  labelStyle: TextStyle(
                    color: isClick.index == index ? Colors.white : Colors.blueGrey,
                  ),
                  backgroundColor: Colors.white,
                  selectedColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  selected: isClick.index == index,
                  onSelected: (bool selected) {
                    ref.read(msg1_provider.notifier).state =
                        BtnAppear(isClick: selected, index: selected ? index : -1);

                    ref.read(msgListProvider.notifier).addMsg(
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(issues[index]),
                      ),
                      false,
                    );

                    if (index == 0) {
                      ref.read(msgListProvider.notifier).addMsg(Msg2(), true);
                    }
                  },
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
