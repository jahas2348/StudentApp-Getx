import 'package:flutter/material.dart';

import '../controllers/card_controller.dart';

// ignore: must_be_immutable
class cardItemWidgetLarge extends StatelessWidget {
  cardItemWidgetLarge(
      {super.key, this.cardController, this.value, this.Title});
  String? value;
  String? Title;
  final CardController? cardController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            Title!,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
              letterSpacing: 4.0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            value!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade200,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 1,

          )
        ],
      ),
    );
  }
}