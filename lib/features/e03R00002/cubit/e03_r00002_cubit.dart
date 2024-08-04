// ignore: depend_on_referenced_packages
import 'package:account/features/e03R00002/cubit/e03_r00002_state.dart';
import 'package:account/features/e03R00002/domain/usecase/file_picker_usecase.dart';
import 'package:account/features/e03R00002/models/pdf_file_model.dart';
import 'package:bloc/bloc.dart';

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
        createdAt: state.createdAt ?? DateTime.now(),
      ),
    );
  }

  void selectProfileType(String? profileType) {
    emit(state.copyWith(profileType: profileType));
  }

  void selectSignatory(String? signatory) {
    emit(state.copyWith(signatory: signatory));
  }

  void onSubmitPdfFile(PdfFileModel pdfFileModel) {
    final filePickerResult = state.filePickerResult;
    if (filePickerResult == null) return;

    print('pdfFileModel${pdfFileModel.id}');

    // Tạo danh sách mới và đảo ngược
    final updatedPdfFileModels = [
      ...?state.pdfFileModels,
      pdfFileModel,
    ].reversed.toList();
    // Phát ra trạng thái mới với danh sách đã đảo ngược
    emit(
      state.copyWith(
        pdfFileModels: updatedPdfFileModels,
      ),
    );
    clearState();
  }

  void removePdfFile(String id) {
    final updatedPdfFileModels =
        state.pdfFileModels?.where((model) => model.id != id).toList() ?? [];
    emit(state.copyWith(pdfFileModels: updatedPdfFileModels));
  }

  Future<void> saveAndSubmitAllFile() async {
    //submit data lên api
    //........
    //clear data list
    emit(state.copyWith(pdfFileModels: []));
  }

  Future<void> onSelectDateTime(DateTime time) async {
    emit(state.copyWith(createdAt: time));
  }

  void scannedDocumentOnCheck(bool scanned) {
    emit(state.copyWith(scannedDocument: scanned));
  }

  void reviewDocument(PdfFileModel pdfFileModel) {
    emit(state.copyWith(
        createdAt: pdfFileModel.createdAt,
        profileType: pdfFileModel.profileType,
        scannedDocument: pdfFileModel.scannedDocument,
        signatory: pdfFileModel.signatory,
        filePickerResult: pdfFileModel.filePickerResult));
  }

  void clearState() {
    emit(state.copyWith(
      filePickerResult: null,
      profileType: null,
      createdAt: null,
      scannedDocument: false,
      signatory: null,
    ));
  }
}
