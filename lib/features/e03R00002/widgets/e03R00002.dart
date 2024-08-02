
import 'package:account/features/e03R00002/binding/e03R00002_binding.dart';
import 'package:account/features/e03R00002/widgets/e03R00002_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class E03R00002 extends StatefulWidget {
  const E03R00002({super.key, required String title});

  @override
  State<E03R00002> createState() => _E03R00002State();
}

class _E03R00002State extends State<E03R00002> {
  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: E03R00002Binding.generateCubit,
      child: E03R00002Widget(),
    );
  }
}
