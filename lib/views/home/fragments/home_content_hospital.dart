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
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(model.title.orEmpty())
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Text('Lihat Semua')
            )
          ],
        ),
        SizedBox(
          height: 20,
          child: ListView.builder(
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
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: model.hospitalList?.length.orZero(),
              itemBuilder: (BuildContext context, int position) {
                HospitalModel hospitalModel = model.hospitalList![position];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 64,
                        height: 64,
                        child: Image.network(
                          hospitalModel.thumbnail.orEmpty(),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hospitalModel.name.orEmpty(),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 4),
                            Text(hospitalModel.address.orEmpty()),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text('Lihat Detail')
                    ],
                  ),
                );
              }
          ),
        ),
      ],
    );
  }

}