import 'dart:async';

import 'home_state.dart';
import 'home_event.dart';

class HomeModel {
  final StreamController<HomeState> _stateController =
      StreamController<HomeState>();

  List<String> _listItems;

  // -- Public interface for the home model --

  // stream that broadcasts the home data
  Stream<HomeState> get homeState => _stateController.stream;

  // the getlistdata function should also be private so that the ui doesnt decide whether or not
  // to change call the future again and again
  // for that the dispatch function is called

  void dispatch(HomeEvent event) {
    print("HomeModel()''': Event dispatch $event");
    if (event is FetchData) {
      _getListData(hasData: event.hasData, hasError: event.hasError);
    }
  }

  // -- --

  Future<void> _getListData(
      {bool hasError = false, bool hasData = true}) async {
    _stateController.add(BusyHomeState());
    await Future.delayed(Duration(seconds: 2));
    if (hasError) {
      return _stateController
          .addError('An Error occurred while fetching the data');
    }
    if (!hasData) {
      return _stateController.add(DataFetchedHomeState(data: List<String>()));
    }
    _listItems = List<String>.generate(10, (index) => '$index title');
    _stateController.add(DataFetchedHomeState(data: _listItems));
  }
}
