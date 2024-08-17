// ignore: depend_on_referenced_packages
import 'package:account/features/e03R00002/cubit/e03_r00002_state.dart';
import 'package:account/features/e03R00002/domain/usecase/file_picker_usecase.dart';
import 'package:account/features/e03R00002/models/pdf_file_model.dart';
import 'package:account/utils/date_format.dart';
import 'package:account/utils/open_pdf.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class E03R00002Cubit extends Cubit<E03R00002State> {
  final PdfPickerUsecase pdfPickerUsecase;
  final PdfViewerController pdfViewerController = PdfViewerController();
  final TextEditingController curentPageController = TextEditingController();
  final TextEditingController percentController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController fileNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  E03R00002Cubit({required this.pdfPickerUsecase}) : super(E03R00002State());
}

extension HandleCubit on E03R00002Cubit {
  void init() {
    percentController.text = '100%';
  }

  Future<void> pdfPicker() async {
    emit(state.copyWith(isLoading: true));

    try {
      final filePickerResult = await pdfPickerUsecase.call();
      if (filePickerResult == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }

      final document = await OpenPdf.openPdfDocument(filePickerResult);
      final maxPage = document.pagesCount;

      curentPageController.text = '1';
      fileNameController.text = filePickerResult.name;

      dateController.text = DateTimeFormat.formatDateDDMMYY(DateTime.now());

      emit(state.copyWith(
          filePickerResult: filePickerResult,
          maxPage: maxPage,
          isLoading: false,
          createdAt: DateTime.now(),
          currentZoom: 100));
    } catch (error) {
      emit(state.copyWith(isLoading: false));
      print('Error picking PDF file: $error');
    }
  }

  Future<void> showSideBar() async {
    try {
      final document = await OpenPdf.openPdfDocument(state.filePickerResult!);
      final pagesCount = document.pagesCount;
      for (int i = 0; i < pagesCount; i++) {
        final page = await document.getPage(i);
        print('page$page');
      }
      pdfViewerController.

      emit(state.copyWith(showSideBar: !state.showSideBar));
    } catch (error) {
      print('Error showing sidebar: $error');
    }
  }

  void rotate() async {
    try {
      final newQuarterTurns = (state.quarterTurns + 1) % 4;
      emit(state.copyWith(quarterTurns: newQuarterTurns));
    } catch (error) {
      print('Error rotating PDF: $error');
    }
  }

  void zoomIn() {
    try {
      final newZoomLevel =
          (pdfViewerController.zoomLevel + 0.2).clamp(1.0, 3.0);
      pdfViewerController.zoomLevel = newZoomLevel;
      final zoomPercentage = (newZoomLevel / 3.0) * 300;
      percentController.text = '${zoomPercentage.toStringAsFixed(0)}%';

      emit(state.copyWith(currentZoom: newZoomLevel));
    } catch (error) {
      print('Error in zoomIn: $error');
    }
  }

  void zoomOut() {
    try {
      final newZoomLevel =
          (pdfViewerController.zoomLevel - 0.2).clamp(1.0, 3.0);
      pdfViewerController.zoomLevel = newZoomLevel;
      final zoomPercentage = (newZoomLevel / 3.0) * 300;
      percentController.text = '${zoomPercentage.toStringAsFixed(0)}%';

      emit(state.copyWith(currentZoom: newZoomLevel));
    } catch (error) {
      print('Error in zoomOut: $error');
    }
  }

  void download() {}

  void printDocument() {}

  void updateCurrentPage(int pageNumber) async {
    try {
      pdfViewerController.jumpToPage(pageNumber);
    } catch (error) {
      print('Error in updateCurrentPage: $error');
    }
  }

  void selectProfileType(String? profileType) {
    emit(state.copyWith(profileType: profileType));
  }

  void selectSignatory(String? signatory) {
    emit(state.copyWith(signatory: signatory));
  }

  void onSubmitPdfFile() {
    try {
      if (state.isEdit == true) {
        clearState();
      }
      final filePickerResult = state.filePickerResult;
      if (filePickerResult == null) return;

      final PdfFileModel pdfFileModel = PdfFileModel(
          name: fileNameController.text,
          profileType: state.profileType,
          createdAt: state.createdAt,
          signatory: state.signatory,
          scannedDocument: state.scannedDocument,
          note: noteController.text,
          pdfFile: kIsWeb ? filePickerResult.bytes : null,
          pdfPath: kIsWeb ? '' : filePickerResult.path ?? '',
          filePickerResult: filePickerResult);
      final updatedPdfFileModels = [
        ...?state.pdfFileModels,
        pdfFileModel,
      ].reversed.toList();
      emit(
        state.copyWith(
          pdfFileModels: updatedPdfFileModels,
        ),
      );

      clearState();
    } catch (error) {
      print('Error in onSubmitPdfFile: $error');
    }
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
    dateController.text = DateTimeFormat.formatDateDDMMYY(time);
    emit(state.copyWith(createdAt: time));
  }

  void scannedDocumentOnCheck(bool scanned) {
    emit(state.copyWith(scannedDocument: scanned));
  }

  void addNew() {
    emit(state.copyWith(isEdit: false));
    clearState();
  }

  Future<void> reviewDocument(PdfFileModel pdfFileModel) async {
    fileNameController.text = pdfFileModel.name!;
    dateController.text =
        DateTimeFormat.formatDateDDMMYY(pdfFileModel.createdAt!);
    curentPageController.text = '1';
    percentController.text = '100%';
    final document =
        await OpenPdf.openPdfDocument(pdfFileModel.filePickerResult);
    final maxPage = document.pagesCount;
    emit(
      state.copyWith(
        createdAt: pdfFileModel.createdAt,
        profileType: pdfFileModel.profileType,
        scannedDocument: pdfFileModel.scannedDocument,
        signatory: pdfFileModel.signatory,
        isEdit: true,
        pdfFileModel: pdfFileModel,
        filePickerResult: pdfFileModel.filePickerResult,
        maxPage: maxPage,
      ),
    );
  }

  void updatePdfFile() {
    try {
      if (state.pdfFileModel == null) return;
      final updatedPdfFileModel = state.pdfFileModel!.copyWith(
        name: fileNameController.text,
        profileType: state.profileType,
        createdAt: state.createdAt,
        signatory: state.signatory,
        scannedDocument: state.scannedDocument,
        note: noteController.text,
        filePickerResult: state.filePickerResult,
        pdfFile: kIsWeb
            ? state.filePickerResult?.bytes
            : state.pdfFileModel?.pdfFile,
        pdfPath: kIsWeb
            ? ''
            : state.filePickerResult?.path ?? state.pdfFileModel?.pdfPath,
      );

      final updatedPdfFileModels = state.pdfFileModels
          ?.map((model) =>
              model.id == updatedPdfFileModel.id ? updatedPdfFileModel : model)
          .toList();

      emit(state.copyWith(
        pdfFileModels: updatedPdfFileModels,
        pdfFileModel: updatedPdfFileModel,
      ));
      clearState();
    } catch (error) {
      print('Error in updatePdfFile: $error');
    }
  }

  void clearState() {
    noteController.clear();
    fileNameController.clear();
    curentPageController.clear();
    pdfViewerController.clearFormData();
    percentController.clear();
    dateController.clear();
    emit(state.copyWith(
      filePickerResult: null,
      profileType: null,
      createdAt: null,
      scannedDocument: false,
      signatory: null,
      currentPage: null,
      currentZoom: null,
      maxPage: null,
      pdfFileModel: null,
    ));
  }
}
