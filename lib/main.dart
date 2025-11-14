import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(374, 812),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme:  ThemeData(
          scaffoldBackgroundColor: Colors.white70,
          textTheme: GoogleFonts.interTextTheme(),
        ),

        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
