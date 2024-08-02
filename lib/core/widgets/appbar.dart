import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 5.0,
            offset: Offset(0.0, 0.75),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Icon(Icons.grid_view),
                ),
              ),
            ),
            SizedBox(width: 8),
            Text('Danh sách người bệnh tại khoa'),
          ],
        ),
        actions: <Widget>[
          // Right to Left order
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {},
                ),
                Text('BS. Trần Thanh Sơn'),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF4F8FB), // Updated color
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
              child: Text(
                'Bệnh viện A - Khoa Ngoại 1',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                color: Color(0xFFF5F7FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Nhập tên/ Mã màn hình',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ].reversed.toList(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}