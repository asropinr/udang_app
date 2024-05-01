import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udang_app/const/colors.dart';
import 'package:udang_app/view/hargaUdang/home_harga_udang_screen.dart';
import 'package:udang_app/view/kabarUdang/kabar_udang_home_screen.dart';
import 'package:udang_app/view/penyakitUdang.dart/penyakit_udang_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    tabController = TabController(vsync: this, length: 3, initialIndex: 0);

    tabController!.addListener(() {
      setState(() {
        //index = tabController!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueTheme,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Jala Media",
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ),
        // ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.blueTheme,
                    width: 3,
                  ),
                ),
              ),
              labelColor: AppColors.blueTheme,
              labelStyle: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: AppColors.greyTab,
              unselectedLabelStyle: GoogleFonts.manrope(
                  fontSize: 14, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  text: "Harga Udang",
                  iconMargin: EdgeInsets.only(bottom: 0),
                ),
                Tab(
                  text: "Kabar Udang",
                  iconMargin: EdgeInsets.only(bottom: 0),
                ),
                Tab(
                  text: "Penyakit",
                  iconMargin: EdgeInsets.only(bottom: 0),
                ),
              ],
            ),
          ),
          Expanded(
            child: SafeArea(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  HomeUdangHargaScreen(),
                  KabarUdangHomeScreen(),
                  PenyakitUdangHomeScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
