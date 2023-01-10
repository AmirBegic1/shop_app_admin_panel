import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  static const String routeName = '\VendorsScreen';

  Widget _rowWidget(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade700,
          ),
          color: Colors.yellow.shade900,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Manage Vendors',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowWidget("Logo", 1),
              _rowWidget("Bussiness name", 3),
              _rowWidget("City", 2),
              _rowWidget("State", 2),
              _rowWidget("Action", 1),
              _rowWidget("View more", 1),
            ],
          ),
        ],
      ),
    );
  }
}
