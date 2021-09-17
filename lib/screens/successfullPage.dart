import 'package:cyn/api/fileFetch.dart';
import 'package:cyn/api/model/FetchFile.dart';
import 'package:flutter/material.dart';
// import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';

class successfulPage extends StatefulWidget {
  @override
  _successfulPageState createState() => _successfulPageState();
}

Future<FetchFile> futureSuccesfullPage;

class _successfulPageState extends State<successfulPage> {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  // Future<FetchFile> futureSuccesfullPage;

  @override
  void initState() {
    String requestId = storage.getItem("requestId");
    // String otpNo = storage.getItem("otp");
    String authId = storage.getItem("authId");
    String panCode;
    String drvCode;

    // futureSuccesfullPage = fetchFile(authId, requestId, panCode, drvCode);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(height: 70),
            Center(
              child: Image.asset(
                'assets/logo/cynapseLogo.png',
                width: 30,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text("Success!",
                    style: TextStyle(
                        color: Color(0xff063057),
                        fontSize: 24,
                        fontWeight: FontWeight.w800)),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(85, 20, 85, 20),
                child: Text(
                    "Your files have been  successfully fetched ,if you wish to download the files raise the dropdown. ",
                    style: TextStyle(color: Color(0xff063057), fontSize: 14),
                    textAlign: TextAlign.center),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(90, 5, 90, 5),
              // child: SizedBox(
              // width: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                color: Color(0xFF01dcdc),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFF01dcdc),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: viewMoreButtons(
                    "View Documents ", () => {showPowerBottomSheet(context)}),
              ),
            )
          ],
        ),
      ),
    );
  }
}

MaterialButton viewMoreButtons(String title, Function fun) {
  return MaterialButton(
    onPressed: fun,
    textColor: Colors.white,
    color: const Color(0xFF01dcdc),
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.left,
      ),
    ),
    height: 55,
    minWidth: 700,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
  );
}

RaisedButton blueButton(String label, Function fun) {
  return RaisedButton(
    onPressed: fun,
    textColor: Colors.white,
    color: Color(0xfff063057),
    padding: const EdgeInsets.all(15.0),
    child: Text(label),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

showPowerBottomSheet(BuildContext context) => showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        height: 600,
        color: Color(0xFF737373),
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                )),
            child: FutureBuilder<FetchFile>(
                future: futureSuccesfullPage,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          viewMoreButtons(
                              "Files Fetched ", () => {Navigator.pop(context)}),
                          SizedBox(height: 10),
                          listItemContainer(
                              "Date of Transaction", "17th April, 2019"),
                          listItemContainer(
                              "Transaction References", "KED12435353636"),
                          listItemContainer("Token", "1234 5668 4657 3849"),
                          listItemContainer("Account Type", "Prepaid"),
                        ],
                      );
                    });
                  }
                })
            //  Column(
            //   children: <Widget>[
            //     viewMoreButtons("Files Fetched ", () => {Navigator.pop(context)}),
            //     SizedBox(height: 10),
            //     listItemContainer("Date of Transaction", "17th April, 2019"),
            //     listItemContainer("Transaction References", "KED12435353636"),
            //     listItemContainer("Token", "1234 5668 4657 3849"),
            //     listItemContainer("Account Type", "Prepaid"),
            //   ],
            // ),
            ),
      );
    });

Widget listItemContainer(String title, String value) => Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(196, 196, 196, 1)),
          ),
          SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
        ],
      ),
      decoration: BoxDecoration(
          border: new Border(
              bottom: new BorderSide(width: 1.0, color: Color(0xffC4C4C4)))),
    );
