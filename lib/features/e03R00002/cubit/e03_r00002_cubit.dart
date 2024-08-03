// ignore: depend_on_referenced_packages
import 'package:account/core/models/item_base_model.dart';
import 'package:account/features/e03R00002/cubit/e03_r00002_state.dart';
import 'package:account/features/e03R00002/domain/usecase/file_picker_usecase.dart';
import 'package:account/features/e03R00002/models/pdf_file_model.dart';
import 'package:account/utils/date_format.dart';
import 'package:bloc/bloc.dart';
import 'package:pdfx/pdfx.dart';

class E03R00002Cubit extends Cubit<E03R00002State> {
  final PdfPickerUsecase pdfPickerUsecase;
  E03R00002Cubit({required this.pdfPickerUsecase}) : super(E03R00002State());
}

extension HandleCubit on E03R00002Cubit {
  Future<void> pdfPicker() async {
    emit(state.copyWith(isLoading: true));
    final filePickerResult = await pdfPickerUsecase.call();
    emit(
      state.copyWith(
        isLoading: false,
        filePickerResult: filePickerResult,
        createdAt:
            state.createdAt ?? DateTimeFormat.formatDateDDMMYY(DateTime.now()),
      ),
    );
  }

  void selectProfileType(String? profileType) {
    emit(state.copyWith(profileType: profileType));
  }

  void selectSignatory(String? signatory) {
    emit(state.copyWith(signatory: signatory));
  }

  void onSubmitPdfFile(
      {required String profileType, required String signatory}) {
    final filePickerResult = state.filePickerResult;
    if (filePickerResult == null) return;

    final pdfFileModel = PdfFileModel(
      id: '1',
      name: filePickerResult.files.single.name,
      profileType: profileType,
      createdAt: DateTime.parse(state.createdAt ?? DateTime.now().toString()),
      signatory: signatory,
      pdfFile: filePickerResult.files.single.bytes,
    );

    final updatedPdfFileModels = [
      ...?state.pdfFileModels,
      pdfFileModel,
    ];

    emit(state.copyWith(pdfFileModels: updatedPdfFileModels));
  }

  Future<void> onSelectDateTime(DateTime time) async {
    final date = DateTimeFormat.formatDateDDMMYY(time);
    emit(state.copyWith(createdAt: date));
  }
}
