import 'package:flutter/material.dart';

class SpecialElevatedButton extends StatelessWidget {
  final Function()? action;
  final bool enabled;
  final Widget child;
  final Color fg;
  final Color bg;
  final Gradient? gradient;
  final double radius;
  final double height;

  const SpecialElevatedButton({
    super.key,
    this.action,
    this.enabled = true,
    required this.child,
    this.bg = Colors.white,
    this.fg = Colors.black,
    this.height = 70,
    this.radius = 14,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: gradient == null
          ? ElevatedButton(
              onPressed: enabled ? action : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: bg,
                foregroundColor: fg,
                // minimumSize: Size.fromHeight(height),
                padding: const EdgeInsets.symmetric(horizontal: 0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius), side: BorderSide(color: bg == Colors.black ? Colors.white : bg)),
              ),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: height,
                  maxHeight: height,
                  maxWidth: 700,
                ),
                child: Expanded(
                  child: Center(
                    child: child,
                  ),
                ),
              ),
            )
          : ElevatedButton(
              onPressed: enabled ? action : null,
              style: ElevatedButton.styleFrom(
                // minimumSize: Size.fromHeight(height),
                padding: const EdgeInsets.symmetric(horizontal: 0),
                foregroundColor: fg,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius), side: BorderSide(color: bg == Colors.black || gradient != null ? Colors.white : bg)),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: Container(
                  constraints: BoxConstraints(minHeight: height, maxHeight: height, maxWidth: 700),
                  child: Center(
                    child: child,
                  ),
                ),
              ),
            ),
    );
  }
}
