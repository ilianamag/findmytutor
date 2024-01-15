// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:login/core/utils/image_constant.dart';
import 'package:login/widgets/horizontal_card_for_search.dart';
import 'package:login/widgets/price_card_container.dart';
import 'package:login/widgets/stacked_card_search.dart';

// //χωρις παραδειγμα για την βαση
// Widget WholeCardSearch(BuildContext context) {
//   return Column(
//     children: [
//       HorizontalCardSearch(
//         photoUrl,name, additionalPhotoAsset
//       ),
//       PriceContainer(price: ),
//       StackedCardSearch(
//         additionalInfoPlaceholder
//       ),
//     ],
//   );
// }

Widget WholeCardSearch(BuildContext context, {
  required String tutorName,
  required double tutorPrice,
  required double tutorRating,
}) {
  return Column(
    children: [
      HorizontalCardSearch(
        photoUrl: 'https://mackenziebagpiping.com/wp-content/uploads/2022/12/1.png',
        name: tutorName, 
        additionalPhotoAsset: ImageConstant.imgbagpipe,
      ),
      PriceContainer(price: tutorPrice.toString()),
      StackedCardSearch(
        additionalInfoPlaceholder: 'Rating: $tutorRating',
      ),
    ],
  );
}
