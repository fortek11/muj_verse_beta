import 'package:flutter/material.dart';

class MenuBadge extends StatelessWidget {
  final String title;
  final String image;
  const MenuBadge({required this.title, required this.image, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15))],
          color: const Color.fromARGB(255, 208, 209, 215),
          borderRadius: BorderRadius.circular(25.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            maxRadius: 13,
            backgroundColor: Colors.transparent,
            child: Image.asset(image),
          ),
          const SizedBox(
            width: 8,
          ),
          FittedBox(
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
