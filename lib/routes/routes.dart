import 'package:get/get.dart';
import 'onboardingRoutes.dart';

class Routes{
  Routes._() ;

  static List<GetPage> get() {
    final moduleRoutes = <GetPage>[];
     moduleRoutes.addAll(OnBoardingRoutes.route) ;
     return moduleRoutes ;
  }

}