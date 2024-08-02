import 'package:account/core/const/colors.dart';
import 'package:account/core/widgets/home_template/sub_menu_tool_tip.dart';
import 'package:flutter/material.dart';

class MainMenuTooltip extends StatefulWidget {
  final Widget child;
  final List<String> buttonNames;
  final List<String> buttonPaths;

  const MainMenuTooltip({
    required this.child,
    required this.buttonNames,
    required this.buttonPaths,
  });

  @override
  _MainMenuTooltipState createState() => _MainMenuTooltipState();
}

class _MainMenuTooltipState extends State<MainMenuTooltip> {
  OverlayEntry? _overlayEntry;
  bool _isHovering = false;
  bool _tooltipVisible = false;
  int _hoveredIndex = -1;
  final GlobalKey _buttonKey = GlobalKey();

  void _showTooltip(BuildContext context, Offset position) {
    if (_tooltipVisible) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
      _buttonKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final position = renderBox.localToGlobal(Offset.zero);
        final size = renderBox.size;

        _overlayEntry = OverlayEntry(
          builder: (context) => SubMenuToolTip(
            position: Offset(position.dx + size.width, position.dy),
            buttonNames: widget.buttonNames,
            buttonPaths: widget.buttonPaths,
            onHoverEnter: _onTooltipHoverEnter,
            onHoverExit: _onTooltipHoverExit,
            onSubMenuHoverEnter: _onSubMenuHoverEnter,
            onSubMenuHoverExit: _onSubMenuHoverExit,
          ),
        );

        Overlay.of(context)?.insert(_overlayEntry!);
        setState(() {
          _tooltipVisible = true;
        });
      }
    });
  }

  void _onTooltipHoverEnter() {
    setState(() {
      _isHovering = true;
    });
  }

  void _onTooltipHoverExit() {
    setState(() {
      _isHovering = false;
      _delayedHideTooltip();
    });
  }

  void _hideTooltip() {
    setState(() {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _tooltipVisible = false;
    });
  }

  void _delayedHideTooltip() {
    Future.delayed(Duration(milliseconds: 0), () {
      if (!_isHovering) {
        _hideTooltip();
      }
    });
  }

  void _onChildHoverExit() {
    setState(() {
      _isHovering = false;
      _delayedHideTooltip();
    });
  }

  void _onSubMenuHoverEnter(int index) {
    setState(() {
      _hoveredIndex = index;
    });
  }

  void _onSubMenuHoverExit(int index) {
    setState(() {
      _hoveredIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovering = true;
          _showTooltip(context, event.position);
        });
      },
      onExit: (_) => _onChildHoverExit(),
      child: Container(
        key: _buttonKey,
        child: widget.child,
        color: _isHovering ? AppColors.mainMenu : AppColors.drawerBg,
      ),
    );
  }
}
