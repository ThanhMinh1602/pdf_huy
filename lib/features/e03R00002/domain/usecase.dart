import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';

class PdfPickerUsecase {
  Future<Uint8List?> call() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.bytes != null) {
      return result.files.single.bytes!;
    }
    return null;
  }
}
