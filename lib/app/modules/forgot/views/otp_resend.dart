import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpResendText extends StatefulWidget {
  const OtpResendText({super.key});

  @override
  State<OtpResendText> createState() => _OtpResendTextState();
}

class _OtpResendTextState extends State<OtpResendText> {
  int _secondsRemaining = 0; // Start at 0, not counting yet
  bool _isResendAvailable = true; // Allow first resend
  Timer? _timer;

  void _startTimer() {
    setState(() {
      _isResendAvailable = false;
      _secondsRemaining = 30; // countdown duration
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        setState(() {
          _isResendAvailable = true;
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _onResend() {
    print("Resend OTP tapped");
    _startTimer();

  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: "Don't get the code? ",
          style: GoogleFonts.poppins(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
          children: [
            _isResendAvailable
                ? TextSpan(
                    text: "Resend",
                    style: GoogleFonts.manrope(
                      color: const Color(0xff369FFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = _onResend,
                  )
                : TextSpan(
                    text: " ${_formatTime(_secondsRemaining)}",
                    style: GoogleFonts.poppins(
                      color: const Color(0xff369FFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
