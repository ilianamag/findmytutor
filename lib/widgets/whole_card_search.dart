import 'package:flutter/material.dart';
import 'package:login/core/utils/image_constant.dart';
import 'package:login/widgets/horizontal_card_for_search.dart';
import 'package:login/widgets/price_card_container.dart';
import 'package:login/widgets/stacked_card_search.dart';



Widget WholeCardSearch(BuildContext context) {
  return Column(
    children: [
      //παραδειγμα για να δω οτι δουλευει
      HorizontalCardSearch(
        photoUrl: 'https://mackenziebagpiping.com/wp-content/uploads/2022/12/1.png',
        name: 'Iliana', 
        additionalPhotoAsset: ImageConstant.imgbagpipe,
      ),
      PriceContainer(price: '20'),
      StackedCardSearch(
        additionalInfoPlaceholder: 'Γεια σας είμαι η Ηλιανα και παιζω γκάιντα',
      ),
    ],
  );
}