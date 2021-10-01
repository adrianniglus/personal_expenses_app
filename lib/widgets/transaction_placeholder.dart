import 'package:flutter/material.dart';

class TransactionPlaceholder extends StatelessWidget {
  const TransactionPlaceholder();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        children: [
          SizedBox(height: constraint.maxHeight * 0.15),
          SizedBox(
            height: constraint.maxHeight * 0.1,
            child: const Text(
              'No transactions added yet!',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: constraint.maxHeight * 0.15),
          Container(
            child: Opacity(
                opacity: 0.2, child: Image.asset('assets/images/waiting.png')),
            height: constraint.maxHeight * 0.6,
            alignment: Alignment.center,
          ),
        ],
      );
    });
  }
}
