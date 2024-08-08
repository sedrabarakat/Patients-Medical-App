// const baseServ = "http://127.0.0.1:8001/";
const baseServ = "http://192.168.1.10:8000/";
const baseUrl = "${baseServ}api/";
const auth = "auth/";
const AppID_Agora = "53215bfd2c054ddc97c008da762ae819";
const AppKey_Back = '5eff8149aa24be769afc';

class AppUrl {
  /*>>>>>>>>>>>>>>>>>>>> Auth <<<<<<<<<<<<<<<<<<<<*/
  static const requestCode = '$baseUrl${auth}request-code';
  static const verifyCode = '$baseUrl${auth}verify-code';
  static const register = '${baseUrl}register/patient/';
}
