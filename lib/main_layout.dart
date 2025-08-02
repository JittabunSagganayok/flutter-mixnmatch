import 'package:get/get.dart';
import 'package:mixnmatch/controllers/tinder_controller.dart';
import 'package:mixnmatch/screens/appointment_page.dart';
import 'package:mixnmatch/screens/booking_page.dart';
import 'package:mixnmatch/screens/fav_page.dart';
import 'package:mixnmatch/screens/sendmessage_page.dart';
import 'package:mixnmatch/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mixnmatch/screens/tinder_page.dart';
import 'package:mixnmatch/utils/config.dart';

class MainLayout extends StatefulWidget {
  final int initialPage; // Added for custom navigation

  MainLayout({Key? key, required this.initialPage}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final TinderController tinderController = Get.put(TinderController());
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    tinderController.fetchUserList();
    currentPage = widget.initialPage; // Set initial page from constructor
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Prevent pop if selection is required
        return false;
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (value) => setState(() => currentPage = value),
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            FavPage(
              goToPage: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
            BookingPage(),
            // const AppointmentPage(),
            TinderPage(),
            SendMessage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Config.primaryColor,
          currentIndex: currentPage,
          onTap: (page) => setState(() {
            // tinderController.fetchUserList();
            currentPage = page;
            _pageController.animateToPage(
              page,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.houseChimney),
              label: 'หน้าหลัก',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
              label: 'การจอง',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidHeart),
              label: 'หาคู่',
            ),
            // BottomNavigationBarItem(
            //   icon: FaIcon(FontAwesomeIcons.coins),
            //   //handPointDown
            //   label: 'แลกแต้ม',
            // ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.microblog),
              //microblog
              //handPointDown
              label: 'ส่งขึ้นจอ',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidUser),
              label: 'บุคคล',
            ),
          ],
        ),
      ),
    );
  }
}
