// ignore: depend_on_referenced_packages
import 'package:account/features/e03R00002/cubit/e03_r00002_state.dart';
import 'package:account/features/e03R00002/domain/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/foundation.dart';

class E03R00002Cubit extends Cubit<E03R00002State> {
  final PdfPickerUsecase pdfPickerUsecase;
  E03R00002Cubit({required this.pdfPickerUsecase}) : super(E03R00002State());
}

extension HandleCubit on E03R00002Cubit {
  Future<void> pdfPicker() async {
    emit(state.copyWith(isLoading: true));
    final pdfData = await pdfPickerUsecase.call();
    print('pdfData$pdfData');
    emit(state.copyWith(isLoading: false, pdfFilel: pdfData));
  }
}
