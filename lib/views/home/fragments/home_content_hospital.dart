import 'package:flutter/material.dart';
import 'package:valbury_coding_test/models/hospital_section_model.dart';
import 'package:valbury_coding_test/utils/extensions/integer_extensions.dart';
import 'package:valbury_coding_test/utils/extensions/string_extensions.dart';
import '../../../models/filter_model.dart';

class HomeContentHospital extends StatelessWidget {
  const HomeContentHospital({
    super.key,
    required this.model
  });

  final HospitalSectionModel model;

  @override
  Widget build(BuildContext context) {
    debugPrint("HomeContentHospital => build() => title = ${model.title}");
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
          scrollDirection: Axis.horizontal,
          itemCount: model.filterList?.length.orZero(),
          itemBuilder: (BuildContext context, int position) {
            FilterModel filterModel = model.filterList![position];
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Text(filterModel.name.orEmpty()),
            );
          },
        ),
        ListView.builder(
          itemCount: model.hospitalList?.length.orZero(),
          itemBuilder: (BuildContext context, int position) {
            HospitalModel hospitalModel = model.hospitalList![position];
            return Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.network(hospitalModel.thumbnail.orEmpty()),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    Text(hospitalModel.name.orEmpty()),
                    Text(hospitalModel.address.orEmpty()),
                  ],
                ),
                const Text('Lihat Detail')
              ],
            );
          }
        )
      ],
    );
  }

}