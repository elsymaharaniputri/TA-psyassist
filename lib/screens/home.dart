import 'package:flutter/material.dart';
import 'package:psyassist_apk/theme.dart';
import 'package:psyassist_apk/widgets/point_mendengar.dart';
import 'package:psyassist_apk/widgets/dialog_stabilisasi.dart';
import 'package:psyassist_apk/widgets/point_grafik.dart';
import 'package:psyassist_apk/widgets/stabilisasimenu.dart';
import 'package:psyassist_apk/screens/panduan.dart';
// import 'package:psyassist_apk/screens/panduan.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController tabviewController;

  int tabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabviewController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Stabilisasi Emosi',
                  style: medium.copyWith(color: black),
                ),
              ],
            ),
          ),
          centerTitle: true,
          // BACK
          // leading: Container(
          //   margin: EdgeInsets.all(5),
          //   decoration: BoxDecoration(
          //     border: Border.all(color: black, width: 1),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: IconButton(
          //     icon: const Icon(Icons.arrow_back),
          //     onPressed: () {
          //       Navigator.push(
          //           context, MaterialPageRoute(builder: (context) => Home()));
          //     },
          //   ),
          // ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    //--------BANNER AWAL ----------//
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      decoration: BoxDecoration(
                          color: bg_orange,
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Pahami ",
                                      style: large.copyWith(color: white),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Konsep Stabilisasi Emosi !",
                                      style: medium.copyWith(color: white),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  // BUTTON POP UP
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 10.0),
                                              backgroundColor: white,
                                            ),
                                            onPressed: () {
                                              dialogStabilisasi(
                                                  context, 'Pengguna');
                                            },
                                            child: Row(
                                              children: <Widget>[
                                                Text("Klik",
                                                    style: xmedium.copyWith(
                                                        color: ft_orange)),
                                                const SizedBox(width: 10.0),
                                                Icon(Icons.menu_book_outlined,
                                                    color: bg_orange),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //IMAGE
                            Expanded(
                              child: Container(
                                  child: Image.asset(
                                      'assets/images/stabilisasi/download__1_-removebg-preview 2.png')),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //--------PAHAMI TENTANG STRESS DAN TRAUMA ----------//
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      "Pahami Tentang Stress dan Trauma",
                      style: xmedium.copyWith(color: ft_orange),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: bg_blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.asset(
                                  'assets/images/stabilisasi/Group 86.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Stress",
                                  style: xmedium.copyWith(color: ft_orange),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "1. Tidak didahului peristiwa traumatis",
                                  style: regular.copyWith(color: black),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "2. Bertahap, menumpuk, sedikit demi sedikit",
                                  style: regular.copyWith(color: black),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "3. Dampak hilang ketika stressor hilang",
                                  style: regular.copyWith(color: black),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "4. Pengaruh stres berbeda untuk setiap orang",
                                  style: regular.copyWith(color: black),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Trauma",
                                  style: xmedium.copyWith(color: ft_orange),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "1. Didahului peristiwa traumatis",
                                  style: regular.copyWith(color: black),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "2. Terjadi tiba-tiba/mendadak dalam waktu singkat",
                                  style: regular.copyWith(color: black),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "3. Umumnya berdampak jangka panjang",
                                  style: regular.copyWith(color: black),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "4. Pengaruh trauma umumnya sama, yaitu menakutkan",
                                  style: regular.copyWith(color: black),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: bg_orange2,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.asset(
                                  'assets/images/stabilisasi/Group 68.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  //--------SKEMA STABILISASI ----------//
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      "Skema Sebelum Melakukan Stabilisasi",
                      style: xmedium.copyWith(color: ft_orange),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 200,
                      child: Image.asset(
                        'assets/images/stabilisasi/skema.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //--------HAL PENTING DIPERHATIKAN ----------//
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      "Hal Penting Untuk Diperhatikan",
                      style: xmedium.copyWith(color: ft_orange),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Jumlah kolom dalam grid
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        // childAspectRatio: 0.6,
                        mainAxisExtent: 350,
                      ),
                      itemCount: 4, // Jumlah item dalam grid
                      itemBuilder: (context, index) {
                        // Data untuk setiap item dalam grid
                        final menuData = [
                          {
                            'title': 'JANGAN',
                            'image': 'assets/images/stabilisasi/Group 94.png',
                            'subtitle1':
                                'Meminta penyintas untuk sabar atau tenang',
                            'subtitle2':
                                'Langsung memberikan stabilisasi pada anak tanpa ijin orangtua',
                            'subtitle3':
                                'Memaksakan penyintas melakukan stabilisasi.',
                            'subtitle4': "",
                            'bg_color': bg_orange,
                            'title_color': white,
                            'ft_color': white,
                            'btn_color': white,
                            'ft_btn_color': ft_orange,
                            'icon_color': bg_orange,
                          },
                          {
                            'title': 'Lakukan',
                            'image': 'assets/images/stabilisasi/Checked.png',
                            'subtitle1':
                                ' Observasi dan pahami kondisi penyintas. ',
                            'subtitle2':
                                'Bawa kebutuhan pokok yang mungkin dibutuhkan penyintas',
                            'subtitle3': 'Hargai hak penyintas',
                            'subtitle4': "",
                            'bg_color': bg_blue,
                            'title_color': ft_orange,
                            'ft_color': black,
                            'btn_color': bg_orange,
                            'ft_btn_color': white,
                            'icon_color': white,
                          },
                          {
                            'title': 'Urgent',
                            'image': 'assets/images/stabilisasi/Group 96.png',
                            'subtitle1': 'Emosi yang intens',
                            'subtitle2': 'Pengalaman yang tidak terduga',
                            'subtitle3': 'Rutinitas menenangkan dapat membantu',
                            'subtitle4': 'Dukungan sosial',
                            'bg_color': bg_blue,
                            'title_color': ft_orange,
                            'ft_color': black,
                            'btn_color': bg_orange,
                            'ft_btn_color': white,
                            'icon_color': white,
                          },
                          {
                            'title': 'Saat Memulai',
                            'image': 'assets/images/stabilisasi/Group 98.png',
                            'subtitle1':
                                'Minta penyintas melihat dan mendengarkan Anda.',
                            'subtitle2':
                                'Cari tahu apakah penyintas mengetahui siapa dirinya, di mana dirinya, dan apa yang terjadi.',
                            'subtitle3':
                                'Minta penyintas menceritakan lingkungannya',
                            'subtitle4': "",
                            'bg_color': bg_blue,
                            'title_color': ft_orange,
                            'ft_color': black,
                            'btn_color': bg_orange,
                            'ft_btn_color': white,
                            'icon_color': white,
                          },
                        ];

                        return StabilisasiMenu(
                          title: menuData[index]['title'] as String,
                          image: menuData[index]['image'] as String,
                          subtitle1: menuData[index]['subtitle1'] as String,
                          subtitle2: menuData[index]['subtitle2'] as String,
                          subtitle3: menuData[index]['subtitle3'] as String,
                          subtitle4: menuData[index]['subtitle4'] as String,
                          bg_color: menuData[index]['bg_color'] as Color,
                          title_color: menuData[index]['title_color'] as Color,
                          ft_color: menuData[index]['ft_color'] as Color,
                          index: index,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  //--------FACE RECOGNITION----------//

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Fitur Face Recignation Untuk Mengoptimalkan Dukungan Emosional Bagi Penyintas Pasca Bencana",
                                  style: xmedium.copyWith(color: ft_orange),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        backgroundColor: bg_orange,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Panduan()));
                                      },
                                      // onPressed: () {},
                                      child: Row(
                                        children: <Widget>[
                                          Text("Relax",
                                              style: xmedium.copyWith(
                                                  color: white)),
                                          const SizedBox(width: 10.0),
                                          const Icon(Icons.audiotrack_outlined,
                                              color: Colors.white),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      "Fitur Face Recognition menyesuaikan audio relaksasi berdasarkan ekspresi wajah, memberikan dukungan emosional yang lebih personal dan efektif.",
                      style: regular.copyWith(color: black),
                    ),
                  ),

                  const SizedBox(height: 30),

                  //--------GRAFIK----------//
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(children: [
                      Text(
                        "Grafik Informasi Penggunaan Audio Relax",
                        style: xmedium.copyWith(color: ft_orange),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Rating kepuasan dimulai dari skala bintang 1 - 3 , dengan visualisasi warna dari pekat ke pudar ( pekat = bintang 3 , medium = bintang 2 , pudar = bintang 3)",
                        style: regular.copyWith(color: black),
                        textAlign: TextAlign.left,
                      ),
                    ]),
                  ),

                  Container(
                    height: 500,
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: const BarChartSample(),
                  ),

                  //COBA BUTTON
                  // Container(
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //       ),
                  //       padding: EdgeInsets.symmetric(
                  //           vertical: 10.0, horizontal: 10.0),
                  //       backgroundColor: white,
                  //     ),
                  //     onPressed: () {
                  //       dialogRating(context, 'Rating');
                  //     },
                  //     child: Row(
                  //       children: <Widget>[
                  //         Text("Klik",
                  //             style: xmedium.copyWith(color: ft_orange)),
                  //         SizedBox(width: 10.0),
                  //         Icon(Icons.menu_book_outlined, color: bg_orange),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(height: 30),

                  //--------TEKNIK STABILISASI----------//
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      "Teknik Stabilisasi",
                      style: xmedium.copyWith(color: ft_orange),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: TabBar(
                      controller: tabviewController,
                      labelStyle: xmedium.copyWith(color: white),
                      unselectedLabelStyle: xmedium.copyWith(color: black),
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      isScrollable: true,
                      onTap: (index) {
                        tabIndex = index;
                        setState(() {
                          print("berubah");
                        });
                      },
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: tabIndex == 0
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bg_orange,
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: bg_orange),
                                    color: white,
                                  ),
                            child: Text(
                              "Deep Breathing",
                              style: tabIndex == 0
                                  ? xmedium.copyWith(color: white)
                                  : xmedium.copyWith(
                                      color: black,
                                    ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: tabIndex == 1
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bg_orange,
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: bg_orange),
                                    color: white,
                                  ),
                            child: Text(
                              "Squere Breathing",
                              style: tabIndex == 1
                                  ? xmedium.copyWith(color: white)
                                  : xmedium.copyWith(
                                      color: black,
                                    ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: tabIndex == 2
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bg_orange,
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: bg_orange),
                                    color: white,
                                  ),
                            child: Text(
                              "Butterfly Hugs",
                              style: tabIndex == 2
                                  ? xmedium.copyWith(color: white)
                                  : xmedium.copyWith(
                                      color: black,
                                    ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: tabIndex == 3
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bg_orange,
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: bg_orange),
                                    color: white,
                                  ),
                            child: Text(
                              "Grounding",
                              style: tabIndex == 3
                                  ? xmedium.copyWith(color: white)
                                  : xmedium.copyWith(
                                      color: black,
                                    ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: tabIndex == 4
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bg_orange,
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: bg_orange),
                                    color: white,
                                  ),
                            child: Text(
                              "Self Resources",
                              style: tabIndex == 4
                                  ? xmedium.copyWith(color: white)
                                  : xmedium.copyWith(
                                      color: black,
                                    ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: tabIndex == 5
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bg_orange,
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: bg_orange),
                                    color: white,
                                  ),
                            child: Text(
                              "Progresive Muscle Relaxtation",
                              style: tabIndex == 5
                                  ? xmedium.copyWith(color: white)
                                  : xmedium.copyWith(
                                      color: black,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1100,
                    width: double.maxFinite,
                    child: TabBarView(controller: tabviewController, children: [
                      deepBreathing(),
                      squareBreathing(),
                      butterflyHugs(),
                      grounding(),
                      selfResources(),
                      progresiveMuscle(),
                    ]),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// LIST TEKNIK STABILISASI

  Padding grounding() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: bg_orange, width: 2),
            ),
            child: Column(
              children: [
                Text(
                  "Grounding",
                  style: xmedium.copyWith(
                    color: black,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "• ",
                          style: regular.copyWith(color: ft_orange),
                        ),
                        Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Grounding: ",
                              style: regular.copyWith(
                                color: ft_orange,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "Teknik menstabilkan emosi yang membuat pikiran Anda yang sebelumnya melayang-layang dan tidak fokus kembali ke kesadaran utama “here and now”.",
                              style: regular.copyWith(
                                color: black,
                              ),
                            ),
                          ])),
                        ),
                      ]),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "• ",
                          style: regular.copyWith(color: ft_orange),
                        ),
                        Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text:
                                  "Stabilkan diri Anda (grounding) saat badai emosi dengan cara MERASAKAN PIKIRAN dan PERASAAN Anda, MENENANGKAN DIRI, dan MERASAKAN TUBUH Anda dengan cara perlahan mendorong kaki Anda ke tanah, meregangkan otot, dan bernafas, kemudian BERFOKUS KEMBALI dan MENGHIDUPI DUNIA di sekitar Anda",
                              style: regular.copyWith(
                                color: black,
                              ),
                            ),
                          ])),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 250,
                  decoration: BoxDecoration(
                    color: bg_blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/stabilisasi/grounding.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  // untuk menyesuaikan tinggi ListView dengan kontennya dan menghindari masalah scroll di dalam Column.
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    final ListPoint = [
                      {
                        'nomor': '1',
                        'title': 'Kenali Respon Yang Ada',
                      },
                      {
                        'nomor': '2',
                        'title': 'Ukur Berapa Suds',
                      },
                      {
                        'nomor': '3',
                        'title': ' Duduk Dengan Nyaman Sadari Posisi Kaki',
                      },
                      {
                        'nomor': '4',
                        'title':
                            'Tarik & Hembuskan Nafas Secara Perlahan Dan Dalam',
                      },
                      {
                        'nomor': '5',
                        'title': ' Aktifkan Fungsi Panca Indra',
                      },
                      {
                        'nomor': '6',
                        'title': 'Validasi Perasaan Dan Temukan Insight',
                      },
                    ];

                    return PointMendengar(
                      title: ListPoint[index]['title'] as String,
                      nomor: ListPoint[index]['nomor'] as String,
                      index: index,
                      padding: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding progresiveMuscle() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: bg_orange, width: 2),
            ),
            child: Column(
              children: [
                Text(
                  "Progresive Muscle Relaxtation",
                  style: xmedium.copyWith(
                    color: black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    color: bg_blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/stabilisasi/muscle.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  // untuk menyesuaikan tinggi ListView dengan kontennya dan menghindari masalah scroll di dalam Column.
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final ListPoint = [
                      {
                        'nomor': '1',
                        'title':
                            'Tarik napas, dan tegangkan kelompok otot pertama (keras tapi tidak sampai nyeri atau kram) selama 4 sampai 10 detik.',
                      },
                      {
                        'nomor': '2',
                        'title':
                            'Buang napas, dan secaratiba-tiba mengendurkan kelompok otot (jangan mengendurkannya secara bertahap).',
                      },
                      {
                        'nomor': '3',
                        'title':
                            'Bersantailah selama 10 hingga 20 detik sebelum Anda melatih kelompok otot berikutnya. Perhatikan perbedaan antara apa yang dirasakan otot saat tegang dan apa yang dirasakan saat rileks.',
                      },
                      {
                        'nomor': '4',
                        'title':
                            'Setelah Anda selesaidengan semua kelompok otot, hitung mundur dari 5 hingga 1 untuk mengembalikan fokus Anda ke masa sekarang.',
                      },
                    ];

                    return PointMendengar(
                      title: ListPoint[index]['title'] as String,
                      nomor: ListPoint[index]['nomor'] as String,
                      index: index,
                      padding: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding selfResources() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: bg_orange, width: 2),
            ),
            child: Column(
              children: [
                Text(
                  "Self Resources",
                  style: xmedium.copyWith(
                    color: black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 300,
                  decoration: BoxDecoration(
                    color: bg_blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/stabilisasi/self.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  // untuk menyesuaikan tinggi ListView dengan kontennya dan menghindari masalah scroll di dalam Column.
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final ListPoint = [
                      {
                        'nomor': '1',
                        'title':
                            'Ingatan akan pengalaman hidup yang positif, pengalaman sukses, keberhasilan menangani masalah / tantangan hidup, hal-hal yang disyukuri.',
                      },
                      {
                        'nomor': '2',
                        'title': 'Ikatan hubungan interpersonal yang baik',
                      },
                      {
                        'nomor': '3',
                        'title':
                            'Sumber kekuatan yang imajiner, simbol-simbol atau metaphor.',
                      },
                    ];

                    return PointMendengar(
                      title: ListPoint[index]['title'] as String,
                      nomor: ListPoint[index]['nomor'] as String,
                      index: index,
                      padding: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding butterflyHugs() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: bg_orange, width: 2),
            ),
            child: Column(
              children: [
                Text(
                  "Butterfly Hugs",
                  style: xmedium.copyWith(
                    color: black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  height: 200,
                  decoration: BoxDecoration(
                    color: bg_blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/stabilisasi/butterfly.png',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  // untuk menyesuaikan tinggi ListView dengan kontennya dan menghindari masalah scroll di dalam Column.
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final ListPoint = [
                      {
                        'nomor': '1',
                        'title': 'Silangkan kedua tangan di dada',
                      },
                      {
                        'nomor': '2',
                        'title':
                            'Tepuk kedua tangan seperti mengepakkan sayap pada kupu-kupu.',
                      },
                      {
                        'nomor': '3',
                        'title':
                            'Lakukan gerakan dengan teknik pernafasan (deep breathing)',
                      },
                      {
                        'nomor': '4',
                        'title': 'Lakukan berulang sampai merasa rileks.',
                      },
                    ];

                    return PointMendengar(
                      title: ListPoint[index]['title'] as String,
                      nomor: ListPoint[index]['nomor'] as String,
                      index: index,
                      padding: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding squareBreathing() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: bg_orange, width: 2),
            ),
            child: Column(
              children: [
                Text(
                  "Squere Breathing",
                  style: xmedium.copyWith(
                    color: black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    color: bg_blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/stabilisasi/squere.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  // untuk menyesuaikan tinggi ListView dengan kontennya dan menghindari masalah scroll di dalam Column.
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final ListPoint = [
                      {
                        'nomor': '1',
                        'title':
                            'Bernafaslah seperti biasa. Hitunglah tarikan-hembusan nafas Anda dalam 1 menit, kemudian catat atau ingat-ingat (biasanya klien melaporkan antara 10-25)',
                      },
                      {
                        'nomor': '2',
                        'title':
                            'Sekarang bernafaslah secara perlahan dan dalam, usahakan mencapai 4-8 tarikanhembusan nafas per menit.',
                      },
                      {
                        'nomor': '3',
                        'title':
                            'Bernafaslah dengan menarik nafas dan mengembungkan perut, kemudian tahan dalam 3 hitungan. Setelah itu hembuskan perlahan hingga perut Anda kempes kembali. Kemudian tahan lagi sampai 3 hitungan.',
                      },
                      {
                        'nomor': '4',
                        'title':
                            'Bernafaslah dengan menarik nafas dan mengembungkan perut, kemudian tahan dalam 3 hitungan. Setelah itu hembuskan perlahan hingga perut Anda kempes kembali. Kemudian tahan lagi sampai 3 hitungan.',
                      },
                    ];

                    return PointMendengar(
                      title: ListPoint[index]['title'] as String,
                      nomor: ListPoint[index]['nomor'] as String,
                      index: index,
                      padding: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding deepBreathing() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: bg_orange, width: 2),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "• ",
                          style: regular.copyWith(color: ft_orange),
                        ),
                        Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Counting breath & belly breathing",
                              style: regular.copyWith(
                                color: ft_orange,
                              ),
                            ),
                            TextSpan(
                              text:
                                  " : menghitung jumlah nafas (tarikan-hembusan nafas) dan bernafas dengan menggunakan perut (diafragma) untuk mengukur kondisi emosi (rileks vs tegang/stres) dan menstabilkan melalui nafas dalam.",
                              style: regular.copyWith(
                                color: black,
                              ),
                            ),
                          ])),
                        ),
                      ]),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "• ",
                          style: regular.copyWith(color: ft_orange),
                        ),
                        Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Breathing & orientasion meditation",
                              style: regular.copyWith(
                                color: ft_orange,
                              ),
                            ),
                            TextSpan(
                              text:
                                  " : meditasi pernafasan dan orientasi yang tidak menimbulkan perasaan negatif",
                              style: regular.copyWith(
                                color: black,
                              ),
                            ),
                          ])),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  height: 200,
                  decoration: BoxDecoration(
                    color: bg_blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/stabilisasi/Free_Vector___Man_meditating_concept-removebg-preview 1.png',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  // untuk menyesuaikan tinggi ListView dengan kontennya dan menghindari masalah scroll di dalam Column.
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final ListPoint = [
                      {
                        'nomor': '1',
                        'title':
                            'Bernafaslah seperti biasa. Hitunglah tarikan-hembusan nafas Anda dalam 1 menit, kemudian catat atau ingat-ingat (biasanya klien melaporkan antara 10-25)',
                      },
                      {
                        'nomor': '2',
                        'title':
                            'Sekarang bernafaslah secara perlahan dan dalam, usahakan mencapai 4-8 tarikanhembusan nafas per menit.',
                      },
                      {
                        'nomor': '3',
                        'title':
                            'Bernafaslah dengan menarik nafas dan mengembungkan perut, kemudian tahan dalam 3 hitungan. Setelah itu hembuskan perlahan hingga perut Anda kempes kembali. Kemudian tahan lagi sampai 3 hitungan.',
                      },
                      {
                        'nomor': '4',
                        'title':
                            'Bernafaslah dengan menarik nafas dan mengembungkan perut, kemudian tahan dalam 3 hitungan. Setelah itu hembuskan perlahan hingga perut Anda kempes kembali. Kemudian tahan lagi sampai 3 hitungan.',
                      },
                    ];

                    return PointMendengar(
                      title: ListPoint[index]['title'] as String,
                      nomor: ListPoint[index]['nomor'] as String,
                      index: index,
                      padding: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
