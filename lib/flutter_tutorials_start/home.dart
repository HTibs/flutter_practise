import 'package:flutter/material.dart';
import 'dart:async';

// app dependendcies
import 'home_model.dart';
import 'home_state.dart';
import 'home_event.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final model = HomeModel();

  @override
  void initState() {
    // TODO: implement initState
    model.dispatch(FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.dispatch(FetchData());
          },
        ),
        body: StreamBuilder(
          stream: model.homeState,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return _getInformationMessage(snapshot.error);
            }
            var homeSate = snapshot.data;
            if (!snapshot.hasData || homeSate is BusyHomeState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (homeSate is DataFetchedHomeState) {
              if (!homeSate.hasData) {
                return _getInformationMessage(
                    'No Data found for your account, Check back later again');
              }
            }
            return ListView.builder(
                itemCount: homeSate.data.length,
                itemBuilder: (context, index) =>
                    _getListItemUI(index, homeSate.data));
          },
        ));
  }

  Widget _getListItemUI(int index, List<String> lsitOfItems) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.grey[600]),
      child: Center(
          child: Text(
        lsitOfItems[index],
        style: TextStyle(color: Colors.white),
      )),
    );
  }

  Widget _getInformationMessage(String message) {
    return Center(
        child: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey[500]),
    ));
  }
}

// The following code is a way to understand how future builder works
// it can be alone replaced by future builder

//class _HomeState extends State<Home> {
//  List<String> _pageData;
//
//  bool get _fetchingData => _pageData == null;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    _getListData(hasError: true).then((value) => setState(() {
//      if (value.length == 0) {
//        value.add("No data found after running the future");
//      }
//
//      _pageData = value;
//    }));
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.grey[900],
//      body: _fetchingData
//          ? Center(
//        child: CircularProgressIndicator(),
//      )
//          : ListView.builder(
//          itemCount: _pageData.length,
//          itemBuilder: (context, index) => _getListItemUI(index)),
//    );
//  }
//
//  Future<List<String>> _getListData(
//      {bool hasError = false, bool hasData = true}) async {
//    await Future.delayed(Duration(seconds: 2));
//    if (hasError) {
//      return Future.error("An error occured while getting the data");
//    }
//    if (!hasData) {
//      return List<String>();
//    }
//    return List<String>.generate(10, (index) => '$index title');
//  }
//
//  Widget _getListItemUI(int index) {
//    return Container(
//      margin: EdgeInsets.all(5.0),
//      height: 50.0,
//      decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(5.0), color: Colors.grey[600]),
//      child: Center(
//          child: Text(
//            _pageData[index],
//            style: TextStyle(color: Colors.white),
//          )),
//    );
//  }
//}
