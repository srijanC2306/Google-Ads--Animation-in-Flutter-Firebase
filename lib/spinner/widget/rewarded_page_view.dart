
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_ads_mob_integration/spinner/widget/rewarded_item.dart';

import 'expandle_page_view.dart';
class RewardedPageView extends StatefulWidget {
  final List<Color> colorList ;
  final List<String> imageUrl ;
  const RewardedPageView({required this.colorList , required this.imageUrl , Key? key}) : super(key: key);

  @override
  State<RewardedPageView> createState() => _RewardedPageViewState();
}

class _RewardedPageViewState extends State<RewardedPageView> {


  double viewPortFraction = 0.56;
  int currentPage =1 ;
  late PageController pageController ;
  double FULL_SCALE = 1.0;
  double PAGER_HEIGHT = 200.0;
  double SCALE_FRACTION = 0.7;
  double page =1.0 ;


  @override
  void initState() {
   pageController = PageController(initialPage:currentPage , viewportFraction: viewPortFraction);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification){
        if(notification is ScrollUpdateNotification) {
          debugPrint("Inside scroll");
          setState(() {
            page = pageController.page!;
          });
        }
          throw Exception("Scroll Issue") ;


      },
        child: ExpandablePageView.builder(
          itemCount: widget.colorList.length,
          controller: pageController,
            onPageChanged: (pos){
              setState(() {
                currentPage = pos ;
              });
            },
            itemBuilder: (context , index){
             final scale = max(SCALE_FRACTION, (FULL_SCALE - (index - page).abs()) + viewPortFraction);
             debugPrint(scale.toString());
              return RewardedItem(color: widget.colorList[index], imageUrl: widget.imageUrl[index], scale: scale);
            }));
  }


}
