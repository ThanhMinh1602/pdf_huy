// web_pdf_viewer_web.dart

import 'dart:html' as html;
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';

class WebPdfViewer extends StatelessWidget {
  final String pdfUrl;

  WebPdfViewer({required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    final String viewId = 'pdf-$pdfUrl';

    // Register a view factory to create an IFrameElement
    ui.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
      final iframe = html.IFrameElement()
        ..src = pdfUrl
        ..style.border = 'none'
        ..allowFullscreen = true;
      return iframe;
    });

    return HtmlElementView(viewType: viewId);
  }
}
