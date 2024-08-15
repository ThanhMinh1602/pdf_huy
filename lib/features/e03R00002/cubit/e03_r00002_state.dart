import 'package:account/features/e03R00002/models/pdf_file_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:file_picker/file_picker.dart';
part 'e03_r00002_state.g.dart';

@CopyWith()
class E03R00002State {
  final bool isLoading;
  final PdfFileModel? pdfFileModel;
  final PlatformFile? filePickerResult;
  final List<PdfFileModel>? pdfFileModels;
  final DateTime? createdAt;
  final String? profileType;
  final String? signatory;
  final bool scannedDocument;
  final int? currentPage;
  final int? maxPage;
  final double? currentZoom;
  final bool isEdit;
  final int quarterTurns;

  E03R00002State(
      {this.isLoading = false,
      this.filePickerResult,
      this.pdfFileModel,
      this.pdfFileModels,
      this.createdAt,
      this.profileType,
      this.signatory,
      this.scannedDocument = false,
      this.currentPage,
      this.maxPage,
      this.currentZoom,
      this.isEdit = false,
      this.quarterTurns = 0});
}
