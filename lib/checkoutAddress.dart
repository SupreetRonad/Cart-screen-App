import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CheckOutAddress extends StatefulWidget {
  @override
  _CheckOutAddressState createState() => _CheckOutAddressState();
}

class _CheckOutAddressState extends State<CheckOutAddress> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var name, phone, addr, pin;
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
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        disabledElevation: 0,
        backgroundColor: name == null ? Colors.grey : Colors.black,
        onPressed: name == null ? null : () {},
        tooltip: 'Choose payment option and Place order',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        label: SizedBox(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name == null ? "Please add address" : "Continue",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shipment address",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Tell us where to deliver your order...",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'imgs/address.png',
              height: MediaQuery.of(context).size.height * .3,
            ),
            SizedBox(
              height: 10,
            ),
            name == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Please add your address to continue",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              shadowColor: Colors.white60,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              primary: Colors.white,
                            ),
                            onPressed: () {
                              _addInfo();
                            },
                            child: SizedBox(
                              width: 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Add address")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : _addressCard(),
          ],
        ),
      ),
    );
  }

  Widget _addressCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: Row(
                children: [
                  Text(
                    name != null ? name : ' ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 35,
                    width: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shadowColor: Colors.white60,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {
                        _addInfo();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 3),
            Text(
              phone != null ? phone : ' ',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 5),
            Container(
              constraints: BoxConstraints(
                minWidth: 100,
                maxWidth: 200,
              ),
              child: Text(addr != null ? addr : ' '),
            ),
            SizedBox(height: 5),
            Text(
              pin != null ? pin : ' ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _orderPlaced() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                  Icon(
                    Icons.assignment_turned_in,
                    size: 60,
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Order Placed Successfully..!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.black12),
                    child: TextButton(
                      onPressed: () {
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
      },
    );
  }

  void _addInfo() {
    var flag = [0, 0, 0, 0];
    showMaterialModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add address",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _formField(
                      'Name',
                      'Name here',
                      name,
                      true,
                      1,
                      TextInputType.name,
                      0,
                      (String val) {
                        if (val != null && val.length > 0) {
                          name = val;
                          flag[0] = 0;
                        } else {
                          flag[0] = 1;
                        }
                      },
                    ),
                    _formField(
                      'Phone',
                      'Phone number',
                      phone,
                      true,
                      1,
                      TextInputType.phone,
                      0,
                      (String val) {
                        if (val != null && val.length == 10) {
                          phone = val;
                          flag[1] = 0;
                        } else {
                          flag[1] = 1;
                        }
                      },
                    ),
                    _formField(
                      'Address',
                      'Building no. , Street name, etc.',
                      addr,
                      true,
                      2,
                      TextInputType.streetAddress,
                      0,
                      (String val) {
                        if (val != null && val.length > 0) {
                          addr = val;
                          flag[2] = 0;
                        } else {
                          flag[2] = 1;
                        }
                      },
                    ),
                    _formField(
                      'Pincode',
                      'Pincode',
                      pin,
                      true,
                      1,
                      TextInputType.phone,
                      100,
                      (String val) {
                        if (val != null && val.length == 6) {
                          pin = val;
                          flag[3] = 0;
                        } else {
                          flag[3] = 1;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              primary: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                setState(() {
                                  _formkey.currentState.save();
                                });
                                if (flag.reduce((a, b) => a + b) > 0) {
                                  showToast('Enter valid inforamtion');
                                  name = null;
                                  phone = null;
                                  addr = null;
                                  pin = null;
                                } else {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    _snackbar(
                                      'Address added successfully',
                                      Colors.green,
                                    ),
                                  );
                                }
                              });
                            },
                            child: Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.red,
      fontSize: 16.0,
    );
  }

  Widget _snackbar(String msg, Color color) {
    return SnackBar(
      content: Text(msg),
      backgroundColor: color,
    );
  }

  Widget _formField(
      String name,
      String hint,
      String initialValue,
      bool needed,
      int maxLines,
      TextInputType keyboardType,
      double width,
      Function validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 10, 0),
          child: Row(
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.black.withOpacity(.8),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (needed)
                Text(
                  ' *',
                  style: TextStyle(
                    color: Colors.red.withOpacity(.6),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
        Container(
          width: width > 0 ? width : double.infinity,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(.05),
          ),
          child: TextFormField(
            initialValue: initialValue ?? '',
            textInputAction: TextInputAction.next,
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.black45,
                fontSize: 13,
              ),
            ),
            onSaved: validator,
          ),
        ),
      ],
    );
  }
}
