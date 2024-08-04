import 'dart:typed_data';
import 'package:uuid/uuid.dart';

class PdfFileModel {
  final String id;
  final String? name;
  final String? profileType;
  final DateTime? createdAt;
  final String? signatory;
  final Uint8List? pdfFile;
  final bool? scannedDocument;
  final String? note;
  
  PdfFileModel({
    String? id,
    this.name,
    this.profileType,
    this.createdAt,
    this.signatory,
    this.pdfFile,
    this.scannedDocument,
    this.note,
  }) : id = id ?? const Uuid().v4();
}
