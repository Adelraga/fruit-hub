import 'package:shared_preferences/shared_preferences.dart';

 class  ThemeColor{
  static const  THEME = "THEME";
  static setDarkTheme(bool value) async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    await prefs.setBool(THEME,value);
  }

   Future <bool> getTheme() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return  prefs.getBool(THEME) ?? false;
  }
}