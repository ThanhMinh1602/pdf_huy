import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:pdfx/pdfx.dart';
import 'package:http/http.dart' as http;

import 'web_pdf_viewer_stub.dart'
    if (dart.library.html) 'web_pdf_viewer_web.dart';

class PDFViewer extends StatelessWidget {
  final String url;

  PDFViewer({required this.url});

  @override
  Widget build(BuildContext context) {
    return WebPdfViewer(pdfUrl: url);
  }
}
// class DesktopPdfViewer extends StatefulWidget {
//   final String url;

//   DesktopPdfViewer({required this.url});

//   @override
//   _DesktopPdfViewerState createState() => _DesktopPdfViewerState();
// }

// class _DesktopPdfViewerState extends State<DesktopPdfViewer> {
//   late PdfController _pdfController;
//   bool _isLoading = true;
//   Uint8List? _pdfData;

//   @override
//   void initState() {
//     super.initState();
//     _loadPdf();
//   }

//   Future<void> _loadPdf() async {
//     try {
//       final response = await http.get(Uri.parse(widget.url));
//       if (response.statusCode == 200) {
//         setState(() {
//           _pdfData = response.bodyBytes;
//           _pdfController = PdfController(
//             document: PdfDocument.openData(_pdfData!),
//           );
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load PDF');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return Center(child: CircularProgressIndicator());
//     } else if (_pdfData == null) {
//       return Center(child: Text('Failed to load PDF'));
//     } else {
//       return PdfView(
//         controller: _pdfController,
//       );
//     }
//   }
// }
