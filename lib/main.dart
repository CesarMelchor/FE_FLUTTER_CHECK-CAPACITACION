import 'package:check_capacitacion_front/screens/check_asist.dart';
import 'package:check_capacitacion_front/src/home.dart';
import 'package:check_capacitacion_front/src/providers/login_provider_c.dart';
import 'package:check_capacitacion_front/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



void main() {
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) {
    return VRouter(
      theme: ThemeData(
         primarySwatch: primary,
      ),
      localizationsDelegates: const [
       GlobalMaterialLocalizations.delegate,
       GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
                  ],
      supportedLocales: const [
      Locale('es'),
      ],
      initialUrl: '/home',
      title: 'SCAV',
      debugShowCheckedModeBanner: false,
      routes: [

        VWidget(path: '/home',widget: ChangeNotifierProvider(create: (_) => LoginProvider(),
          child: const LoginScreen())),
        VWidget(path: '/check',widget: ChangeNotifierProvider(create: (_) => LoginProvider(),
          child: const CheckAsistScreen())),

      ],
    );
  }));
}