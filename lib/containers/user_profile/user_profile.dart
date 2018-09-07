import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tutorial/models/app_state.dart';
import 'package:redux/redux.dart';

class CurrentUserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, _ViewModel vm) {
          if (vm.displayName == null) {
            return Container();
          } else {
            return Center(
              child: Column(
                children: <Widget>[
                  Text('Now signed in:',
                      style: Theme.of(context).textTheme.display1),
                  Text(vm.displayName,
                      style: Theme.of(context).textTheme.display2),
                ],
              ),
            );
          }
        });
  }
}

class _ViewModel {
  final String displayName;
  final String profileImgUrl;

  _ViewModel({@required this.displayName, @required this.profileImgUrl});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      // We have to use the null aware operator here, so that
      // when there isn't a user, it just fails silently
      displayName: store.state.currentUser?.displayName,
      profileImgUrl: store.state.currentUser?.photoUrl,
    );
  }
}
