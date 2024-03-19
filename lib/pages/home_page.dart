import 'package:flutter/cupertino.dart';
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
  PageController _pageController = PageController();
  int _currentPageIndex = 0;

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
          automaticallyImplyLeading: false,
          expandedHeight: 500,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
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
              preferredSize: const Size.fromHeight(0),
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: SearchBar(
                      elevation: MaterialStateProperty.all(1),
                      trailing: [
                        IconButton(icon: Icon(Icons.search), onPressed: () {  },)
                      ],
                    ),
                  ))),
        ),
      ],
    ));
  }
}
