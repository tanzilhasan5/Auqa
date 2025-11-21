import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomCheckbox extends StatelessWidget {
  final RxBool value;
  final RxBool showError;
  final VoidCallback onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.showError,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged();
        if (value.value) showError.value = false; // hide error when checked
      },
      child: Obx(
        () => Container(
          height: 18.h,
          width: 18.w,
          decoration: BoxDecoration(
            color: value.value
                ? const Color(0xff369FFF).withOpacity(0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),

            /// 🔥 If unchecked & showError = true → Red Border
            border: Border.all(
              color: showError.value
                  ? Colors.red
                  : const Color(0xff369FFF),
              width: 1.4,
            ),
          ),
          child: value.value
              ? const Icon(
                  Icons.check,
                  size: 14,
                  color: Color(0xff369FFF),
                )
              : null,
        ),
      ),
    );
  }
}
