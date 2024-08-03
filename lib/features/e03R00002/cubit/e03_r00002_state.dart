import 'package:account/features/e03R00002/models/pdf_file_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:file_picker/file_picker.dart';
part 'e03_r00002_state.g.dart';

@CopyWith()
class E03R00002State {
  final bool isLoading;
  final FilePickerResult? filePickerResult;
  final List<PdfFileModel>? pdfFileModels;
  final String? createdAt;

  E03R00002State(
      {this.isLoading = false,
      this.filePickerResult,
      this.pdfFileModels ,
      this.createdAt});
}
