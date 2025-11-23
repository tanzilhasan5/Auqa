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
        child: SingleChildScrollView(
          primary: false,
          child: Container(

              width: 336.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
              color: AppColor.cardcolor
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Flexible(child: Text('IntroductionWelcome to AquaPal. We are committed to protecting your personal information and your right to privacy. This Privacy Policy explains what information we collect, how we use it, and what rights you have in relation to it.What Information We Collect1. Information You Provide to Us:Account Information: When you sign in with Google, we receive your full name and email address to create and manage your account.Hydration Data: We collect the water intake amounts and dates you log, as well as the hydration goals you set (e.g., daily target, weight, activity level).Feedback: We store any feedback, suggestions, or bug reports you voluntarily submit through the feedback form.2. Information Collected Automatically:We do not collect any personal information automatically. Your usage of the app is private. How We Use Your Information We use the information we collect for the following purposes:To Provide and Maintain the Service: To operate the app, display your progress, and personalize your experience (like greeting you by name). To Manage Your Account: To identify you as a user and provide access to your saved data.To Improve the App: To analyze user feedback and bug reports to make AquaPal better. Your hydration data may be aggregated anonymously to understand usage patterns, but never in a way that identifies you.To Communicate with You: To send you daily reminders if you have enabled them.Will Your Information Be Shared?We do not sell, trade, or rent your personal information to third parties.Your data is stored securely and is only used to power the features within the AquaPal application. We will never share your identifiable data with advertisers or other companies.How We Keep Your Information SafeWe use administrative, technical, and physical security measures to help protect your personal information. These include:Secure Authentication: User login is managed by Googles secure authentication service.Data Encryption: All data sent between your device and our servers is encrypted in transit using HTTPS.Data Isolation: Our database architecture ensures that you can only access data linked to your own account.While we have taken reasonable steps to secure the personal information you provide to us, please be aware that no security measures are perfect or impenetrable.')),
            ),
          
          ),
        ),
      ),
    );
  }
}
