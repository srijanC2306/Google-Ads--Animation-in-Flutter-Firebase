import 'package:get/get.dart';
import 'package:google_ads_mob_integration/routes/route_constants.dart';

import '../spinner/screens/reward_screen.dart';
import '../spinner/screens/spinner_screen.dart';

class OnBoardingRoutes {
  OnBoardingRoutes._();

  static List<GetPage> get route => [
        GetPage(
            name: RouteConstants.spinningWheelRoute,
            page: () => SpinnerScreen()),
        GetPage(name: RouteConstants.rewardRoute, page: () => RewardedScreen())
      ];
}
