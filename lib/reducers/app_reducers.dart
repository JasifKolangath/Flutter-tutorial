import 'package:tutorial/models/app_state.dart';
import 'package:tutorial/reducers/counter_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(isLoading: false, count: counterReducer(state.count, action));
}
