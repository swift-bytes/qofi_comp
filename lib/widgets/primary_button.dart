import 'package:flutter/cupertino.dart';

 class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: CupertinoColors.activeBlue,
      child: Text(
        text,
        style: TextStyle(
          color: CupertinoColors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
