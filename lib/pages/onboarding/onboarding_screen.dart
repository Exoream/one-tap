import 'package:ecommerce/routes/routes_named.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> _titles = [
    "Selamat Datang di OneTap!",
    "Temukan Produk Terbaik",
    "Beli Dengan Mudah"
  ];
  final List<String> _descriptions = [
    "Belanja online menjadi lebih mudah dan menyenangkan dengan OneTap.",
    "Dapatkan akses ke berbagai produk terbaik dari berbagai kategori.",
    "Temukan produk yang Anda inginkan dan lakukan pembelian dengan mudah."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _titles.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return _buildPage(index);
              },
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
          const SizedBox(height: 20.0),
          _currentPage != _titles.length - 1
              ? SizedBox(
                  width: 100.0,
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 80.0,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offNamed(RoutesNamed.login);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.0),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30.0),
          ColorFiltered(
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            child: Image.asset(
              'assets/img/icon.png',
              height: 150.0,
              width: 150.0,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            _titles[index],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15.0),
          Text(
            _descriptions[index],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _titles.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      height: 8.0,
      width: 24.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
