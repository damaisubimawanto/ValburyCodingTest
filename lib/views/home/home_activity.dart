import 'package:flutter/material.dart';
import 'package:valbury_coding_test/views/home/fragments/home_fragment.dart';
import '../../view_models/home_view_model.dart';
import '../custom_views/custom_appbar_home.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int _selectedIndex = 0;
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.fetchHomeDummyList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget fragment;
    switch (_selectedIndex) {
      case 0:
        fragment = HomeFragment(homeViewModel: homeViewModel);
        break;
      case 1:
        fragment = const Center(child: Text('RS - Under Development!'));
        break;
      case 2:
        fragment = const Center(child: Text('Klinik - Under Development!'));
        break;
      case 3:
        fragment = const Center(child: Text('Profile - Under Development!'));
        break;
      default:
        fragment = const Center(child: Text('No page defined!'));
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 115,
        title: const CustomAppBarHome(),
        titleSpacing: 0.0,
      ),
      body: fragment,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_rounded),
            label: 'RS'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information_rounded),
            label: 'Klinik'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile'
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}