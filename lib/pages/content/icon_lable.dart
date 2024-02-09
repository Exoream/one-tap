import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final IconData iconData;
  final String label;
  final VoidCallback? onPressed;

  const IconLabel({super.key,
    required this.iconData,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(0),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
