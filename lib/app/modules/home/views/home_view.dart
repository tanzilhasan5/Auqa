import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/App_image/app_image.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Image(image: AssetImage(Img.coffee))
            ],
          )
        ],
      )
    );
  }
}
