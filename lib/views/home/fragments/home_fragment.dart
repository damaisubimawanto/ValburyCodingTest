import 'package:flutter/material.dart';
import 'package:valbury_coding_test/models/home_model.dart';
import 'package:valbury_coding_test/view_models/home_view_model.dart';
import 'package:valbury_coding_test/views/home/fragments/home_content_hospital.dart';
import '../../../utils/home_types.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({
    super.key,
    required this.homeViewModel
  });

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    debugPrint("HomeFragment => build() => home list model length = ${homeViewModel.homeListModel.length}");
    return Scrollbar(
      child: ListView.builder(
        itemCount: homeViewModel.homeListModel.length,
        itemBuilder: (BuildContext context, int position) {
          HomeModel homeModel = homeViewModel.homeListModel[position];
          debugPrint("HomeFragment => build() => ListView.builder() => home types = ${homeModel.homeTypes}, is hospital section invalid = ${homeModel.isHospitalSectionInvalid()}");

          switch (homeModel.homeTypes) {
            case HomeTypes.clinic: /* Clinic will be the sama as hospital. */
            case HomeTypes.hospital:
              if (homeModel.isHospitalSectionInvalid()) {
                return const SizedBox();
              } else {
                return HomeContentHospital(
                  model: homeModel.hospitalSectionModel!
                );
              }
            case HomeTypes.banner:
              if (homeModel.isBannerSectionInvalid()) {
                return const SizedBox();
              } else {
                // TODO: Make item list for banner type
                return const SizedBox();
              }
            default:
              return const SizedBox();
          }
        }
      ),
    );
  }
}