import 'package:flutter/material.dart';
import 'package:raqip_app/constant.dart';

class NavigationItem extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isActive;
  final void Function()? action;
  const NavigationItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isActive,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        width: isActive ? 90 : 50,
        height: 45,
        decoration: isActive
            ? BoxDecoration(
                color: secondColor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              )
            : const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: isActive ? 20 : 25,
              color: isActive ? Colors.white : const Color(0xFFC2C1C1),
            ),
            const SizedBox(width: 5),
            isActive
                ? Text(
                    label,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
