import 'dart:typed_data';
import 'package:uuid/uuid.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'pdf_file_model.g.dart';

@CopyWith()
class PdfFileModel {
  final String id;
  final String? name;
  final String? profileType;
  final DateTime? createdAt;
  final String? signatory;
  final Uint8List? pdfFile;
  final bool? scannedDocument;
  final String? note;
  final String? pdfPath;
  PdfFileModel({
    String? id,
    this.name,
    this.profileType,
    this.createdAt,
    this.signatory,
    this.pdfFile,
    this.scannedDocument,
    this.note,
    this.pdfPath,
  }) : id = id ?? const Uuid().v4();
}
