import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';

class IconManager {
  static const arrowBackIcon = Icon(
    Icons.arrow_back_ios_new,
    size: 16,
    color: ColorsHelper.black,
  );
  static const arrowForwardIcon = Icon(
    Icons.arrow_forward_ios,
    size: 16,
    color: ColorsHelper.black,
  );
  static const homeIcon =  Icon(Icons.home_outlined);
  static const profileIcon = Icon(Icons.person_2_outlined);
  static const favoriteIcon =Icon(Icons.favorite_outline_sharp);
  static const settingIcon = Icon(Icons.settings_applications_outlined);
  static const searchIcon = Icon(Icons.search_outlined);
  static const notificationIcon =  Icon(Icons.notifications, size: 20,);
}
