import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:udang_app/const/api.dart';
import 'package:udang_app/const/colors.dart';
import 'package:udang_app/const/navigations.dart';
import 'package:udang_app/view/kabarUdang/detail_kabar_udang.dart';
import 'package:udang_app/view/kabarUdang/kabar_udang_provider.dart';

class KabarUdangHomeScreen extends StatefulWidget {
  const KabarUdangHomeScreen({super.key});

  @override
  State<KabarUdangHomeScreen> createState() => _KabarUdangHomeScreenState();
}

class _KabarUdangHomeScreenState extends State<KabarUdangHomeScreen> {
  @override
  void initState() {
    super.initState();
    final data = Provider.of<KabarUdangProvider>(context, listen: false);
    data.getListKabarUdang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<KabarUdangProvider>(
          builder: (context, value, child) {
            if (value.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.blueTheme,
                ),
              );
            }

            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Kabar terbaru",
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blueDark,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: List.generate(
                    value.listKabarUdangModel!.data!.length,
                    (index) => InkWell(
                      onTap: () {
                        Navigations().goTo(
                            context,
                            DetailKabarUdang(
                              id: value.listKabarUdangModel!.data![index].id!,
                              tittle: value
                                  .listKabarUdangModel!.data![index].title!,
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0XFFE5E5E5),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: Image.network(
                                  "${ApiUrl.storageUrl}${value.listKabarUdangModel!.data![index].image}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.listKabarUdangModel!.data![index]
                                        .title!,
                                    style: GoogleFonts.lato(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.titleColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    value.listKabarUdangModel!.data![index]
                                        .metaDescription!,
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      color: AppColors.greyTab,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat("d MMMM yyyy", "id_ID")
                                            .format(DateTime.parse(value
                                                .listKabarUdangModel!
                                                .data![index]
                                                .createdAt!)),
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: AppColors.greyTab,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Clipboard.setData(ClipboardData(
                                                  text:
                                                      "https://app.jala.tech/posts/${value.listKabarUdangModel!.data![index].id}"))
                                              .then((_) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Copied to your clipboard !')));
                                          });
                                        },
                                        child: Image.asset(
                                          "assets/hargaUdang/ic_share.png",
                                          height: 18,
                                          color: const Color(0XFF454646),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
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
