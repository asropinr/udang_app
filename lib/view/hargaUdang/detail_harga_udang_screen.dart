import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:udang_app/const/api.dart';
import 'package:udang_app/const/colors.dart';
import 'package:udang_app/view/hargaUdang/harga_udang_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailHargaUdang extends StatefulWidget {
  final int id;
  final String idRegion;
  const DetailHargaUdang({
    super.key,
    required this.id,
    required this.idRegion,
  });

  @override
  State<DetailHargaUdang> createState() => _DetailHargaUdangState();
}

class _DetailHargaUdangState extends State<DetailHargaUdang> {
  @override
  void initState() {
    super.initState();
    final data = Provider.of<HargaUdangProvider>(context, listen: false);
    data.getDetailHargaUdang(widget.id, widget.idRegion);
  }

  convertToIdr(int number) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'IDR ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(number);
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
            "Harga Udang",
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
                        text:
                            "https://app.jala.tech/shrimp_prices/${widget.id}"))
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
        body: Consumer<HargaUdangProvider>(
          builder: (context, value, child) {
            if (value.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.blueTheme,
                ),
              );
            }

            String spilt1 = value
                .detailHargaUdangModel!.data!.dateRegionFullName!
                .split("-")
                .last;
            String provinsi = spilt1.split(",").first;
            List<String> parts = spilt1.split(',');
            String daerah = parts.skip(1).join(',').replaceAll(" ", "");
            return ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provinsi,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: AppColors.titleColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        daerah,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: AppColors.greyTab,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            DateFormat("d MMMM yyyy", "id_ID").format(
                                DateTime.parse(value.detailHargaUdangModel!
                                    .data!.creator!.createdAt!)),
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              color: AppColors.greyTab,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          value.detailHargaUdangModel!.data!.creator!.buyer ==
                                  true
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: AppColors.orangeLight,
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/hargaUdang/ic_verif.png",
                                        height: 16,
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "Terverifikasi",
                                        style: GoogleFonts.lato(
                                          fontSize: 12,
                                          color: AppColors.titleColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: AppColors.borderColor,
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: Text(
                                    "belum terverifikasi",
                                    style: GoogleFonts.lato(
                                      fontSize: 12,
                                      color: AppColors.titleColor,
                                    ),
                                  ),
                                )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                "${ApiUrl.storageUrl}${value.detailHargaUdangModel!.data!.creator!.avatar!}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Supplier",
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: const Color(0XFFA09E9E),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                value.detailHargaUdangModel!.data!.creator!
                                    .name!,
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: AppColors.titleColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kontak",
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: const Color(0XFFA09E9E),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                value.detailHargaUdangModel!.data!.creator!
                                    .phone!,
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: AppColors.titleColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              final Uri launchUri = Uri(
                                scheme: 'tel',
                                path: value.detailHargaUdangModel!.data!
                                    .creator!.phone!,
                              );
                              await launchUrl(launchUri);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.blueTheme,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "Hubungi",
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Daftar Harga",
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: AppColors.titleColor,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Size 20",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Text(
                                convertToIdr(
                                    value.detailHargaUdangModel!.data?.size20 ??
                                        0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 30",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Text(
                                convertToIdr(
                                    value.detailHargaUdangModel!.data?.size30 ??
                                        0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 40",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Text(
                                convertToIdr(
                                    value.detailHargaUdangModel!.data?.size40 ??
                                        0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 50",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Text(
                                convertToIdr(
                                    value.detailHargaUdangModel!.data?.size50 ??
                                        0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 60",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Text(
                                convertToIdr(
                                    value.detailHargaUdangModel!.data?.size60 ??
                                        0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 70",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Text(
                                convertToIdr(
                                    value.detailHargaUdangModel!.data?.size70 ??
                                        0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 80",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Text(
                                convertToIdr(
                                    value.detailHargaUdangModel!.data?.size80 ??
                                        0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 90",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Text(
                                convertToIdr(
                                    value.detailHargaUdangModel!.data?.size90 ??
                                        0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 100",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Text(
                                convertToIdr(value
                                        .detailHargaUdangModel!.data?.size100 ??
                                    0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 110",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Text(
                                convertToIdr(value
                                        .detailHargaUdangModel!.data?.size110 ??
                                    0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 120",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Text(
                                convertToIdr(value
                                        .detailHargaUdangModel!.data?.size120 ??
                                    0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 130",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Text(
                                convertToIdr(value
                                        .detailHargaUdangModel!.data?.size130 ??
                                    0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 140",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Text(
                                convertToIdr(value
                                        .detailHargaUdangModel!.data?.size140 ??
                                    0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 150",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Text(
                                convertToIdr(value
                                        .detailHargaUdangModel!.data?.size150 ??
                                    0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 160",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Text(
                                convertToIdr(value
                                        .detailHargaUdangModel!.data?.size160 ??
                                    0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 170",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Text(
                                convertToIdr(value
                                        .detailHargaUdangModel!.data?.size170 ??
                                    0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 180",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Text(
                                convertToIdr(value
                                        .detailHargaUdangModel!.data?.size180 ??
                                    0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 190",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Text(
                                convertToIdr(value
                                        .detailHargaUdangModel!.data?.size190 ??
                                    0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size 200",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Text(
                                convertToIdr(value
                                        .detailHargaUdangModel!.data?.size200 ??
                                    0),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0XFF363637),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Catatan",
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: AppColors.titleColor,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: AppColors.titleColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                )
              ],
            );
          },
        ));
  }
}
