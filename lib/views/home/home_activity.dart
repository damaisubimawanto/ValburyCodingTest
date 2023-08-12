import 'package:flutter/material.dart';
import 'package:valbury_coding_test/res/values/strings.dart';
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

  _loadFirstDummyData() async {
    await homeViewModel.fetchHomeDummyList();
  }
  
  _loadDummyDataByFilter(int filterId, int sectionId) async {
    switch (sectionId) {
      case 100:
        await homeViewModel.fetchHospitalFilterById(filterId);
        break;
      case 103:
        await homeViewModel.fetchClinicFilterById(filterId);
        break;
      default:
        debugPrint("No section found!");
    }
  }

  _toggleHospitalChipFilter(int filterId) async {
    await homeViewModel.toggleHospitalChipFilter(filterId);
  }

  @override
  Widget build(BuildContext context) {
    _loadFirstDummyData();
    Widget fragment;
    switch (_selectedIndex) {
      case 0:
        fragment = HomeFragment(
          homeViewModel: homeViewModel,
          filterClicked: (filterId, sectionId) {
            setState(() {
              _loadDummyDataByFilter(filterId, sectionId);
              _toggleHospitalChipFilter(filterId);
            });
          },
        );
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
        fragment = Center(child: Text(AppString.instance.errorNoPageDefined));
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 115.0,
        title: const CustomAppBarHome(),
        titleSpacing: 0.0,
      ),
      body: fragment,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppString.instance.bottomMenuHome
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.local_hospital_rounded),
            label: AppString.instance.bottomMenuHospital
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.medical_information_rounded),
            label: AppString.instance.bottomMenuClinic
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle_rounded),
            label: AppString.instance.bottomMenuProfile
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500
        ),
        unselectedItemColor: Colors.black54,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal
        ),
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