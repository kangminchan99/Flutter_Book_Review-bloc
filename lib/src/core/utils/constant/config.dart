import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get naverclientId => dotenv.env['NAVER_CLIENT_ID'] ?? '';
  static String get naverclientSecret =>
      dotenv.env['NAVER_CLIENT_SECRET'] ?? '';
}
