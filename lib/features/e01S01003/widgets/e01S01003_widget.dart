import 'package:account/core/widgets/home_template/home_template.dart';
import 'package:account/features/e01S01003/widgets/left_page/e01S01003_left_page.dart';
import 'package:account/features/e01S01003/widgets/right_page/e01S01003_right_page.dart';
import 'package:flutter/material.dart';

class E01S01003Widget extends StatelessWidget {
  const E01S01003Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
      isPrimaryNavigationVisible: true,
      title: "NHÓM QUYỀN",
      child: Expanded(
        child: Row(
          children: [
            E01S01003LeftPage(),
            SizedBox(width: 8.0),
            E01S01003RightPage(),
          ],
        ),
      ),
    );
  }
}
