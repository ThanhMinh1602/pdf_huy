
import 'package:account/features/e01S01003/binding/e01S01003_binding.dart';
import 'package:account/features/e01S01003/widgets/e01S01003_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class E01S01003 extends StatefulWidget {
  const E01S01003({super.key, required String title});

  @override
  State<E01S01003> createState() => _E01S01003State();
}

class _E01S01003State extends State<E01S01003> {
  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: E01S01003Binding.generateBloc,
      child: E01S01003Widget(),
    );
  }
}
