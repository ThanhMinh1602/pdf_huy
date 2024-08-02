import 'package:flutter/material.dart';

class NumberPaginator extends StatefulWidget {
  const NumberPaginator({
    super.key,
    required this.limit,
    required this.currentPage,
    required this.numberPages,
    required this.onLimitChange,
    required this.onPageChange,
  });

  final int limit;
  final int currentPage;
  final int numberPages;
  final void Function(int) onLimitChange;
  final void Function(int) onPageChange;

  @override
  State<NumberPaginator> createState() => _NumberPaginatorState();
}

class _NumberPaginatorState extends State<NumberPaginator> {
  late int _limit;
  late int _currentPage;
  late int _numberPages;

  @override
  void initState() {
    super.initState();
    _limit = widget.limit;
    _currentPage = widget.currentPage;
    _numberPages = widget.numberPages;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _displayQuantity(),
        const SizedBox(
          width: 16,
        ),
        if (_numberPages == 0)
          ...[]
        else if (_numberPages == 1) ...[
          _item(1),
        ] else if (_numberPages == 2) ...[
          _item(1),
          const SizedBox(
            width: 12,
          ),
          _item(2),
        ] else if (_numberPages == 3) ...[
          _item(1),
          const SizedBox(
            width: 12,
          ),
          _item(2),
          const SizedBox(
            width: 12,
          ),
          _item(3),
        ] else if (_numberPages == 4) ...[
          _item(1),
          const SizedBox(
            width: 12,
          ),
          _item(2),
          const SizedBox(
            width: 12,
          ),
          _item(3),
          const SizedBox(
            width: 12,
          ),
          _item(4),
        ] else ...[
          _prevButton(),
          const SizedBox(
            width: 12,
          ),
          _item(1),
          const SizedBox(
            width: 12,
          ),
          if (_currentPage > 2 && _currentPage < _numberPages - 1) ...[
            _middle(),
          ] else ...[
            _item(2),
          ],
          const SizedBox(
            width: 12,
          ),
          if (_currentPage > 2 && _currentPage < _numberPages - 1) ...[
            _item(_currentPage)
          ] else ...[
            _middle(),
          ],
          const SizedBox(
            width: 12,
          ),
          if (_currentPage > 2 && _currentPage < _numberPages - 1) ...[
            _middle(),
          ] else ...[
            _item(_numberPages - 1),
          ],
          const SizedBox(
            width: 12,
          ),
          _item(_numberPages),
          const SizedBox(
            width: 12,
          ),
          _nextButton(),
        ]
      ],
    );
  }

  Widget _displayQuantity() {
    return Row(
      children: [
        const Text(
          'Hiện thị',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          height: 28,
          padding: const EdgeInsets.only(
            right: 6,
            left: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: const Color(0xFFCBD2D9),
            ),
          ),
          child: DropdownButton<int>(
            underline: const SizedBox(),
            value: _limit,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
              size: 20,
            ),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            dropdownColor: Colors.white,
            focusColor: Colors.white,
            onChanged: (int? value) {
              widget.onLimitChange.call(value ?? 20);
            },
            items: [
              10,
              20,
              50,
            ].map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _middle() {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xFFC4CDD5),
          width: 1.5,
        ),
      ),
      child: const Center(
        child: Text(
          '...',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFFC4CDD5),
          ),
        ),
      ),
    );
  }

  Widget _item(int page) {
    return InkWell(
      onTap: () {
        if (_currentPage != page) {
          setState(() {
            _currentPage = page;
          });
          widget.onPageChange.call(_currentPage);
        }
      },
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: _currentPage == page
                ? const Color(0xFF006EA9)
                : const Color(0xFFC4CDD5),
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            page.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color:
                  _currentPage == page ? const Color(0xFF006EA9) : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _prevButton() {
    return InkWell(
      onTap: () {
        if (_currentPage != 1) {
          setState(() {
            _currentPage = _currentPage - 1;
          });
          widget.onPageChange.call(_currentPage);
        }
      },
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          color: _currentPage == 1 ? const Color(0xFFC4CDD5) : null,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: const Color(0xFFC4CDD5),
            width: 1.5,
          ),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: _currentPage == 1 ? Colors.white : const Color(0xFFC4CDD5),
          size: 12,
        ),
      ),
    );
  }

  Widget _nextButton() {
    return InkWell(
      onTap: () {
        if (_currentPage != _numberPages) {
          setState(() {
            _currentPage = _currentPage + 1;
          });
          widget.onPageChange.call(_currentPage);
        }
      },
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          color: _currentPage == _numberPages ? const Color(0xFFC4CDD5) : null,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: const Color(0xFFC4CDD5),
            width: 1.5,
          ),
        ),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: _currentPage == _numberPages
              ? Colors.white
              : const Color(0xFFC4CDD5),
          size: 12,
        ),
      ),
    );
  }
}
