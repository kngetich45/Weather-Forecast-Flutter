import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:weather_app/modules/core/bloc/language/langauge_cubit.dart';
import 'package:weather_app/modules/core/di/di.dart';
import 'package:weather_app/modules/features/splashScreen/splash_screen.dart';
import 'package:weather_app/modules/shared/utils/bloc_observer.dart';
import 'package:weather_app/modules/shared/utils/color.dart';
import 'package:weather_app/modules/shared/utils/routes.dart';
import 'package:weather_app/modules/shared/utils/themes.dart';

import 'package:weather_app/modules/core/di/di.dart' as get_it;

void _initBlocObserver() {
  BlocOverrides.runZoned(
    () {
      runApp(EasyLocalization(
          path: 'assets/translations',
          supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
          fallbackLocale: const Locale('en', 'US'),
          useFallbackTranslations: true,
          child: const MyApp()));
    },
    blocObserver: SimpleBlocObserver(),
  );
}

void _initFimber() {
  Fimber.plantTree(DebugTree(useColors: true));
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  get_it.initializeInitiator();
  _initBlocObserver();
  _initFimber();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider<LanguageCubit>(create: (ctx) {
            return inject.get<LanguageCubit>();
          }),
        ],
        child: BlocProvider(
          create: (ctx) => inject.get<LanguageCubit>()..getLocale(),
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Weather App',
                theme: ThemeData(
                  unselectedWidgetColor: Palette.primaryColor,
                  primaryColor: Palette.primaryColor,
                  scaffoldBackgroundColor: Palette.white,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: textTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: Palette.primaryColor),
                ),
                locale: state is LanguageSupportLoaded
                    ? (state.hasCustomLanguage
                        ? Locale(state.language, '')
                        : null)
                    : null,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                routes: routes,
                builder: (context, widget) => ResponsiveWrapper.builder(
                    BouncingScrollWrapper.builder(context, widget!),
                    maxWidth: 1200,
                    minWidth: 480,
                    defaultScale: true,
                    breakpoints: [
                      const ResponsiveBreakpoint.resize(490, name: MOBILE),
                      const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                      const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                    ],
                    background: Container(color: const Color(0xFFF5F5F5))),
                initialRoute: SplashPage.routeName,
              );
            },
          ),
        ),
      ),
    );
  }
}
