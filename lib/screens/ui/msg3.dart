import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../utils/widget_dimensions.dart';
class Msg3 extends ConsumerWidget {
  Msg3({super.key});

  final List<Map<String, String>> orders = [
    {
      "title": "Do it Today worlds best selling book by Darius Foroux..",
      "delivery": "Delivery Expected by 17 Jan",
      "image": "assets/images/img2.jpg",
    },
    {
      "title": "Do it Today worlds best selling book by Darius Foroux..",
      "delivery": "Delivery Expected by 19 Jan",
      "image": "assets/images/img1.jpg",
    },
  ];

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final selectedIndex = ref.watch(selectedOrderProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select one of your orders",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return OrderCard(
                    index: index,
                    title: order["title"]!,
                    deliveryDate: order["delivery"]!,
                    imageUrl: order["image"]!,
                    isSelected: selectedIndex == index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends ConsumerWidget {
  final int index;
  final String title;
  final String deliveryDate;
  final String imageUrl;
  final bool isSelected;

  const OrderCard({
    super.key,
    required this.index,
    required this.title,
    required this.deliveryDate,
    required this.imageUrl,
    required this.isSelected,
  });

  void showRatingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const RatingBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build>>$isSelected");
    return GestureDetector(
      onTap: () {
        //ref.read(selectedOrderProvider.notifier).state = index;
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSelected ? Colors.orange : Colors.grey.shade300,
            width: 2,
          ),
        ),
        elevation: isSelected ? 4 : 1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              // Book Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imageUrl, width: 50, height: 70, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),
              // Text Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      deliveryDate,
                      style: const TextStyle(color: Colors.orange, fontSize: 12),
                    ),
                  ],
                ),
              ),
              // Checkbox
              Checkbox(
                value: isSelected,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                activeColor: Colors.orange,
                onChanged: (bool? value) {
                  ref.read(selectedOrderProvider.notifier).state = index;
                  Future.delayed(Duration(milliseconds: 500),(){
                    ref.read(msgListProvider.notifier).addMsg(Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: getTextMessageWidth(context),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF3FF), // Light blue background
                          borderRadius: BorderRadius.circular(12), // Rounded corners
                        ),
                        child: Text("Hello Sahil! I am Priya your personal assistant from Customer Care Service.Let me go through your order and check its current status. Wait a moment please."),),
                    ),true);
                    Future.delayed(Duration(seconds: 1),(){
                      ref.read(msgListProvider.notifier).addMsg(Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),child: Text("Ok sure"),),
                      ),false);
                      Future.delayed(Duration(milliseconds: 900),(){
                        ref.read(msgListProvider.notifier).addMsg(Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: getTextMessageWidth(context),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Color(0xFFEFF3FF), // Light blue background
                              borderRadius: BorderRadius.circular(12), // Rounded corners
                            ),
                            child: Text("Thank you for waiting Sahil! I just checked your order status and seems like there was a problem on our end. We are really sorry about that. You will receive your parcel within 2 days."),),
                        ),true);
                        Future.delayed(Duration(milliseconds: 900),(){
                          ref.read(msgListProvider.notifier).addMsg(Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: getTextMessageWidth(context),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xFFEFF3FF), // Light blue background
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                              ),
                              child: Text("Is there anything else I can help you with?"),),
                          ),true);
                          Future.delayed(Duration(seconds: 1),(){
                            ref.read(msgListProvider.notifier).addMsg(Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),child: Text("Nope, all good."),),
                            ),false);
                            Future.delayed(Duration(milliseconds: 900),(){
                              ref.read(msgListProvider.notifier).addMsg(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: getTextMessageWidth(context),
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF3FF), // Light blue background
                                    borderRadius: BorderRadius.circular(12), // Rounded corners
                                  ),
                                  child: Text("Great! Have a nice day! Was happy to help you."),),
                              ),true);
                              showRatingBottomSheet(context);
                            });
                          });
                        });
                      });
                    });
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingBottomSheet extends ConsumerWidget {
  const RatingBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(ratingProvider);
    final TextEditingController commentController = TextEditingController();

    return Padding(
      padding: EdgeInsets.only(
        left: 16, right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Rate our service",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Profile
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://i.pravatar.cc/100"), // Dummy profile image
                radius: 24,
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Priya", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("Customer Care Service", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Star Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                onPressed: () {
                  ref.read(ratingProvider.notifier).state = index + 1;
                },
                icon: Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                  size: 32,
                ),
              );
            }),
          ),

          // Comment Box
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: commentController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Your comment",
              ),
            ),
          ),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context); // Close bottom sheet
                },
                child: const Text("Skip"),
              ),
              ElevatedButton(
                onPressed: () {
                  String comment = commentController.text;
                  print("Rating: $rating, Comment: $comment");
                  Navigator.pop(context); // Close bottom sheet
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text("Submit"),
              ),
            ],
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
