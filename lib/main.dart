import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        home: MyApp(),
      ),
    );

String orderId = "order_1950952I1bUkaYX4gZiBiPhnfNwq7ylca";
String stage = "TEST";
String orderAmount = "15.00";
String tokenData =
    "b89JCN4MzUIJiOicGbhJCLiQ1VKJiOiAXe0Jye.lwQfikzMykzNkdTY0ADOzYjI6ICdsF2cfJCLxYDM0QTOxcjNxojIwhXZiwiIS5USiojI5NmblJnc1NkclRmcvJCL1EjOiQnb19WbBJXZkJ3biwiIhNGb5dTc35kZuhGUpJUaadGNYlVYrVlYxkkM1kDM1kTMfJXZkJ3biojIklkclRmcvJye.srx9vItVYvjGD4MdL3mZloQNpN4CKvtN0-jMgII2x6yKg5ha7xA18qQFxUCO3K8knb";
String customerName = "Abhishek";
String orderNote = "Order_Note";
String orderCurrency = "INR";
String appId = "1950953d7e9231a3f1df2c9a69590591";
String customerPhone = "9638306280";
String customerEmail = "abhishek.p@codeshastra.com";
String notifyUrl = "https://test.gocashfree.com/notify";

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var _selectedApp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                child: const Text('WEB CHECKOUT'),
                onPressed: () => makePayment(),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text('SEAMLESS CARD'),
                onPressed: () => seamlessCardPayment(),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text('SEAMLESS NETBANKING'),
                onPressed: () => seamlessNetbankingPayment(),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text('SEAMLESS WALLET'),
                onPressed: () => seamlessWalletPayment(),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text('SEAMLESS UPI COLLECT'),
                onPressed: () => seamlessUPIPayment(),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text('SEAMLESS PAYPAL'),
                onPressed: () => seamlessPayPalPayment(),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text('UPI INTENT'),
                onPressed: () => makeUpiPayment(),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text('GET INSTALLED UPI APPS'),
                onPressed: () => getUPIApps(),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text('SEAMLESS UPI INTENT'),
                onPressed: () => seamlessUPIIntent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getUPIApps() {
    CashfreePGSDK.getUPIApps().then((value) => {
          if (value != null && value.isNotEmpty) {_selectedApp = value[0]}
        });
  }

  // WEB Intent
  makePayment() {
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
      "notifyUrl": notifyUrl
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
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

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
  }

  // SEAMLESS - NETBANKING
  Future<void> seamlessNetbankingPayment() async {
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
      "paymentOption": "nb",
      "paymentCode":
          "ENTER Code", // Find Code here https://docs.cashfree.com/docs/net-banking
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
  }

  // SEAMLESS - WALLET
  Future<void> seamlessWalletPayment() async {
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
      "paymentOption": "wallet",
      "paymentCode":
          "ENTER Code", // Find Code here https://docs.cashfree.com/docs/wallets
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
  }

  // SEAMLESS - UPI
  Future<void> seamlessUPIPayment() async {
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
      "paymentOption": "upi",
      "upi_vpa": "ENTER Correct UPI ID here"
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
  }

  // SEAMLESS - Paypal
  Future<void> seamlessPayPalPayment() async {
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
      "paymentOption": "paypal"
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
  }

  // UPI Intent
  Future<void> makeUpiPayment() async {
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
      "notifyUrl": notifyUrl
    };

    CashfreePGSDK.doUPIPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
  }

  // SEAMLESS UPI Intent
  Future<void> seamlessUPIIntent() async {
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

      // For seamless UPI Intent
      "appName": _selectedApp["id"]
    };

    CashfreePGSDK.doUPIPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
  }
}
