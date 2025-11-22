import 'package:aqua/app/utils/App_Color/app_color.dart';
import 'package:aqua/app/utils/Text_Style/text_Style.dart';
import 'package:aqua/reuse_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Achivment_details_card extends StatelessWidget {
  final String imagePath;
  final String subtitle;
  final String descriptionLine1;
  final String descriptionLine2;

  const Achivment_details_card({
    super.key,
    required this.imagePath,
    required this.subtitle,
    required this.descriptionLine1,
    required this.descriptionLine2,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        InkWell(
          onTap: (){
            Get.back();
          },
            child: Icon(Icons.cancel_outlined)),
        Center(child: Image(image: AssetImage(imagePath) ,fit: BoxFit.cover,)),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You own', style: AppTextStyles.title20_w500()),
            SizedBox(width: 5),
            Text(
              subtitle,
              style: AppTextStyles.title26_w600(color: AppColor.primarryColor),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('badge', style: AppTextStyles.title26_w600())],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              descriptionLine1,
              style: AppTextStyles.title12_w600(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(descriptionLine2, style: AppTextStyles.title12_w600()),
          ],
        ),
        Spacer(),
        CustomButton(
          onpress:(){
            _showShareDialog(context);
          },
          borderRadius: BorderRadius.circular(36),
          title: 'Share',
        ),
        SizedBox(height: 20),
      ],
    );
  }
  void _showShareDialog(BuildContext context) {
    final shareOptions = [
      {'icon': Icons.link, 'label': 'Copy link', 'color': const Color(0xFF8E8E93)},
      {'icon': Icons.send, 'label': 'Direct', 'color': const Color(0xFF9C27B0)},
      {'icon': Icons.telegram, 'label': 'Telegram', 'color': const Color(0xFF0088CC)},
      {'icon': Icons.message, 'label': 'Messenger', 'color': const Color(0xFF006AFF)},
      {'icon': Icons.flutter_dash, 'label': 'Twitter', 'color': const Color(0xFF1DA1F2)}, // Fixed icon
      {'icon': Icons.sms, 'label': 'Messages', 'color': const Color(0xFF4CAF50)},
      {'icon': Icons.more_horiz, 'label': 'More', 'color': const Color(0xFF8E8E93)},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Share',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: shareOptions.length,
                  itemBuilder: (context, index) {
                    final opt = shareOptions[index];
                    return GestureDetector(
                      onTap: () {
                        Get.back(); // Close bottom sheet
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: opt['color'] as Color,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              opt['icon'] as IconData,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            opt['label'] as String,
                            style: const TextStyle(fontSize: 11),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Get.back(),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
            ],
          ),
        ),
      ),
    );
  }
}
