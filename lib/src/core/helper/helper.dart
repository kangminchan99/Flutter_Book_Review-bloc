// 초기 고정 세팅 값
import 'dart:convert';
import 'dart:math';

import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/core/utils/constant/config.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Helper {
  // dio header
  static Map<String, dynamic> getHeaders() {
    // 기본 헤더 값 정의
    final headers = {
      'X-Naver-Client-Id': Config.naverclientId,
      'X-Naver-Client-Secret': Config.naverclientSecret,
    };

    return headers;
  }

  static String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static customSnackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: AppTextStyle.xLargeWhiteBold)),
    );
  }
}
