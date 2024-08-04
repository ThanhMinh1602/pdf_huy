import 'package:file_picker/file_picker.dart';

class PdfPickerUsecase {
  Future<FilePickerResult?> call() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      return result;
    }
    return null;
  }
}
