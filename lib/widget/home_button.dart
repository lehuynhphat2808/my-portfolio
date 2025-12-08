import 'package:flutter/material.dart';
import 'package:portfolio/common/theme.dart';
import 'package:portfolio/router/router_manager.dart';

class HomeButtonOverlay extends StatefulWidget {
  const HomeButtonOverlay({
    super.key,
    this.label = 'Project',
    this.tabIndex = 2,
    this.icon = Icons.workspaces_outline,
  });

  final String label;
  final int tabIndex;
  final IconData icon;

  @override
  State<HomeButtonOverlay> createState() => _HomeButtonOverlayState();
}

class _HomeButtonOverlayState extends State<HomeButtonOverlay> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      child: SafeArea(
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: _hovered ? 1 : 0),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOut,
            builder: (context, t, _) {
              final Color base = AppTheme.buttonColor.withOpacity(0.9);
              final Color hover = AppTheme.indicatorColor.withOpacity(0.95);
              final Color bg = Color.lerp(base, hover, t)!;
              final Color border = Color.lerp(
                  AppTheme.indicatorColor.withOpacity(0.75),
                  AppTheme.indicatorColor,
                  t)!;
              final Color splash = Colors.white.withOpacity(0.05 + 0.03 * t);

              return ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(bg),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.all(splash),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                  side: MaterialStateProperty.all(
                      BorderSide(color: border, width: 1)),
                  elevation: MaterialStateProperty.all(0),
                ),
                icon: Icon(widget.icon, size: 18),
                label: Text(
                  widget.label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.mainPage,
                      arguments: widget.tabIndex);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
