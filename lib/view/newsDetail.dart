import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Detail extends StatefulWidget {
  final String url;
  const Detail({super.key, required this.url});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: Stack(
        children: [
          //test
          Offstage(
            offstage: !_isLoading,
            child: const Center(
              child: CircularProgressIndicator(), // Show loading indicator
            ),
          ),
          WebView(
            initialUrl: widget.url,
            // Replace with your desired website URL
            javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
            onPageFinished: (url) {
              setState(() {
                _isLoading =
                    false; // Set loading state to false when page finished loading
              });
            },
          ),
        ],
      ),
    );
  }
}