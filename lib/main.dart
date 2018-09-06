import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tutorial/models/app_state.dart';
import 'package:tutorial/reducers/app_reducers.dart';
import 'package:redux_logging/redux_logging.dart';
import 'middleware/auth_middleware.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  String title = 'Tutorial';
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: []
      ..addAll(createAuthMiddleware())
      ..add(LoggingMiddleware.printer()),
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: title,
        home: HomePage(title),
      ),
    );
  }
}
