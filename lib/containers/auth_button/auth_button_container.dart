import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tutorial/actions/auth_actions.dart';
import 'package:tutorial/models/app_state.dart';
import 'package:tutorial/containers/auth_button/google_auth_button.dart';
import 'package:redux/redux.dart';

class GoogleAuthButtonContainer extends StatelessWidget {
  GoogleAuthButtonContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Connect to the store:
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        // We haven't made this yet.
        return GoogleAuthButton(
          buttonText: vm.buttonText,
          onPressedCallback: vm.onPressedCallback,
        );
      },
    );
  }
}

class _ViewModel {
  final String buttonText;
  final Function onPressedCallback;

  _ViewModel({this.onPressedCallback, this.buttonText});

  static _ViewModel fromStore(Store<AppState> store) {
    // This is a bit of a more complex _viewModel
    // constructor. As the state updates, it will
    // recreate this _viewModel, and then pass
    // buttonText and the callback down to the button
    // with the appropriate qualities:
    //
    return _ViewModel(
        buttonText:
            store.state.currentUser != null ? 'Log Out' : 'Log in with Google',
        onPressedCallback: () {
          if (store.state.currentUser != null) {
            store.dispatch(LogOut());
          } else {
            store.dispatch(LogIn());
          }
        });
  }
}
