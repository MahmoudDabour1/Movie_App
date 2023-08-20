import 'package:flutter/material.dart';

class ItemBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final Function() onPress;

  const ItemBottomBar({
    super.key,
    required this.text,
    required this.icon,
    required this.onPress,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                icon,
                color:
                isSelected ? Colors.red : Colors.grey,
                size:25,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color:
                isSelected ? Colors.red : Colors.grey,
                fontSize:isSelected? 16:12,
                fontWeight: isSelected
                    ? FontWeight.w600
                    : FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
