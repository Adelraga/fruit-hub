
import 'package:go_router/go_router.dart';

import '../../Features/OnBoarding/presentation/view/onBoarding-view.dart';
import '../../Features/Splash/presentation/view/splash-view.dart';


abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/onboardingView',
      builder: (context, state) => const OnBoardingView(),
    ),


    // GoRoute(
    //   path: '/bookDetail',
    //   builder: (context, state) => BlocProvider(
    //     create: (context) => SimilarBooksDetailsCubit(
    //       getIt.get<HomeRepoImpl>()
    //     ),
    //     child: BookDetailsView(
    //       bookModel: state.extra as Book,
    //     ),
    //   ),
    // ),
    // GoRoute(
    //   path: '/search',
    //   builder: (context, state) => SearchView(),
    // ),
  ]);
}
