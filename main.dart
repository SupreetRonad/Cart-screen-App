import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'details.dart';

var item = [
  ["iPhone XR", "Yellow | 128 GB", "imgs/a1.png", 52900, 1, 52900],
  ["iPhone mini", "Purple | 256 GB", "imgs/a2.png", 84900, 1, 84900],
  ["iPad Pro (11 inch)", "Silver | 128 GB | WiFi", "imgs/a3.png", 79900, 1, 84900]
];

var total = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    var i=0;
    total = (int.parse(item[0][5].toString())+ int.parse(item[1][5].toString())+ int.parse(item[2][5].toString()));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0,
        title: Row(
          children: <Widget>[
            Icon(Icons.arrow_back),
            Spacer(),
            Text("CART  "),
            Icon(Icons.shopping_cart),
          ],
        )
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                child: total == 0 ?
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Cart is empty",
                      style: TextStyle(fontSize: 15, color: Colors.black38),
                    ),
                    SizedBox(height: 5,),
                    Text("( Restart the app )",
                      style: TextStyle(fontSize: 12, color: Colors.black38),
                    ),
                  ],
                )
                    :
                Column(
                  children: <Widget>[
                    for(var i=0; i<=2 ; i++ )
                      item[i][4] == 0 ? SizedBox()
                      :
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset( item[i][2] , width: 80, height: 80,),
                                ),
                                SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 15,),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .6,
                                      child: Row(
                                        children: [
                                          Text(
                                              item[i][0],
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87
                                              ),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: (){
                                              _confirm(i);
                                            },
                                            child: Icon(Icons.delete_outline, color: Colors.red.withOpacity(.6), size: 22,),
                                          )
                                          
                                        ],
                                      ),
                                    ),
                                    Text(
                                        item[i][1],
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black38
                                        ),
                                    ),
                                    SizedBox(height: 25,),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .6,
                                      child: Row(
                                        children: [
                                          Text(
                                              'Rs. ' + item[i][3].toString(),
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green
                                              ),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              var temp = int.parse(item[i][4].toString());
                                              setState(() {
                                                if (temp > 1) {
                                                  item[i][4] = temp - 1;
                                                  item[i][5] = (temp - 1) * int.parse(item[i][3].toString());
                                                }

                                              });
                                            },
                                            child: Card(
                                                elevation: 0.0,
                                              color: Colors.grey.withOpacity(.2),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child:
                                                  Padding(
                                                    padding: const EdgeInsets.all(3.0),
                                                    child: Icon(Icons.remove, size: 17,),
                                                  )
                                            ),
                                          ),
                                          Text(
                                              ' '+item[i][4].toString()+' ',
                                              style: TextStyle(
                                                fontSize: 17
                                              ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              var temp = int.parse(item[i][4].toString());
                                              if (temp < 9) {
                                                setState(() {
                                                  item[i][4] = temp + 1;
                                                  item[i][5] = (temp + 1) * int.parse(item[i][3].toString());
                                                });
                                              }
                                              else{
                                                Fluttertoast.showToast(
                                                  msg: "Maximum limit reached",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                );
                                              }
                                            },
                                            child: Card(
                                              elevation: 0.0,
                                                color: Colors.grey.withOpacity(.2),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child:
                                                Padding(
                                                  padding: const EdgeInsets.all(3.0),
                                                  child: Icon(Icons.add, size: 17,),
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ),
                        ),
                      )
                  ],
                ),
            ),
            Material(
              elevation: 40,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                height: 75,
                width: MediaQuery.of(context).size.width,

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Total :",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45
                        ),
                      ),
                      Text(
                          'Rs. '+ (int.parse(item[0][5].toString())+ int.parse(item[1][5].toString())+ int.parse(item[2][5].toString())).toString(),
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green
                        ),
                      ),
                    ],
                  ),
                )
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        disabledElevation: 0,
        backgroundColor: total == 0 ? Colors.grey : Colors.lightGreen,
        onPressed: total == 0 ? null
          :
        (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Details()),
          );
        },
        tooltip: 'Choose payment option and Place order',
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        label: Row(
          children: <Widget>[
            Text("Check out  ", style: TextStyle(fontWeight: FontWeight.bold )),
            Icon(Icons.arrow_forward_ios_outlined, size: 17,),
          ],
        ),

      ),
    );
  }
  
  void _confirm(var i){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return Container(
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 120,
                  width: 320,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete_outline, size: 40, color: Colors.red.withOpacity(.6),),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text("Do you want to remove "),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(item[i][0] , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                  Text(" from your cart ?"),
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 110,
                            child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.black12,
                                onPressed: (){
                                  setState(() {
                                    item[i][4] = 0;
                                    item[i][5] = 0;
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Text("Confirm")
                            ),
                          ),
                          SizedBox(width: 10,),
                          FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel")
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
