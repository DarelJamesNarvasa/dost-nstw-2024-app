import 'package:flutter/material.dart';

class LegendItem {
  final Color color;
  final String text;

  LegendItem({required this.color, required this.text});
}

class LegendPopup extends StatelessWidget {
  final List<LegendItem> items;

  const LegendPopup({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: 200, // Set a width for the dialog content
      decoration: BoxDecoration(
        color: Colors.white, // Set background color to white
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
        children: items.map((item) {
          return Row(
            children: [
              Container(
                width: 20, // Width of the color box
                height: 20, // Height of the color box
                color: item.color, // Set the box color
                margin: EdgeInsets.only(right: 8), // Space between box and text
              ),
              Text(
                item.text, // Text to display
                style: TextStyle(color: Colors.black),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
