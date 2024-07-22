import 'package:flutter/material.dart';

class FormHelper {
  static Widget iconButton({
    Color? iconColor,
    double? iconSize,
    IconData icon = Icons.add,
    required VoidCallback onTap,
    double size = 40,
    double borderRadius = 50,
    String? label,
    Color? backgroundColor,
  }) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Material(
              color: backgroundColor,
              elevation: 2,
              borderRadius: BorderRadius.circular(borderRadius),
              // color: Get.theme.cardColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(borderRadius),
                onTap: onTap,
                child: SizedBox(
                  height: size,
                  width: size,
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: iconSize,
                  ),
                ),
              ),
            ),
          ),
          if (label != null)
            Text(
              label,
              style: const TextStyle(fontSize: 10),
            )
        ],
      );
}
