import 'package:flutter/material.dart';
var flag = 0;

var name , addr, street, pin, phone;

class CheckOutAddress extends StatefulWidget {
  @override
  _CheckOutAddressState createState() => _CheckOutAddressState();
}

class _CheckOutAddressState extends State<CheckOutAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0,
          title: Row(
            children: <Widget>[
              Spacer(),
              Text("Delivery details  "),
              Icon(Icons.delivery_dining),
            ],
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        disabledElevation: 0,
        backgroundColor: name == null ? Colors.grey : Colors.lightGreen,
        onPressed: name == null ? null
            :
        (){
          showDialog(context: context, builder: (BuildContext context){
            return Container(
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                backgroundColor: Colors.white,
                child: SizedBox(
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.assignment_turned_in, size: 60, color: Colors.green,),
                      SizedBox(height: 10,),
                      Text("Order Placed Successfully..!", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),),
                      SizedBox(height: 15,),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black12
                        ),
                        child: TextButton(
                          onPressed: (){
                            name = null;
                            addr = null;
                            phone = null;

                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });

        },
        tooltip: 'Choose payment option and Place order',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        label: SizedBox(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Place Oder and pay Rs. " + 57500.toString() , style: TextStyle(fontWeight: FontWeight.bold )),

            ],
          ),
        ),

      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 15,),
                Icon(Icons.play_arrow),
                Text("  Shipment address", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10,),
            name == null ? Container(
              width: 150,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextButton(
                    onPressed: (){
                      _addInfo();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 10,),
                        Text("Add address")
                      ],
                    ),

                ),
              ),

            )
                :
            Row(
              children: [
                SizedBox(width: 47,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Row(
                        children: [
                          Text(
                              name != null ? name : ' ',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Spacer(),
                          Container(
                            width: 55,
                            height: 45,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: FlatButton(
                                onPressed: (){
                                  _addInfo();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.edit, size: 15,),
                                  ],
                                ),

                              ),
                            ),

                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 3,),
                    Text(
                        phone != null ? phone : ' ',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                    SizedBox(height: 5,),
                    Container(
                        constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
                        child: Text(addr != null ? addr : ' ')
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 15,),
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
        ),
        //child: ,
      ),
    );

  }

  void _addInfo(){
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return SizedBox(
        height: 420,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("  Please fill following CheckOutAddress", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(5.0),
                  //width: 320,
                  child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                        labelText: 'Name here',
                        labelStyle: TextStyle(color: Colors.black45)
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      name = value;
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(5.0),
                  //width: 320,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                        labelText: 'Phone No.',
                        labelStyle: TextStyle(color: Colors.black45)
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      phone = value;
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(5.0),
                  //width: 320,
                  child: TextFormField(
                    maxLines: 2,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                        labelText: 'Address',
                        labelStyle: TextStyle(color: Colors.black45)
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      addr = value;
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: FlatButton(
                    onPressed: (){
                      setState(() {
                        if (!_formkey.currentState.validate()) {
                          return;
                        }
                        _formkey.currentState.save();
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text("Continue"),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
