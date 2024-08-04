import 'package:account/core/models/item_base_model.dart';
import 'package:account/features/e03R00002/models/pdf_file_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdfx/pdfx.dart';
part 'e03_r00002_state.g.dart';

@CopyWith()
class E03R00002State {
  final bool isLoading;
  final FilePickerResult? filePickerResult;
  final List<PdfFileModel>? pdfFileModels;
  final DateTime? createdAt;
  final String? profileType;
  final String? signatory;
  final bool? scannedDocument;

  E03R00002State(
      {this.isLoading = false,
      this.filePickerResult,
      this.pdfFileModels,
      this.createdAt,
      this.profileType,
      this.signatory,
      this.scannedDocument = false});
}
