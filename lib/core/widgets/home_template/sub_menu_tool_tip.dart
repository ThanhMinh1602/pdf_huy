import 'package:account/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubMenuToolTip extends StatefulWidget {
  final Offset position;
  final List<String> buttonNames;
  final List<String> buttonPaths;
  final VoidCallback onHoverEnter;
  final VoidCallback onHoverExit;
  final ValueChanged<int> onSubMenuHoverEnter;
  final ValueChanged<int> onSubMenuHoverExit;

  SubMenuToolTip({
    Key? key,
    required this.position,
    required this.buttonNames,
    required this.buttonPaths,
    required this.onHoverEnter,
    required this.onHoverExit,
    required this.onSubMenuHoverEnter,
    required this.onSubMenuHoverExit,
  }) : super(key: key);

  @override
  _SubMenuToolTipState createState() => _SubMenuToolTipState();
}

class _SubMenuToolTipState extends State<SubMenuToolTip> {
  bool _isHovering = false;
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.position.dy,
      left: 100,
      child: MouseRegion(
        onEnter: (_) => widget.onHoverEnter(),
        onExit: (_) => widget.onHoverExit(),
        onHover: (event) {
          setState(() {
            _isHovering = true;
          });
        },
        child: Material(
          color: AppColors.drawerBg,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColors.drawerBg,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(widget.buttonNames.length, (index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go(widget.buttonPaths[index]);
                    _isHovering = false;
                    widget.onHoverExit();
                  },
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        _hoveredIndex = index;
                      });
                      widget.onSubMenuHoverEnter(index);
                    },
                    onExit: (_) {
                      setState(() {
                        _hoveredIndex = null;
                      });
                      widget.onSubMenuHoverExit(index);
                    },
                    child: Material(
                      color: AppColors.transparent,
                      child: Container(
                        width: 200,
                        color: _hoveredIndex == index
                            ? AppColors.subMenu
                            : AppColors.drawerBg,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          widget.buttonNames[index],
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
