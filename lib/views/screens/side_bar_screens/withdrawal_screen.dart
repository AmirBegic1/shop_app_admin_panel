import 'package:flutter/material.dart';

class WithdrawalScreen extends StatelessWidget {
  static const String routeName = '\WithdrawalScreen';
  const WithdrawalScreen({Key? key}) : super(key: key);

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
              'WithdrawalScreen',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader('Name', 2),
              _rowHeader('Amount', 3),
              _rowHeader('Bank name', 2),
              _rowHeader('Bank account', 2),
              _rowHeader('Email', 2),
              _rowHeader('Phone', 2),
            ],
          )
        ],
      ),
    );
  }
}
