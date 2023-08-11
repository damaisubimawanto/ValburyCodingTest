import 'package:flutter/material.dart';
import 'package:valbury_coding_test/models/hospital_section_model.dart';
import 'package:valbury_coding_test/utils/extensions/string_extensions.dart';

class HomeContentHospital extends StatelessWidget {
  const HomeContentHospital({
    super.key,
    required this.model
  });

  final HospitalSectionModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Text(model.title.orEmpty())
            ),
            const Text('Lihat Semua')
          ],
        ),
        ListView.builder(
          itemCount: model.filterList?.length ?? 0,
          itemBuilder: (BuildContext context, int position) {
            // TODO: Custom view for filter item list
          }
        ),
        ListView.builder(
          itemCount: model.hospitalList?.length ?? 0,
          itemBuilder: (BuildContext context, int position) {
            // TODO: Custom view for hospital item list
          }
        )
      ],
    );
  }

}