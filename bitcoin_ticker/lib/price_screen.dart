import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = "USD";

  DropdownButton<String> getAndroidDropDown() {
    List<DropdownMenuItem<String>> items = [];
    for (var element in currenciesList) {
      items.add(DropdownMenuItem(
        value: element,
        child: Text(element),
      ));
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: items,
      onChanged: (value) {
        print(value);
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker getIosPicker() {
    List<Text> items = [];
    for (var element in currenciesList) {
      items.add(Text(element));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedCurrency = items[index].data;
        });
      },
      children: items,
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return getIosPicker();
    } else {
      return getAndroidDropDown();
    }
  }

  List<CryptoCard> getCurrencies() {
    List<CryptoCard> cryptoCards = [];

    for (var crypto in cryptoList) {
      cryptoCards.add(CryptoCard(
        value: isWaiting ? "?" : coinValues[crypto]!,
        selectedCurrency: selectedCurrency!,
        cryptoCurrency: crypto,
      ));
    }
    return cryptoCards;
  }

  Map<String, String> coinValues = {};
  bool isWaiting = false;
  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency!);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: getCurrencies(),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  CryptoCard({
    required this.value,
    required this.selectedCurrency,
    required this.cryptoCurrency,
  });

  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
