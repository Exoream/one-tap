import 'package:ecommerce/binding/product_detail_binding.dart';
import 'package:ecommerce/pages/account/account_screen.dart';
import 'package:ecommerce/pages/home/home_screen.dart';
import 'package:ecommerce/pages/login/login_screen.dart';
import 'package:ecommerce/pages/onboarding/onboarding_screen.dart';
import 'package:ecommerce/pages/onboarding/splash_screen.dart';
import 'package:ecommerce/pages/product/product_detail_screen.dart';
import 'package:ecommerce/pages/product/product_screen.dart';
import 'package:ecommerce/pages/register/register_screen.dart';
import 'package:ecommerce/pages/wishlist/wishlist_screen.dart';
import 'package:ecommerce/routes/routes_named.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static final appRoutes = [
    GetPage(name: RoutesNamed.login, page: () => const LoginScreen()),
    GetPage(name: RoutesNamed.register, page: () => const RegisterScreen()),
    GetPage(name: RoutesNamed.dashboard, page: () => const HomeScreen()),
    GetPage(name: RoutesNamed.product, page: () => const ProductScreen()),
    GetPage(name: RoutesNamed.wishlist, page: () => const WishlistScreen()),
    GetPage(name: RoutesNamed.account, page: () => const AccountScreen()),
    GetPage(name: RoutesNamed.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: RoutesNamed.splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: RoutesNamed.productDetail,
      page: () => const ProductDetailScreen(),
      binding: ProductDetailsBinding()
    ),
  ];
}
