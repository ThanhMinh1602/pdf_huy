import 'dart:typed_data';

class PdfFileModel {
  final String? id;
  final String? name;
  final String? profileType;
  final DateTime? createdAt;
  final String? signatory;
  final Uint8List? pdfFile;

  PdfFileModel(
      {this.id,
      this.name,
      this.profileType,
      this.createdAt,
      this.signatory,
      this.pdfFile});
}
