import 'package:flutter/material.dart';

 class SecondaryButton extends StatelessWidget {

  const SecondaryButton({
    super.key, 
    required this.text, 
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;
  
  @override

  Widget build(BuildContext context) {
    return ElevatedButton( 
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(54),
        side: BorderSide(color: Color(0xFFDA2F46), width: 2),
        backgroundColor: Colors.transparent, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),

      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0, 
          color: Color(0xFFDA2F46),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
