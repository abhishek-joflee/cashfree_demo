import 'dart:developer';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

String orderId = "order_1950952I25jLk3g2Uox29xdoH79Kqkmzs";
String stage = "TEST";
String orderAmount = "15.00";
String tokenData =
    "CG9JCN4MzUIJiOicGbhJCLiQ1VKJiOiAXe0Jye.GtQfiYmN3EWZhNGN4ADOzYjI6ICdsF2cfJCL2gTO4UTOxcjNxojIwhXZiwiIS5USiojI5NmblJnc1NkclRmcvJCL1EjOiQnb19WbBJXZkJ3biwiIzpXbrF3S5cDSvRGe5IDevVlMnNzaMpWNykkM1kDM1kTMfJXZkJ3biojIklkclRmcvJye.jeaVjLNqefKCUR-SC1HVJSqL8ovUP_ImmMDr9b2pocUk99K4W_wL28xkvq1jJVq9p8";
String customerName = "Abhishek";
String orderNote = "Order_Note";
String orderCurrency = "INR";
String appId = "1950953d7e9231a3f1df2c9a69590591";
String customerPhone = "9638306280";
String customerEmail = "abhishek.p@codeshastra.com";
String notifyUrl = "https://test.gocashfree.com/notify";

class MyAppState extends State<MyApp> {
  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cashfree SDK Sample'),
        ),
        body: Column(
          children: [
            Center(
              child: TextButton(
                child: const Text('SEAMLESS CARD'),
                onPressed: () => seamlessCardPayment(),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text('SEAMLESS UPI'),
                onPressed: () => seamlessUPIPayment(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // SEAMLESS - CARD
  Future<void> seamlessCardPayment() async {
    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl,

      // EXTRA THINGS THAT NEEDS TO BE ADDED
      "paymentOption": "card",
      "card_number": "4706131211212123",
      "card_expiryMonth": "07",
      "card_expiryYear": "2023",
      "card_holder": "Test",
      "card_cvv": "123"
    };

    CashfreePGSDK.doPayment(inputParams).then(
      (value) => value?.forEach(
        (key, value) => log("$key : $value"),
      ),
    );
  }

  seamlessUPIPayment() {
    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl,
    };
    CashfreePGSDK.doUPIPayment(inputParams).then(
      (value) => value?.forEach(
        (key, value) => log("$key : $value"),
      ),
    );
  }
}
