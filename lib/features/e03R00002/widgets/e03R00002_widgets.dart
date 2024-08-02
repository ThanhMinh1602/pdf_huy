import 'package:account/features/e03R00002/widgets/e03R00002_data_table.dart';
import 'package:account/features/e03R00002/widgets/e03R00002_pdf.dart';
import 'package:flutter/material.dart';

class E03R00002Widget extends StatelessWidget {
  const E03R00002Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            E03R00002DataTable(),
            SizedBox(width: 2.0),
            E03R00002Pdf(),
          ],
        ),
      ),
    );
  }
}
