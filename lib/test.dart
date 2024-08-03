import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PdfViewerPage(),
    );
  }
}

class PdfViewerPage extends StatefulWidget {
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  PlatformFile? _pdfFile;
  Uint8List? _pdfBytes;

  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _pdfFile = result.files.first;
        _pdfBytes = _pdfFile!.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Viewer')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _pickPdf,
            child: const Text('Pick PDF File'),
          ),
          Expanded(
            child: kIsWeb
                ? _pdfBytes != null
                    ? SfPdfViewer.memory(_pdfBytes!)
                    : const Center(child: Text('No PDF selected'))
                : _pdfFile != null
                    ? SfPdfViewer.file(File(_pdfFile!.path!))
                    : const Center(child: Text('No PDF selected')),
          ),
        ],
      ),
    );
  }
}
