import 'package:flutter/material.dart';

class RGBContainer extends StatefulWidget {
  const RGBContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<RGBContainer> createState() => _RGBContainerState();
}

class _RGBContainerState extends State<RGBContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.red, Colors.green, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
        shape: BoxShape.rectangle,
      ),
      child: AnimatedContainer(
        duration: const Duration(seconds: 3),
        onEnd: () {
          setState(() {});
        },
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.primaries[DateTime.now().second % Colors.primaries.length],
              Colors.primaries[
                  (DateTime.now().second + 1) % Colors.primaries.length],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: widget.child,
      ),
    );
  }
}
