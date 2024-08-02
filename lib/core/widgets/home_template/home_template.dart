import 'package:account/core/const/colors.dart';
import 'package:account/core/widgets/home_template/custom_dialog.dart';
import 'package:account/core/widgets/home_template/custom_drawer.dart';
import 'package:account/core/widgets/home_template/custom_dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTemplate extends StatefulWidget {
  Widget child;
  bool isPrimaryNavigationVisible;
  String title;
  HomeTemplate({
    super.key,
    required this.title,
    required this.child,
    required this.isPrimaryNavigationVisible,
  });

  @override
  State<HomeTemplate> createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isExpand = false;
  late bool _isVisible;
  late bool _isDashBoard;
  String selectedDepartment = '';

  void _onMenuTap() {
    setState(() {
      _isExpand = !_isExpand;
    });
  }

  void _onMenuDoubleTap() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    _isVisible = widget.isPrimaryNavigationVisible;
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.grey.withOpacity(0.9),
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'THÔNG TIN HỆ THỐNG',
          body: Container(
            padding:
                const EdgeInsets.only(left: 60, right: 60, bottom: 15, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Khoa phòng',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 15,
                    color: AppColors.foundation,
                  ),
                ),
                CustomDropdownButtonFormField(
                  items: const [
                    'Khoa gây mê hồi sức',
                    'Khoa cấp cứu',
                    'Khoa khám bệnh',
                  ],
                ),
              ],
            ),
          ),
          leftButton: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 35,
              alignment: Alignment.center,
              // padding: EdgeInsets.symmetric(vertical: 12.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.primaryDark),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: const Text(
                'Bỏ qua',
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ),
          rightButton: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 35,
              alignment: Alignment.center,
              // padding: EdgeInsets.symmetric(vertical: 12.0),
              decoration: const BoxDecoration(
                color: AppColors.primaryMain,
                border: Border(
                  top: BorderSide(color: AppColors.primaryMain),
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: const Text(
                'Xác nhận',
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.white,
        ),
        Scaffold(
          backgroundColor: AppColors.transparent,
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            surfaceTintColor: AppColors.transparent,
            shadowColor: AppColors.shadowBar,
            elevation: 4,
            title: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
              ),
            ),
            leadingWidth: 170,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onDoubleTap: () {
                    _onMenuDoubleTap();
                  },
                  onTap: () {
                    _onMenuTap();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    padding: const EdgeInsets.all(8),
                    height: 40,
                    width: 40,
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                        4,
                        (index) => Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          height: 15.0,
                          width: 15.0,
                          margin: const EdgeInsets.all(2.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 90,
                  height: 90,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset(
                    'assets/icons/ghim.svg',
                    height: 10,
                    width: 10,
                  ),
                ),
              ],
            ),
            actions: [
              Container(
                width: 200,
                height: 30,
                margin: const EdgeInsets.only(right: 10),
                child: TextField(
                  style: const TextStyle(fontSize: 13, fontFamily: 'Nunito'),
                  decoration: InputDecoration(
                    hintText: 'Nhập tên/ Mã màn hình',
                    suffixIcon: SvgPicture.asset(
                      'assets/icons/search.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColors.lightGrey,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 5.0),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showCustomDialog(context);
                },
                child: Container(
                  height: 30,
                  width: 145,
                  margin: const EdgeInsets.only(right: 30),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(3)),
                  child: const Text(
                    'Khoa Gây Mê Hồi Sức',
                    style: TextStyle(
                      color: AppColors.textBlue,
                      fontSize: 13,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: false,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  'assets/icons/thong_bao.svg',
                  height: 20,
                  width: 20,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  'assets/icons/person.svg',
                  height: 20,
                  width: 18,
                ),
              ),
              const Text(
                'BS. Trần Thanh Sơn',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
          // drawer: CustomDrawer(),
          drawerScrimColor: AppColors.transparent,
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/Background_1.png',
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                children: [
                  if (_isVisible && !_isExpand)
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 100,
                      color: AppColors.white,
                      child: CustomDrawer(isExpanded: _isExpand),
                    ),
                  widget.child,
                ],
              ),
              if (_isVisible && _isExpand)
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: MediaQuery.of(context)
                        .size
                        .height, // Set a specific height
                    // margin: EdgeInsets.only(top: appBarHeight),
                    width: 250, // Set the width of the drawer
                    color: AppColors.white,
                    child: CustomDrawer(isExpanded: _isExpand),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
