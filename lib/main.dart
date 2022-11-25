import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    //Replace with actual values
    String orderId = "ORDER_ID";
    String stage = "PROD";
    String orderAmount = "ORDER_AMOUNT";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "APP_ID";
    String customerPhone = "Customer Phone";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";

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
    String orderId = "order_1950952I1YUlOHRNZPpTVVNZMMJx0qeW7";
    String stage = "TEST";
    String orderAmount = "15";
    String tokenData =
        "px9JCN4MzUIJiOicGbhJCLiQ1VKJiOiAXe0Jye.vsQfiQDMjJTY0IGN0ADOzYjI6ICdsF2cfJCLwgTNyQTOxcjNxojIwhXZiwiIS5USiojI5NmblJnc1NkclRmcvJCL1EjOiQnb19WbBJXZkJ3biwiI3cVZxBDeK1UTa5kVWRFcQplTSh0TsVVWxkkM1kDM1kTMfJXZkJ3biojIklkclRmcvJye.khY9qdJzWklh1tP2CHkgRKYqELY6SPs-vju3AnqVv0Hp6eDDFDxarDuzCMgxpQNWcX";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "1950953d7e9231a3f1df2c9a69590591";
    String customerPhone = "9638306280";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";

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
    String orderId = "ORDER_ID";
    String stage = "PROD";
    String orderAmount = "ORDER_AMOUNT";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "APP_ID";
    String customerPhone = "Customer Phone";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";

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
    String orderId = "ORDER_ID";
    String stage = "PROD";
    String orderAmount = "ORDER_AMOUNT";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "APP_ID";
    String customerPhone = "Customer Phone";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";

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
    String orderId = "ORDER_ID";
    String stage = "PROD";
    String orderAmount = "ORDER_AMOUNT";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "APP_ID";
    String customerPhone = "Customer Phone";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";

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
    String orderId = "ORDER_ID";
    String stage = "PROD";
    String orderAmount = "ORDER_AMOUNT";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "APP_ID";
    String customerPhone = "Customer Phone";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";

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
    //Replace with actual values
    String orderId = "order_1950952I1YpPbFLzYefkl19G6dKmj8Qhs";
    String stage = "TEST";
    String orderAmount = "15";
    String tokenData =
        "dL9JCN4MzUIJiOicGbhJCLiQ1VKJiOiAXe0Jye.N7QfiE2N1MmNmZTN0ADOzYjI6ICdsF2cfJCL3YzNyQTOxcjNxojIwhXZiwiIS5USiojI5NmblJnc1NkclRmcvJCL1EjOiQnb19WbBJXZkJ3biwiIzhWU4oWbLRmNHlTMstmZllleMZkYQBXWxkkM1kDM1kTMfJXZkJ3biojIklkclRmcvJye.NWT3eOh2Pjlig06ee85im8t4gbEvKk32Zg8GDxorOgG8bQcYGjB3dNFza26E8hag7a";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "1950953d7e9231a3f1df2c9a69590591";
    String customerPhone = "Customer Phone";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";

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
    //Replace with actual values
    String orderId = "order_1950952I1YpPbFLzYefkl19G6dKmj8Qhs";
    String stage = "TEST";
    String orderAmount = "15";
    String tokenData =
        "9N9JCN4MzUIJiOicGbhJCLiQ1VKJiOiAXe0Jye.CHQfiYWYhZmMjZzM0ADOzYjI6ICdsF2cfJCLyUjMyQTOxcjNxojIwhXZiwiIS5USiojI5NmblJnc1NkclRmcvJCL1EjOiQnb19WbBJXZkJ3biwiI2pmN5JUQ4JXV0EGeG5UezQnUMpmN4oGWxkkM1kDM1kTMfJXZkJ3biojIklkclRmcvJye.bmpWVAlEHcMwvxTFgneKB4uM5Cf8heL5yGqKIN-EayTTxXkLzNRqaCXvWpfegIpueL";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "1950953d7e9231a3f1df2c9a69590591";
    String customerPhone = "Customer Phone";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";

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
