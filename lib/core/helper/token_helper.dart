

import '../data/data_source/local.dart';

class TokenHelper{
  static bool hasToken = false;
  static Future<void> init() async {
    String? token =  HiveService.Auth_Box!.get('Token');
    hasToken = token != null;
  }
}