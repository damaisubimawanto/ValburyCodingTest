class AppString {
  static AppString instance = AppString._init();

  AppString._init();

  final String appName = "Valbury";

  final String hintEmail = "Enter your email";
  final String hintPhoneNumber = "Enter your phone number";

  final String textEmail = "Email";
  final String textPhoneNumber = "Phone Number";
  final String textLogin = "Login";
  final String textRegister = "Register";
  final String textSubmit = "Submit";
  final String textShowAll = "Lihat Semua";
  final String textShowDetail = "Lihat Detail";

  final String bottomMenuHome = "HOME";
  final String bottomMenuHospital = "RS";
  final String bottomMenuClinic = "KLINIK";
  final String bottomMenuProfile = "PROFILE";

  final String errorCannotBeEmpty = "Cannot be empty!";
  final String errorNoPageDefined = "No page defined!";
}