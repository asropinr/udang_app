import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:udang_app/const/api.dart';
import 'package:udang_app/const/colors.dart';
import 'package:udang_app/const/navigations.dart';
import 'package:udang_app/view/hargaUdang/detail_harga_udang_screen.dart';
import 'package:udang_app/view/hargaUdang/harga_udang_provider.dart';

class HomeUdangHargaScreen extends StatefulWidget {
  const HomeUdangHargaScreen({super.key});

  @override
  State<HomeUdangHargaScreen> createState() => _HomeUdangHargaScreenState();
}

class _HomeUdangHargaScreenState extends State<HomeUdangHargaScreen> {
  String selectedSize = "20";
  String? selectedKotaId;
  String selectedKotaName = "Indonesia";

  bottomSheetSize() async {
    final res = await showModalBottomSheet(
        enableDrag: false,
        isScrollControlled: true,
        barrierColor: Colors.black.withOpacity(0.3),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        context: context,
        builder: (context) => const BottomSheetSize());

    if (res != null) {
      setState(() {
        selectedSize = res[0];
      });
    }
  }

  bottomSheetLokasi() async {
    final res = await showModalBottomSheet(
        enableDrag: false,
        isScrollControlled: true,
        barrierColor: Colors.black.withOpacity(0.3),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        context: context,
        builder: (context) => const BottomSheetLokasi());

    if (res != null) {
      setState(() {
        selectedKotaId = res[0];
        selectedKotaName = res[1];
      });
      await context
          .read<HargaUdangProvider>()
          .getListHaragUdang(selectedKotaId);
    }
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
  void initState() {
    super.initState();
    final data = Provider.of<HargaUdangProvider>(context, listen: false);
    data.getListHaragUdang("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFFF1F5F9),
        body: Consumer<HargaUdangProvider>(
          builder: (context, value, child) {
            if (value.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.blueTheme,
                ),
              );
            }

            return Stack(
              children: [
                ListView(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              "Coba Fitur Lainnya",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.titleColor,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Alert',
                                              style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            content: Text(
                                              'Berhasil Untuk di Klik',
                                              style: GoogleFonts.lato(
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                            // actions: <Widget>[
                                            //   TextButton(
                                            //     onPressed: () async {

                                            //     },
                                            //     child: Text(
                                            //       'Ganti Password',
                                            //       style: GoogleFonts.manrope(
                                            //           fontSize: 14, color: const Color(0XFF156E5C)),
                                            //     ),
                                            //   ),
                                            // ],
                                          );
                                        },
                                      );
                                    },
                                    child: Image.asset(
                                      "assets/hargaUdang/banner_jali.png",
                                      height: 120,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Alert',
                                              style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            content: Text(
                                              'Berhasil Untuk di Klik',
                                              style: GoogleFonts.lato(
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                            // actions: <Widget>[
                                            //   TextButton(
                                            //     onPressed: () async {

                                            //     },
                                            //     child: Text(
                                            //       'Ganti Password',
                                            //       style: GoogleFonts.manrope(
                                            //           fontSize: 14, color: const Color(0XFF156E5C)),
                                            //     ),
                                            //   ),
                                            // ],
                                          );
                                        },
                                      );
                                    },
                                    child: Image.asset(
                                      "assets/hargaUdang/banner_quiz.png",
                                      height: 120,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Harga terbaru",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.blueDark,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Column(
                            children: List.generate(
                                value.listHargaUdangModel!.data!.length,
                                (index) {
                              String spilt1 = value.listHargaUdangModel!
                                  .data![index].dateRegionFullName!
                                  .split("-")
                                  .last;
                              String provinsi = spilt1.split(",").first;
                              List<String> parts = spilt1.split(',');
                              String daerah =
                                  parts.skip(1).join(',').replaceAll(" ", "");
                              return Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderColor),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      spreadRadius: 0,
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                      blurStyle: BlurStyle.outer,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.network(
                                                  "${ApiUrl.storageUrl}${value.listHargaUdangModel!.data![index].creator!.avatar}",
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Supplier",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  value
                                                      .listHargaUdangModel!
                                                      .data![index]
                                                      .creator!
                                                      .name!,
                                                  style: GoogleFonts.lato(
                                                    fontSize: 14,
                                                    color: AppColors.titleColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        value.listHargaUdangModel!.data![index]
                                                    .creator!.buyer !=
                                                null
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4,
                                                        vertical: 3),
                                                decoration: BoxDecoration(
                                                  color: AppColors.orangeLight,
                                                  borderRadius:
                                                      BorderRadius.circular(28),
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
                                                        color: AppColors
                                                            .titleColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4,
                                                        vertical: 3),
                                                decoration: BoxDecoration(
                                                  color: AppColors.borderColor,
                                                  borderRadius:
                                                      BorderRadius.circular(28),
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
                                      height: 8,
                                    ),
                                    Text(
                                      DateFormat("d MMMM yyyy", "id_ID").format(
                                          DateTime.parse(value
                                              .listHargaUdangModel!
                                              .data![index]
                                              .date!)),
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        color: AppColors.blueLight,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      provinsi,
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        color: AppColors.titleColor,
                                      ),
                                    ),
                                    Text(
                                      daerah,
                                      style: GoogleFonts.lato(
                                        fontSize: 18,
                                        color: AppColors.titleColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Builder(builder: (_) {
                                          if (selectedSize == "20") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size20 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "30") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size30 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "40") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size40 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "50") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size50 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "60") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size60 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "70") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size70 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "80") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size80 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "90") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size90 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "100") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size100 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "110") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size110 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "120") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size120 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "130") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size130 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "140") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size140 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "150") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size150 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "160") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size160 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "170") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size170 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "180") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size180 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (selectedSize == "190") {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size190 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "size $selectedSize",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: AppColors.blueLight,
                                                  ),
                                                ),
                                                Text(
                                                  convertToIdr(value
                                                          .listHargaUdangModel!
                                                          .data?[index]
                                                          .size200 ??
                                                      0),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                        }),
                                        InkWell(
                                          onTap: () {
                                            Navigations().goTo(
                                                context,
                                                DetailHargaUdang(
                                                  id: value.listHargaUdangModel!
                                                      .data![index].id!,
                                                  idRegion: value
                                                      .listHargaUdangModel!
                                                      .data![index]
                                                      .regionId!,
                                                ));
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 8),
                                            decoration: BoxDecoration(
                                              color: AppColors.blueTheme,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              "LIHAT DETAIL",
                                              style: GoogleFonts.lato(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            bottomSheetSize();
                          },
                          child: Container(
                            height: 50,
                            width: 160,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 6),
                            decoration: const BoxDecoration(
                              color: AppColors.blueDark,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                topLeft: Radius.circular(100),
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/hargaUdang/ic_size.png",
                                  height: 24,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Size",
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      selectedSize,
                                      style: GoogleFonts.lato(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            bottomSheetLokasi();
                          },
                          child: Container(
                            height: 50,
                            width: 225,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 4),
                            decoration: const BoxDecoration(
                              color: AppColors.blueTheme,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(100),
                                topRight: Radius.circular(100),
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/hargaUdang/ic_lok.png",
                                  height: 24,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Text(
                                    selectedKotaName,
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}

class BottomSheetSize extends StatefulWidget {
  const BottomSheetSize({super.key});

  @override
  State<BottomSheetSize> createState() => _BottomSheetSizeState();
}

class _BottomSheetSizeState extends State<BottomSheetSize> {
  List dataSize = [
    "20",
    "30",
    "40",
    "50",
    "60",
    "70",
    "80",
    "90",
    "100",
    "110",
    "120",
    "130",
    "140",
    "150",
    "160",
    "170",
    "180",
    "190",
    "200",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Size",
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: AppColors.titleColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Tutup",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: AppColors.blueTheme,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.borderColor),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.height * 0.8,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  dataSize.length,
                  (index) => InkWell(
                    onTap: () {
                      Navigator.pop(context, [dataSize[index]]);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        bottom: 18,
                      ),
                      child: Row(
                        children: [
                          Text(
                            dataSize[index],
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              color: AppColors.titleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomSheetLokasi extends StatefulWidget {
  const BottomSheetLokasi({super.key});

  @override
  State<BottomSheetLokasi> createState() => _BottomSheetLokasiState();
}

class _BottomSheetLokasiState extends State<BottomSheetLokasi> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    super.initState();
    final data = Provider.of<HargaUdangProvider>(context, listen: false);
    data.getListRegion("");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Consumer<HargaUdangProvider>(
          builder: (context, value, child) {
            if (value.isLoadingRegion == true) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.blueTheme,
                ),
              );
            }
            return Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kota/kabupaten",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: AppColors.titleColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Tutup",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: AppColors.blueTheme,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(
                            left: 11,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.bgTextFiled,
                            border: Border.all(
                              color: AppColors.borderColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            onChanged: (value) async {
                              await context
                                  .read<HargaUdangProvider>()
                                  .getListRegion(search.text);
                            },
                            controller: search,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Cari",
                              hintStyle: GoogleFonts.lato(
                                fontSize: 16,
                                color: const Color(0XFFA09E9E),
                              ),
                              prefixIcon: InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  "assets/hargaUdang/ic_search.png",
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () async {
                          search.clear();
                          await context
                              .read<HargaUdangProvider>()
                              .getListRegion(search.text);
                        },
                        child: Image.asset(
                          "assets/hargaUdang/ic_close.png",
                          height: 20,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.borderColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        value.listRegionModel!.data!.length,
                        (index) => InkWell(
                          onTap: () {
                            Navigator.pop(context, [
                              value.listRegionModel!.data![index].id!,
                              value.listRegionModel!.data![index].fullName!,
                            ]);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                              bottom: 18,
                            ),
                            child: Text(
                              value.listRegionModel!.data![index].fullName!,
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: AppColors.titleColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
