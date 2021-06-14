import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  var flag = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
              children: [
                SizedBox(width: 15,),
                Icon(Icons.play_arrow),
                Text("  Select Payment Options", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),

              ],
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: flag == 0 ? 2 : 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: FlatButton(
                    onPressed: (){
                      setState(() {
                        flag = 0;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                            flag == 0 ? Icons.check_circle : Icons.radio_button_off_outlined,
                            color: flag == 0 ? Colors.green : Colors.grey,
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.credit_card),
                        SizedBox(width: 10,),
                        Text(" Credit / Debit Card",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: flag == 1 ? 2 : 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: FlatButton(
                    onPressed: (){
                      setState(() {
                        flag = 1;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          flag == 1 ? Icons.check_circle : Icons.radio_button_off_outlined,
                          color: flag == 1 ? Colors.green : Colors.grey,
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.language),
                        SizedBox(width: 10,),
                        Text(" Internet Banking",
                          style: TextStyle(fontSize: 15),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            )
        ],
      )
    );
  }
}
