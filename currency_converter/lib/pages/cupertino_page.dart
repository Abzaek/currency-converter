import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Currency Converter',
          style: TextStyle(color: Color.fromRGBO(165, 160, 90, 1)),
        ),
        backgroundColor: CupertinoColors.black,
      ),
      child: Center(
        child: ColoredBox(
          color: const Color.fromRGBO(198, 76, 123, 0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ETB ${result.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CupertinoTextField(
                  controller: textEditingController,
                  onSubmitted: (String value) {
                    setState(() {
                      result = double.parse(textEditingController.text) * 100;
                    });
                  },
                  placeholder: 'Enter amount',
                  prefix: const Icon(CupertinoIcons.money_dollar),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      result = double.parse(textEditingController.text) * 100;
                    });
                  },
                  color: CupertinoColors.black,
                  child: const Text(
                    'Convert',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: AutofillHints.addressCity,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
