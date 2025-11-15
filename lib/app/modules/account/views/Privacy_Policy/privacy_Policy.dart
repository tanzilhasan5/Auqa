import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/App_Color/app_color.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        leading: BackButton(color: AppColor.primarryColor),
        backgroundColor: Colors.white,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(25),
        ),
        title: Text(' Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(19),
        child: Container(
            height: double.infinity.h,
            width: 336.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            color: AppColor.cardcolor
          ),
          child: Expanded(child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text('lorem 6'),
          )),

        ),
      ),
    );
  }
}
