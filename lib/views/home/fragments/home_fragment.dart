import 'package:flutter/material.dart';
import 'package:valbury_coding_test/models/home_model.dart';
import 'package:valbury_coding_test/view_models/home_view_model.dart';
import 'package:valbury_coding_test/views/home/fragments/home_content_banner.dart';
import 'package:valbury_coding_test/views/home/fragments/home_content_hospital.dart';
import '../../../utils/home_types.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({
    super.key,
    required this.homeViewModel,
    required this.filterClicked
  });

  final HomeViewModel homeViewModel;
  final Function(int filterId, int sectionId) filterClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: homeViewModel.homeListModel.length,
        itemBuilder: (BuildContext context, int position) {
          HomeModel homeModel = homeViewModel.homeListModel[position];

          switch (homeModel.homeTypes) {
            case HomeTypes.clinic:
              if (homeModel.isHospitalSectionInvalid()) {
                return const SizedBox();
              } else {
                return HomeContentHospital(
                  sectionId: homeModel.hospitalSectionModel!.id!,
                  selectedFilterId: homeViewModel.selectedClinicFilterId,
                  model: homeModel.hospitalSectionModel!,
                  filterClicked: filterClicked,
                );
              }

            case HomeTypes.hospital:
              if (homeModel.isHospitalSectionInvalid()) {
                return const SizedBox();
              } else {
                return HomeContentHospital(
                  sectionId: homeModel.hospitalSectionModel!.id!,
                  selectedFilterId: homeViewModel.selectedHospitalFilterId,
                  model: homeModel.hospitalSectionModel!,
                  filterClicked: filterClicked,
                );
              }

            case HomeTypes.banner:
              if (homeModel.isBannerSectionInvalid()) {
                return const SizedBox();
              } else {
                return HomeContentBanner(
                  model: homeModel.bannerSectionModel!,
                );
              }

            default:
              return const SizedBox();
          }
        }
      ),
    );
  }
}