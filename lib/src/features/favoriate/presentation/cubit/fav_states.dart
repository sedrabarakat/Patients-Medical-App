import '../../../../../core/domain/error_handler/network_exceptions.dart';

abstract class FavStates{}

class Init_FavStates extends FavStates{}

class Loading_getFav_State extends FavStates{}
class Success_getFav_State extends FavStates{}
class Error_getFav_State extends FavStates{}

class Loading_ToggleFav_State extends FavStates{}
class Success_ToggleFav_State extends FavStates{}
class Error_ToggleFav_State extends FavStates{}