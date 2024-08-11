// const baseServ = "http://127.0.0.1:8001/";
const baseServ = "http://192.168.1.4:8000/";
const baseUrl = "${baseServ}api/";
const auth = "auth/";
const AppID_Agora = "53215bfd2c054ddc97c008da762ae819";
const AppKey_Back = '5eff8149aa24be769afc';

class AppUrl {
  /*>>>>>>>>>>>>>>>>>>>> Auth <<<<<<<<<<<<<<<<<<<<*/
  static const requestCode = '$baseUrl${auth}request-code';
  static const verifyCode = '$baseUrl${auth}verify-code';
  static const register = '${baseUrl}register/patient/';
 /*>>>>>>>>>>>>>>>>>>>> Online Consultation <<<<<<<<<<<<<<<<<<<<*/
  static const getOnlineSchedule = '${baseUrl}online_guidance_schedule';
  static const registerSchedule = '${baseUrl}online_guidance_registeration/store';
  static const DeleteSchedule = '${baseUrl}online_guidance_registeration/';//{registeration}

  static const declineCallEvent = '${baseUrl}online_guidance_registeration/declineCallEvent/';//{channel_name}
  static const acceptCallEvent = '${baseUrl}online_guidance_registeration/acceptCallEvent/';//{channel_name}


}
