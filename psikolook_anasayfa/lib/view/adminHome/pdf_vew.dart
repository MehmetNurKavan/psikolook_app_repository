import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/utils.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatefulWidget {
  PdfViewerController? pdfViewerController;
  final url;
  PdfView({Key? key, required this.url, this.pdfViewerController})
      : super(key: key);

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    if (widget.url == "" || widget.url == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Psikolook', style: TextStyle(color: Colors.white)),
        ),
        body: const Center(
          child: Text('PDF Kayıtlı değil.'),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Psikolook', style: TextStyle(color: Colors.white)),
        ),
        body: SfPdfViewer.network(
          widget.url,
          controller: widget.pdfViewerController,
        ),
      );
    }
  }
}
