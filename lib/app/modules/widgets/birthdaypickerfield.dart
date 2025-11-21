import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // for DateFormat

class BirthdayPickerField extends StatefulWidget {
  final FormFieldValidator<String>? validator;

  const BirthdayPickerField({
    Key? key,
    this.validator,
  }) : super(key: key);

  @override
  State<BirthdayPickerField> createState() => _BirthdayPickerFieldState();
}

class _BirthdayPickerFieldState extends State<BirthdayPickerField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _controller.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: 'DD/MM/YY',
        hintStyle: GoogleFonts.manrope(
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
          color:  Colors.grey
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.r),
          child: SvgPicture.asset('assets/icons/date.svg'),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(44.r),
          borderSide: const BorderSide(
            color: Color(0xff369FFF),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(44.r),
          borderSide: const BorderSide(
            color: Color(0xff369FFF),
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(44.r),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(44.r),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1.5,
          ),
        ),
      ),
      onTap: () => _selectDate(context),
    );
  }
}
