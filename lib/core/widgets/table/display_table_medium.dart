import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'number_paginator.dart';

class DisplayTableMedium extends StatefulWidget {
  const DisplayTableMedium({
    super.key,
    this.padding = 12,
    required this.dataHeader,
    required this.rowsData,
    required this.limit,
    required this.currentPage,
    required this.numberPages,
    required this.onLimitChange,
    required this.onPageChange,
  });

  final double padding;
  final List<String> dataHeader;
  final List<DataRow> rowsData;
  final int limit;
  final int currentPage;
  final int numberPages;
  final void Function(int) onLimitChange;
  final void Function(int) onPageChange;

  @override
  State<DisplayTableMedium> createState() => _DisplayTableMediumState();
}

class _DisplayTableMediumState extends State<DisplayTableMedium> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(widget.padding),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              },
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                clipBehavior: Clip.none,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.65,
                    child: DataTable(
                      border: TableBorder(
                        top: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        right: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        left: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        horizontalInside:
                            const BorderSide(color: Color(0xFFB3E5FC)),
                        verticalInside: const BorderSide(color: Colors.white),
                      ),
                      headingRowColor: MaterialStateProperty.resolveWith(
                        (states) => const Color(0xFFB3E5FC).withOpacity(0.5),
                      ),
                      headingTextStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFF47535D),
                      ),
                      headingRowHeight: 48,
                      columns: widget.dataHeader
                          .map(
                            (e) => DataColumn(
                              label: Center(
                                child: Text(
                                  e,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      rows: widget.rowsData,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
