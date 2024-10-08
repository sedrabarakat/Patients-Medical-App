// const baseServ = "http://127.0.0.1:8001/";
const baseServ = "http://192.168.1.4:8000/";
const baseUrl = "${baseServ}api/";
const auth = "auth/";
const dashboard = 'dashboard/';
const AppID_Agora = "53215bfd2c054ddc97c008da762ae819";
const AppKey_Back = '5eff8149aa24be769afc';

class AppUrl {
  /*>>>>>>>>>>>>>>>>>>>> Auth <<<<<<<<<<<<<<<<<<<<*/
  static const requestCode = '$baseUrl${auth}patient/request-code';
  static const verifyCode = '$baseUrl${auth}patient/verify-code';
  static const register = '${baseUrl}register/patient/';
  static const getMyInformation = "${baseUrl}patient/me";

  /*>>>>>>>>>>>>>>>>>>>> Online Consultation <<<<<<<<<<<<<<<<<<<<*/
  static const getOnlineSchedule = '${baseUrl}online_guidance_schedule';
  static const registerSchedule =
      '${baseUrl}online_guidance_registration/store';
  static const DeleteSchedule =
      '${baseUrl}online_guidance_registeration/'; //{registeration}

  static const declineCallEvent =
      '${baseUrl}online_guidance_registeration/declineCallEvent/'; //{channel_name}
  static const acceptCallEvent =
      '${baseUrl}online_guidance_registeration/acceptCallEvent/'; //{channel_name}
  static const getPatientInfo = '${baseUrl}patient/me';

  /*>>>>>>>>>>>>>>>>>>>> Patient Profile <<<<<<<<<<<<<<<<<<<<*/
  static const getPatientSession = "${baseUrl}dashboard/session/sessions/";
  static const getServices = '${baseUrl}dashboard/service';
  static const getSession = "${baseUrl}dashboard/session/";
  static const getSessionDetailsInformation =
      "${baseUrl}dashboard/session/details/";
  static const getDoctorInformation = "${baseUrl}dashboard/doctor/";
  static const downloadFile = "${baseServ}storage/";

  /*>>>>>>>>>>>>>>>>>>>> Appointments <<<<<<<<<<<<<<<<<<<<*/
  static const getDoctors = '${baseUrl}dashboard/doctor';
  static const getDoctorAppointment =
      '${baseUrl}dashboard/appointment/getAvailableTime/';

  static const getPatientInfo ='${baseUrl}patient/me';


  static const makeAppointment = "${baseUrl}dashboard/appointment/store";

  /*>>>>>>>>>>>>>>>>>>>> Posts <<<<<<<<<<<<<<<<<<<<*/
  static const getAllPosts = "${baseUrl}post";
  static const createPost = "${baseUrl}post/store";
  static const likePost = "${baseUrl}post/togglePost/";
  static const getCommentForPost = "${baseUrl}comments/on/post/";
  static const addComment = "${baseUrl}comments/on/post/store/";

  /*>>>>>>>>>>>>>>>>>>>> Favs <<<<<<<<<<<<<<<<<<<<*/
  static const toggleFav = "${baseUrl}favorite/";
  static const getFav = '${baseUrl}favorite/mine';
  /*>>>>>>>>>>>>>>>>>>>> Settings <<<<<<<<<<<<<<<<<<<<*/
  static const getMyAppointment = "${baseUrl}patient/appointments";
  static const deleteAppointment = '${baseUrl}patient/destroy/';
  static const sendComplaint = "${baseUrl}complaints/store";
  static const logOut = "${baseUrl}auth/logout";
  static const getFav = '${baseUrl}favorite/mine';

/*>>>>>>>>>>>>>>>>>>>> Doctors <<<<<<<<<<<<<<<<<<<<*/
  static const getDoctorsList = '$baseUrl${dashboard}doctor';

  static const getSections = "$baseUrl${dashboard}section";
  static const getSliders = "$baseUrl${dashboard}slider";
  static const getSectionInformation = "$baseUrl${dashboard}section/";

}
