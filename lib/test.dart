import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
// import 'package:printing/printing.dart';
import 'package:universal_html/html.dart' as html;

class PdfUploader extends StatefulWidget {
  const PdfUploader({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PdfUploaderState createState() => _PdfUploaderState();
}

class _PdfUploaderState extends State<PdfUploader> {
  Uint8List? _fileBytes;
  String? _fileName;
  PdfControllerPinch? _pdfControllerPinch;
  PdfController? _pdfController;
  int _rotation = 0;

  Future<void> _pickPdf() async {
    try {
      if (kIsWeb) {
        await _pickPdfWeb();
      } else {
        await _pickPdfMobileDesktop();
      }
    } catch (e) {
      print('Error picking file: $e');
      _showSnackBar('Error picking file: $e');
    }
  }

    Future<void> _pickPdfWeb() async {
      final uploadInput = html.FileUploadInputElement();
      uploadInput.accept = '.pdf';
      uploadInput.click();

      uploadInput.onChange.listen((e) async {
        final files = uploadInput.files;
        if (files!.isEmpty) {
          _showSnackBar('No file selected');
          return;
        }
        final file = files[0];
        final reader = html.FileReader();

        reader.onLoadEnd.listen((e) async {
          setState(() {
            _fileBytes = reader.result as Uint8List?;
            _fileName = file.name;
            if (_fileBytes != null) {
              _pdfControllerPinch = PdfControllerPinch(
                document: PdfDocument.openData(_fileBytes!),
              );
            } else {
              _showSnackBar('Failed to read file data');
            }
          });
        });
        reader.readAsArrayBuffer(file);
      });
    }

    Future<void> _pickPdfMobileDesktop() async {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        withData: true,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        final bytes = file.bytes;
        final name = file.name;
        final path = file.path;
        print('File picked: $name'); // Log file name
        if (bytes != null) {
          print('File bytes length: ${bytes.length}'); // Log file bytes length
          setState(() {
            _fileBytes = bytes;
            _fileName = name;
            try {
              if (kIsWeb ||
                  Platform.isAndroid ||
                  Platform.isIOS ||
                  Platform.isLinux ||
                  Platform.isMacOS ||
                  Platform.isWindows) {
                _pdfController = PdfController(
                  document: PdfDocument.openData(_fileBytes!),
                );
              } else {
                _pdfController = PdfController(
                  document: PdfDocument.openFile(path!),
                );
              }
            } catch (e) {
              print('Error opening PDF document: $e');
              _showSnackBar('Failed to open PDF document');
            }
          });
        } else {
          print('Bytes are null');
          _showSnackBar('Failed to read file data');
        }
      } else {
        print('No file selected or file path is empty');
        _showSnackBar('No file selected or file path is empty');
      }
    }

  Future<void> _downloadFile() async {
    if (_fileBytes != null) {
      try {
        if (kIsWeb) {
          final blob = html.Blob([_fileBytes!]);
          final url = html.Url.createObjectUrlFromBlob(blob);
          final anchor = html.AnchorElement(href: url)
            ..setAttribute('download', _fileName ?? 'file.pdf')
            ..click();
          html.Url.revokeObjectUrl(url);
        } else {
          final dir = await getExternalStorageDirectory();
          final file = File('${dir!.path}/$_fileName');
          await file.writeAsBytes(_fileBytes!, flush: true);
          _showSnackBar('File downloaded to ${file.path}');
        }
      } catch (e) {
        print('Error downloading file: $e');
        _showSnackBar('Failed to download file');
      }
    }
  }

  void _printFile() async {
    if (_fileBytes != null) {
      try {
        // await Printing.sharePdf(
        //   bytes: _fileBytes!,
        //   filename: _fileName ?? 'document.pdf',
        // );
      } catch (e) {
        print('Error sharing file: $e');
        _showSnackBar('Failed to share file: $e');
      }
    } else {
      _showSnackBar('No file selected');
    }
  }

  void _rotatePdf() {
    setState(() {
      _rotation = (_rotation + 90) % 360;
    });
  }

  void _nextPage() {
    _pdfControllerPinch?.nextPage(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 300),
    );
    _pdfController?.nextPage(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _previousPage() {
    _pdfControllerPinch?.previousPage(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 300),
    );
    _pdfController?.previousPage(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _jumpToPage(int page) {
    _pdfControllerPinch?.jumpToPage(page);
    _pdfController?.jumpToPage(page);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Uploader'),
        actions: <Widget>[
          if (_fileBytes != null) ...[
            IconButton(
              icon: Icon(Icons.rotate_right),
              onPressed: _rotatePdf,
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: _previousPage,
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: _nextPage,
            ),
            IconButton(
              icon: Icon(Icons.download),
              onPressed: _downloadFile,
            ),
            IconButton(
              icon: Icon(Icons.print),
              onPressed: _printFile,
            ),
          ],
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_fileBytes == null)
              ElevatedButton(
                onPressed: _pickPdf,
                child: Text('Pick PDF'),
              )
            else
              Expanded(
                child: _pdfControllerPinch != null
                    ? RotatedBox(
                        quarterTurns: _rotation ~/ 90,
                        child: PdfViewPinch(
                          controller: _pdfControllerPinch!,
                        ),
                      )
                    : _pdfController != null
                        ? RotatedBox(
                            quarterTurns: _rotation ~/ 90,
                            child: PdfView(
                              controller: _pdfController!,
                            ),
                          )
                        : const CircularProgressIndicator(),
              ),
            if (_fileName != null) Text('PDF Selected: $_fileName'),
            if (_pdfControllerPinch != null || _pdfController != null) ...[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Go to page',
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (value) {
                  final page = int.tryParse(value);
                  if (page != null) {
                    _jumpToPage(
                        page - 1); // Pages are 0-indexed in PdfController
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
