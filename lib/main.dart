import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  Future<bool> listenForPayment(String orderID) async {
    final nav = Navigator.of(context);
    var headers = {
      'Accept': 'application/json',
      'x-api-version': '2022-01-01',
      'x-client-id': '1950953d7e9231a3f1df2c9a69590591',
      'x-client-secret': '21670a53a5bd9568b36cacfd8b7db6cce9446544'
    };
    var request = http.Request('GET',
        Uri.parse('https://sandbox.cashfree.com/pg/orders/$orderID/payments'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final data = await response.stream.bytesToString();
    print(data);

    if (response.statusCode == 200) {
      final paymentStatusReceived = (json.decode(data) as List)
          .where((e) => e["payment_status"] == "SUCCESS");
      if (paymentStatusReceived.isNotEmpty) {
        nav.push(
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text('Result'),
              ),
              body: Text(paymentStatusReceived.first.toString()),
            ),
          ),
        );
        return true;
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }

  void doPayment() async {
    var headers = {
      'Content-Type': 'application/json',
      'x-api-version': '2022-01-01',
      'Accept': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('https://sandbox.cashfree.com/pg/orders/pay'));
    request.body = json.encode({
      "order_token": "TQ4TvAPntcaGaNbgdzRb",
      "payment_method": {
        "card": {
          "channel": "link",
          "card_number": "4706131211212123",
          "card_holder_name": "Abhishek Patil",
          "card_expiry_mm": "07",
          "card_expiry_yy": "23",
          "card_cvv": "123"
        }
      },
      "save_instrument": true
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      final paymentURL = json.decode(data)['data']['url'];
      print(data);
      print(paymentURL);
      // _launchUrl(paymentURL);
      bool isDone = false;
      while (!isDone) {
        log('Waiting for 2 seconds');
        await Future.delayed(const Duration(seconds: 2));
        isDone =
            await listenForPayment('order_1950952I2GrdaRnTKoXGhcqXSiyMM1nEr');
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cashfree SDK Sample'),
        ),
        body: Column(
          children: const [
            Text('hi'),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Make Payment'),
          onPressed: doPayment,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
