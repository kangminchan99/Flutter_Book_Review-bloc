import 'package:bookreview/firebase_options.dart';
import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/search_book/data/data_sources/remote/search_book_impl_api.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_params.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  await initInjections();
  runApp(const BookReviewApp());
}

class BookReviewApp extends StatelessWidget {
  const BookReviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sl<SearchBookImplApi>().searchNaverBooks(
        const SearchBookParams.init(query: '플러터'),
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(title: const Text('Book Review App')),
              body: Center(child: Text('Search Result: ${snapshot.data}')),
            ),
          );
        }
        return Container();
      },
    );
  }
}
