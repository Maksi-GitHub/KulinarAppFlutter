import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          snap: false,
          floating: false,
          pinned: true,
          automaticallyImplyLeading: false,
          expandedHeight: 500,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int index) {
                    setState(() {});
                  },
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/test_image.jpg',
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 100, left: 20),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Подборка',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          'assets/test_image.jpg',
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 100, left: 20),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Подборка',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          'assets/test_image.jpg',
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 100, left: 20),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Подборка',
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, right: 15),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.ac_unit_outlined,
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(80),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                          activeDotColor: Colors.white,
                          dotColor: Colors.white.withOpacity(0.5),
                          dotHeight: 8,
                          dotWidth: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    child: SearchBar(
                      elevation: MaterialStateProperty.all(1),
                      trailing: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ))),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Что вы хотите приготовить?',
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/test_image.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 5, top: 70),
                        child: Text(
                          'Завтрак',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ))
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/test_image.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 5, top: 70),
                        child: Text(
                          'Обед',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ))
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/test_image.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 5, top: 70),
                        child: Text(
                          'Ужин',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/test_image.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 5, top: 70),
                        child: Text(
                          'Завтрак',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ))
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/test_image.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 5, top: 70),
                        child: Text(
                          'Обед',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ))
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/test_image.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 5, top: 70),
                        child: Text(
                          'Ужин',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Добавить рецепт',
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/test_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Сервисы',
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 80,
             child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                    width: 130,
                  ),
                  const SizedBox(
              width: 10,
            ),
            Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                    width: 130,
                  ),
                  const SizedBox(
              width: 10,
            ),
           Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                    width: 130,
                  ),
                  const SizedBox(
              width: 10,
            ),
            Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                    width: 130,
                  ),
              ],
             )
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]))
      ],
    ));
  }
}
