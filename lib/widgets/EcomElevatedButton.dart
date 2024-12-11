import 'package:flutter/material.dart';

class EcomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const EcomElevatedButton({
    required this.onPressed,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
