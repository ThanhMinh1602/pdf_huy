// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// void main() {
//   runApp(const MaterialApp(
//     title: 'Syncfusion PDF Viewer Demo',
//     home: HomePage(),
//   ));
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
//   final PdfViewerController _pdfViewerController = PdfViewerController();
//   String? _filePath;

//   Future<void> _pickPDF() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );

//     if (result != null && result.files.single.path != null) {
//       setState(() {
//         _filePath = result.files.single.bytes;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Syncfusion Flutter PDF Viewer'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.bookmark,
//               color: Colors.white,
//               semanticLabel: 'Bookmark',
//             ),
//             onPressed: () {
//               _pdfViewerKey.currentState?.openBookmarkView();
//             },
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.arrow_drop_down_circle,
//               color: Colors.white,
//               semanticLabel: 'Jump to first page',
//             ),
//             onPressed: () {
//               _pdfViewerController.jumpToPage(1);
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: _pickPDF,
//             child: const Text('Chọn tệp PDF'),
//           ),
//           if (_filePath != null)
//             Expanded(
//               child: SfPdfViewer.file(
//                 File(_filePath!),
//                 key: _pdfViewerKey,
//                 controller: _pdfViewerController,
//               ),
//             )
//           else
//             const Center(child: Text('Không có tệp PDF nào được chọn')),
//         ],
//       ),
//     );
//   }
// }
