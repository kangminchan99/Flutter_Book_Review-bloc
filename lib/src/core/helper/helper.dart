// 초기 고정 세팅 값
import 'package:bookreview/src/core/utils/constant/config.dart';

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
}
