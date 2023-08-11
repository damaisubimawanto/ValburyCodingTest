import 'package:flutter/material.dart';
import 'package:valbury_coding_test/models/banner_section_model.dart';
import 'package:valbury_coding_test/utils/extensions/string_extensions.dart';

class HomeContentBanner extends StatelessWidget {
  const HomeContentBanner({
    super.key,
    required this.model
  });

  final BannerSectionModel model;

  @override
  Widget build(BuildContext context) {
    int? bannerCount = model.bannerList?.length;

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bannerCount,
        itemBuilder: (BuildContext context, int position) {
          BannerModel bannerModel = model.bannerList![position];

          return Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(12.0),
              onTap: () {
                // TODO: Open promo page
              },
              child: Expanded(
                child: Image.network(
                  bannerModel.thumbnail.orEmpty(),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}