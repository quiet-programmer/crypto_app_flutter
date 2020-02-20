
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final List currencies;
  Home(this.currencies);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List currencies;

  final List<MaterialColor> _colors = [Colors.blue, Colors.red, Colors.indigo];


  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
            itemCount: widget.currencies.length,
            itemBuilder: (_, index) {
              final Map currency = widget.currencies[index];
              final MaterialColor color = _colors[index % _colors.length];
              return _getListItemUi(currency, color);
            },
          )),
        ],
      ),
    );
  }

  Widget _getListItemUi(Map currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title: Text(
        currency['name'],
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(
        currency['price_usd'],
        currency['percent_change_1h'],
      ),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = TextSpan(
        text: "\$$priceUSD\n",
        style: TextStyle(
          color: Colors.black,
        ));

    String percentageChangeText = "1 hour: $percentageChange%";

    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: TextStyle(color: Colors.green),
      );
    } else {
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: TextStyle(color: Colors.red),
      );
    }

    return RichText(
      text: TextSpan(
        children: [priceTextWidget, percentageChangeTextWidget],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto App Demo"),
      ),
      body: _cryptoWidget() ?? CircularProgressIndicator(),
    );
  }
}
