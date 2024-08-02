import 'package:account/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog(
      {required String title,
        required Widget body,
        required Widget leftButton,
        required Widget rightButton})
      : _title = title,
        _body = body,
        _leftButton = leftButton,
        _rightButton = rightButton;
  final String _title;
  final Widget _body;
  final Widget _leftButton;
  final Widget _rightButton;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 500.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _title,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: AppColors.textBlack,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/close.svg',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _body,
              SizedBox(height: 20),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _leftButton,
                  ),
                  Expanded(
                    child: _rightButton,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

