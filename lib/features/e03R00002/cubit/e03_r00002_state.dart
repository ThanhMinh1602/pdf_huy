import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/foundation.dart';

part 'e03_r00002_state.g.dart';

@CopyWith()
class E03R00002State {
  final bool isLoading;
  final Uint8List? pdfFilel;

  E03R00002State({
    this.isLoading = false,
    this.pdfFilel
  });
}
