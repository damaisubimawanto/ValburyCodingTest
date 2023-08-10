import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valbury_coding_test/view_models/home_view_model.dart';
import '../../../utils/home_types.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    var homeViewModel = context.watch<HomeViewModel>();

    return ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        switch (homeViewModel.homeListModel?.homeTypes) {
          case HomeTypes.hospital:
            // TODO: Make item list for hospital type
            return const Center(child: Text('No route defined'));
          case HomeTypes.clinic:
          // TODO: Make item list for clinic type
            return const Center(child: Text('No route defined'));
          case HomeTypes.banner:
          // TODO: Make item list for banner type
            return const Center(child: Text('No route defined'));
          default:
            return const SizedBox();
        }
      }
    );
  }
}