import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/asset_constants.dart';
import '../../resources/color_constants.dart';
import '../../resources/material_button.dart';
import '../../view_model/spinning_controller.dart';
import '../widget/control_button.dart';
import '../widget/loader.dart';

class SpinnerScreen extends StatelessWidget {
  SpinnerScreen({Key? key}) : super(key: key);

  final spinningController = Get.put(SpinningController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
       return  false ;
      },
      child: Scaffold(
        body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetConstants.bg), fit: BoxFit.cover)),
            child: gameContent(context)),
      ),
    );
  }

  Widget gameContent(BuildContext context) => Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                   Align(
                     alignment: Alignment.topLeft,
                     child: Container(
                       decoration: BoxDecoration(
                         color: Colors.black.withOpacity(0.2)
                       ),
                       child:
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Expanded(
                               child: ControlButtons(spinningController.player )),
                           MaterialButtons( fontSize: 14 , text: "Rewards", onTap: (){

                             spinningController.onTapRewardBtn() ;


                             },)

                         ],
                       ),
                     ),
                   ),
            SizedBox(height: Get.height * .05),
            Obx(
              () => Stack(alignment: Alignment.center, children: [
                gameBelt(),
                gameWheel(),
                InkWell(
                  onTap:()=> spinningController.onTapSpinButton(context),
                  child: SizedBox(
                      width: Get.width * .18,
                      child: Image.asset(AssetConstants.icSpin)),
                ),
                spinningController.isAdShown.value || spinningController.onTapReward.value? const Loader() : const Offstage(),

              ]),
            ),

            spinningController.isAdsSeen.value ?const SizedBox.shrink():const SizedBox(
              height:20,
            ),
            goldenBox,
            //   walletManagement(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );

  Widget gameBelt() =>
      SizedBox(width: Get.width, child:const Image(
        image: AssetImage( AssetConstants.icBelt),
      ),);

  Widget gameWheel() => Padding(
        padding: const EdgeInsets.only(top: 35.0, ),
        child: AnimatedBuilder(
          animation: spinningController.animation,
          builder: (context, child) {
            return Transform.rotate(
                angle: spinningController.animationController.value *
                    spinningController.angle,
                child: SizedBox(
                  width: Get.width * .768,
                  child:const  Image(
                    image: AssetImage(AssetConstants.icWheel),
                  ),
                ));
          },
        ),
      );

  Widget walletManagement() => Container(
        width: Get.width * .90,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [ColorConstants.bgWallet, Colors.black]),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.yellowAccent, spreadRadius: 4, blurRadius: 3)
            ]),
        child: GetBuilder<SpinningController>(builder: (controller) {
          return Table(
            border: TableBorder.all(
                color: ColorConstants.bgWallet,
                borderRadius: BorderRadius.circular(10)),
            children: [
              TableRow(children: [
                _titleColumn("Earned"),
                _titleColumn("Earning"),
                _titleColumn("Spins"),
              ]),
              TableRow(children: [
                _valueColumn(controller.earnedValue),
                _valueColumn(controller.totalEarnings),
                _valueColumn(controller.spins),
              ])
            ],
          );
        }),
      );

  Widget get goldenBox => Obx(
        () => AnimatedCrossFade(
          duration:const Duration(milliseconds: 10),
          crossFadeState: spinningController.isAdsSeen.value
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Image(
              image: const  AssetImage(AssetConstants.icGifGoldBox),
              width: Get.width*.20,
              height: Get.height *.20,
          ),
          secondChild: Padding(
            padding:const  EdgeInsets.only(right:45),
            child: Image(
              width: Get.width*.50,
              height: Get.height *.20,
              image: const  AssetImage(AssetConstants.icGifMoving),
            ),
          ),
        ),
      );

  Widget _titleColumn(var title) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        title.toString(),
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  Widget _valueColumn(var value) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        value.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
