class HomeEvent {}

class FetchData extends HomeEvent {
  final bool hasError;
  final bool hasData;

  FetchData({this.hasData = true, this.hasError = false});

  @override
  String toString() {
    // TODO: implement toString
    return 'FetchData {hasError: $hasError, hasdata: $hasData}';
  }
}
