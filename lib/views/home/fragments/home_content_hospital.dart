import 'package:flutter/material.dart';
import 'package:valbury_coding_test/models/hospital_section_model.dart';
import 'package:valbury_coding_test/res/values/strings.dart';
import 'package:valbury_coding_test/utils/extensions/integer_extensions.dart';
import 'package:valbury_coding_test/utils/extensions/string_extensions.dart';
import '../../../models/filter_model.dart';

class HomeContentHospital extends StatelessWidget {
  const HomeContentHospital({
    super.key,
    required this.sectionId,
    required this.selectedFilterId,
    required this.model,
    required this.filterClicked
  });

  final int sectionId;
  final int selectedFilterId;
  final HospitalSectionModel model;
  final Function(int filterId, int sectionId) filterClicked;

  @override
  Widget build(BuildContext context) {
    int? filterCount = model.filterList?.length;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                child: Text(
                  model.title.orEmpty(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                  ),
                )
              )
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
              child: TextButton(
                onPressed: () {
                  // TODO: Open RS or KLINIK bottom navigation menu
                },
                child: Text(AppString.instance.textShowAll)
              )
            )
          ],
        ),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filterCount,
            itemBuilder: (BuildContext context, int position) {
              FilterModel filterModel = model.filterList![position];
              var chipColor = Colors.white;
              var textColor = Colors.white;
              if (filterModel.id == selectedFilterId) {
                chipColor = Colors.lightBlue[200]!;
                textColor = Colors.white;
              } else {
                textColor = Colors.blue;
              }

              return Row(
                children: [
                  SizedBox(width: position == 0 ? 10.0 : 5.0),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))
                      ),
                      backgroundColor: chipColor
                    ),
                    onPressed: () {
                      if (filterModel.id != null) {
                        filterClicked(filterModel.id!, sectionId);
                      }
                    },
                    child: Text(
                      filterModel.name.orEmpty(),
                      style: TextStyle(
                        color: textColor
                      ),
                    )
                  ),
                  SizedBox(
                    width: position == (filterCount.orZero() - 1) ? 10.0 : 5.0
                  )
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: model.hospitalList?.length.orZero(),
            itemBuilder: (BuildContext context, int position) {
              HospitalModel hospitalModel = model.hospitalList![position];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 64.0,
                      height: 64.0,
                      child: Image.network(
                        hospitalModel.thumbnail.orEmpty(),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hospitalModel.name.orEmpty(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            hospitalModel.address.orEmpty(),
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero
                      ),
                      onPressed: () {
                        // TODO: Open hospital detail page
                      },
                      child: Text(AppString.instance.textShowDetail)
                    )
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