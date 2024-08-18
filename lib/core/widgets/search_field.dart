import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../helper/dimension_manager.dart';

Widget searchIcon(BuildContext context) {
  return Container(

      width: DimensionsHelper.widthPercentage(context, 85),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: SearchBarAnimation(
        textEditingController: TextEditingController(),
        isOriginalAnimation: true,
        enableKeyboardFocus: true,
        onExpansionComplete: () {
          debugPrint('do something just after searchbox is opened.');
          debugPrint('111111 open');
        },
        onCollapseComplete: () {
          debugPrint('do something just after searchbox is closed.');
          debugPrint('asd close .');
        },
        onPressButton: (isSearchBarOpens) {
          debugPrint(
              'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
        },
        trailingWidget: const Icon(
          Icons.search,
          size: 20,
          color: Colors.black,
        ),
        secondaryButtonWidget: const Icon(
          Icons.close,
          size: 20,
          color: Colors.black,
        ),
        buttonWidget: const Icon(
          Icons.search,
          size: 20,
          color: Colors.black,
        ),
      ));
}
