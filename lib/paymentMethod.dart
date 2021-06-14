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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        disabledElevation: 0,
        backgroundColor: Colors.black,
        onPressed: () {
          _orderPlaced();
        },
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
                "Place order",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment options",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Select a payment option to continue...",
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
            'imgs/payment.png',
            height: MediaQuery.of(context).size.height * .3,
          ),
          _paymentOption(
            70,
            0,
            'Credit / Debit Card',
            Icons.credit_card,
          ),
          _paymentOption(
            70,
            1,
            'Internet Banking',
            Icons.language,
          ),
        ],
      ),
    );
  }

  Widget _paymentOption(
    double height,
    int index,
    String optionName,
    IconData icon,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.white38,
            primary: Colors.white,
            elevation: flag == index ? 10 : 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          onPressed: () {
            setState(() {
              flag = index;
            });
          },
          child: Row(
            children: [
              Icon(
                flag == index
                    ? Icons.check_circle
                    : Icons.radio_button_off_outlined,
                color: flag == index ? Colors.green : Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                optionName,
                style: TextStyle(fontSize: 15),
              ),
              Spacer(),
              Icon(
                icon,
              ),
            ],
          ),
        ),
      ),
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
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.assignment_turned_in,
                    size: 50,
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Order Placed Successfully..!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "Your order has been successfully placed\nWill be delivered very soon.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.black,
                      ),
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
}
