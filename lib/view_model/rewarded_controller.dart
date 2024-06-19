import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_ads_mob_integration/view_model/spinning_controller.dart';

import '../resources/asset_constants.dart';
import '../resources/color_constants.dart';
import '../show_popup.dart';


class RewardedController extends GetxController{
  final spinnerController = Get.find<SpinningController>();
  final colorList = [ColorConstants.rewardColor1 , ColorConstants.rewardColor2 , ColorConstants.rewardColor3];
  final imageUrlList = [AssetConstants.icReward2 , AssetConstants.icReward1 , AssetConstants.icReward2];

  Future<bool> onWillPopScope(BuildContext context) async{

      Navigator.pop(context) ;

      if(spinnerController.seconds.value>0) {
        spinnerController.snackBarController =   ShowMaterialPopup.showTimerSnackBar();

      }
      else{
        spinnerController.snackBarController!.close() ;
      }
      return true ;

}
}