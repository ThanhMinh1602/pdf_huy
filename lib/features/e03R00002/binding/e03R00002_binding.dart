import 'package:account/features/e03R00002/cubit/e03_r00002_cubit.dart';
import 'package:account/features/e03R00002/domain/usecase.dart';
import 'package:flutter/material.dart';

class E03R00002Binding {
  static E03R00002Cubit generateCubit(BuildContext context) {
    return E03R00002Cubit(
      pdfPickerUsecase: PdfPickerUsecase(),
    );
  }
}
