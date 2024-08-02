import 'package:account/core/const/colors.dart';
import 'package:account/core/widgets/home_template/drawer_item_list.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  bool isExpanded;
  CustomDrawer({required this.isExpanded});
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.drawerBg,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Row(
            mainAxisAlignment: widget.isExpanded
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Container(
                width: 45,
                height: 38,
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.textBlue,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/doctor.png',
                  fit: BoxFit.contain,
                ),
              ),
              if (widget.isExpanded)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BS TRẦN THANH SƠN',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                      ),
                    ),
                    Text(
                      'KHOA GÂY MÊ HỒI SỨC',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          DrawerItemList(isExpanded: widget.isExpanded),
        ],
      ),
    );
  }
}
