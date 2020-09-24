import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_demo/bloc/account_detail/account_block.dart';
import 'package:transaction_demo/bloc/account_detail/account_state.dart';
import 'package:transaction_demo/bloc/transaction_state.dart';

import '../bloc/transaction_bloc.dart';
import 'custom/circle_clipper.dart';
import 'custom/triangle_tab_indicator.dart';


class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoadSuccess) {
          print("state$state");
          return Container(
            color: Colors.black,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.grey[800],
                resizeToAvoidBottomPadding: false,
                body: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.black,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 60,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 58,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        "https://live.staticflickr.com/8072/8407531653_3e6edffd87_b.jpg"),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Rocky Woodwala",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "Individual Account",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 15),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    "\$ 224113.",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40),
                                  ),
                                  Text(
                                    "88",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        color: Colors.black,
                        child: TabBar(
                          controller: _controller,
                          indicator: TriangleTabIndicator(color: Colors.black),
                          indicatorColor: Colors.yellow,
                          labelColor: Colors.amber,
                          unselectedLabelColor: Colors.white,
                          tabs: [
                            Tab(text: "Transactions"),
                            Tab(text: "Account Info"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: Colors.grey[800],
                              child: TabBarView(
                                controller: _controller,
                                children: [
                                  ListView.builder(
                                      itemCount: state.transactions.length,
                                      itemBuilder: (context, index) {
                                        return buildTransactionItem(
                                            state, index);
                                      }),
                                  buildAccountDetail()
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: EdgeInsets.only(left: 16),
                                color: Colors.black,
                                height: 40,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Settings",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.grey[800],
                                        child: ClipPath(
                                          clipper: SemiCircleClipper(
                                              right: 10, holeRadius: 50),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                              ),
                                              height: 40),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 15,
                              child: ClipOval(
                                child: Material(
                                  color: Colors.amber, // button color
                                  child: InkWell(
                                    splashColor: Colors.white, // inkwell color
                                    child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Icon(Icons.add)),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Padding buildTransactionItem(TransactionLoadSuccess state, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 16),
                child: Container(
                  child: state.transactions[index].amount > 0
                      ? Icon(Icons.arrow_downward)
                      : Icon(Icons.arrow_upward),
                  decoration: BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      state.transactions[index].name,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state.transactions[index].timestamp,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    Text(
                      state.transactions[index].remark,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "\$ " + state.transactions[index].amount.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state.transactions[index].referenceNumber,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
          index + 1 == state.transactions.length
              ? Container(
                  height: 60,
                )
              : Container()
        ],
      ),
    );
  }
}

Padding buildAccountDetail() {
  return Padding(
    padding: EdgeInsets.all(10),
    child: BlocBuilder<AccountBloc, AccountDetailState>(
      builder: (context, state) {
        if (state is AccountDetailLoadSuccess) {
          print(state.accDetail[0].fullName);
          return Text("shubh");
        }
        return Text("Nothing");
      },
    ),
  );
}
