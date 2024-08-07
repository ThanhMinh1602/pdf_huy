import 'package:file_picker/file_picker.dart';

class PdfPickerUsecase {
  Future<PlatformFile?> call() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      return result.files.single;
    }
    return null;
  }
}
