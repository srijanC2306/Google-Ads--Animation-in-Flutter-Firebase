
import 'dart:io';



class AdHelper{
  //testing add id
  static const  adUnit = "ca-app-pub-9485004676154693/7708804673";

  static String  get rewardedAdsUnit{
    if(Platform.isAndroid){
      return adUnit ;
  }
    else {
      throw  UnsupportedError("Unsupported platform") ;
    }
  }
}
