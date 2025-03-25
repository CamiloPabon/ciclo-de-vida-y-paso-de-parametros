import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Este es un widget personalizado!',
        style: TextStyle(fontSize: 18, color: Colors.blue),
      ),
    );
  }
}
