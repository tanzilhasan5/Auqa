import 'package:flutter/material.dart';

import '../../../../utils/App_Color/app_color.dart';

class CustomSwitch extends StatefulWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    Key? key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool isSwitch;

  @override
  void initState() {
    super.initState();
    isSwitch = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
        ),
        Transform.scale(

          scaleX: 1,
          scaleY: 1,
          child: Switch(
         inactiveTrackColor: Color(0xffB2B2B2),
            inactiveThumbColor: Colors.white,

            activeThumbColor: Colors.white,
            activeTrackColor: AppColor.primarryColor,
            value: isSwitch,
            onChanged: (bool newValue) {
              setState(() {
                isSwitch = newValue;
              });
              widget.onChanged(newValue);
            },
          ),
        ),
      ],
    );
  }
}