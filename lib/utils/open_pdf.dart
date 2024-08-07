import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:pdfx/pdfx.dart';

class OpenPdf {
  static Future<PdfDocument> openPdfDocument(
      PlatformFile filePickerResult) async {
    if (kIsWeb) {
      return await PdfDocument.openData(filePickerResult.bytes!);
    } else {
      return await PdfDocument.openFile(filePickerResult.path!);
    }
  }
}
