import 'package:flutter/cupertino.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.onPressed, required this.title, required this.subtitle});
final VoidCallback onPressed;
final String title;
final String subtitle;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: CupertinoColors.systemGrey5,
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
