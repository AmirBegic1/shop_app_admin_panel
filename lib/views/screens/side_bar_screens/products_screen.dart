import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '\ProductScreen';
  const ProductScreen({Key? key}) : super(key: key);

  Widget _rowHeader(String text, int flex) {
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
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
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
              'Product screen',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader("Image", 1),
              _rowHeader("Name", 3),
              _rowHeader("Price", 2),
              _rowHeader("Quantity", 2),
              _rowHeader("Action", 1),
              _rowHeader("View more", 1),
            ],
          ),
        ],
      ),
    );
  }
}
