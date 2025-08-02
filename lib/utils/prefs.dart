import 'package:mixnmatch/constant/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefs = Prefs();

class Prefs {
  static SharedPreferences? _prefs;

  Future init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  //! -------------- Sign In ----------------------
  String get userId => _prefs?.getString(keyId) ?? "";
  set userId(String value) {
    _prefs?.setString(keyId, value);
  }

  String get fullName => _prefs?.getString(keyFullName) ?? "";
  set fullName(String value) {
    _prefs?.setString(keyFullName, value);
  }

  String get email => _prefs?.getString(keyEmail) ?? "";
  set email(String value) {
    _prefs?.setString(keyEmail, value);
  }

  String get phone => _prefs?.getString(keyPhone) ?? "";
  set phone(String value) {
    _prefs?.setString(keyPhone, value);
  }

  String get avatar => _prefs?.getString(keyAvatar) ?? "";
  set avatar(String value) {
    _prefs?.setString(keyAvatar, value);
  }

  String get type => _prefs?.getString(keyType) ?? "";
  set type(String value) {
    _prefs?.setString(keyType, value);
  }

  String get expires => _prefs?.getString(keyExpires) ?? "";
  set expires(String value) {
    _prefs?.setString(keyExpires, value);
  }

  String get accessToken => _prefs?.getString(keyAccessToken) ?? "";
  set accessToken(String value) {
    _prefs?.setString(keyAccessToken, value);
  }

  String get message => _prefs?.getString(keyMessage) ?? "";
  set message(String value) {
    _prefs?.setString(keyMessage, value);
  }

  //! -------------- OTP ----------------------
  String get otpCode => _prefs?.getString(keyOtpCode) ?? "";
  set otpCode(String value) {
    _prefs?.setString(keyOtpCode, value);
  }

  String get otpToken => _prefs?.getString(keyOtpToken) ?? "";
  set otpToken(String value) {
    _prefs?.setString(keyOtpToken, value);
  }

  String get otpPhone => _prefs?.getString(keyOtpPhone) ?? "";
  set otpPhone(String value) {
    _prefs?.setString(keyOtpPhone, value);
  }

  String get otpRef => _prefs?.getString(keyOtpRef) ?? "";
  set otpRef(String value) {
    _prefs?.setString(keyOtpRef, value);
  }

  //! ---------------- langId ------------------------
  String get accessLangId => _prefs?.getString(keyLangId) ?? "1";
  set accessLangId(String value) {
    _prefs?.setString(keyLangId, value);
  }

  String get accessbranchId => _prefs?.getString(keybranchId) ?? "1";
  set accessbranchId(String value) {
    _prefs?.setString(keybranchId, value);
  }

  // String get mypoint => _prefs?.getString(keymypoint) ?? "0";
  // set mypoint(String value) {
  //   _prefs?.setString(keymypoint, value);
  // }

  Future<dynamic> clear() async {
    await _prefs?.clear();
  }
}
