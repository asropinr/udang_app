import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udang_app/const/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailKabarUdang extends StatefulWidget {
  final int id;
  final String tittle;
  const DetailKabarUdang({
    super.key,
    required this.id,
    required this.tittle,
  });

  @override
  State<DetailKabarUdang> createState() => _DetailKabarUdangState();
}

class _DetailKabarUdangState extends State<DetailKabarUdang> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(
            "https://app.jala.tech/web_view/kabar_udang/${widget.id.toString()}"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF1F5F9),
      appBar: AppBar(
        backgroundColor: AppColors.blueTheme,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.tittle,
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(
                      text: "https://app.jala.tech/posts/${widget.id}"))
                  .then((_) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Copied to your clipboard !')));
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                "assets/hargaUdang/ic_share.png",
                height: 20,
              ),
            ),
          )
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
