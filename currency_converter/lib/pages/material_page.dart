import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConverterMaterialPage extends StatefulWidget {
  const ConverterMaterialPage({super.key});
  @override
  State<ConverterMaterialPage> createState() {
    return _MymaterialPage();
  }
}

class _MymaterialPage extends State<ConverterMaterialPage> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        style: BorderStyle.solid,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Currency Converter',
          style: TextStyle(color: Color.fromRGBO(165, 160, 90, 1)),
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Center(
        child: ColoredBox(
          color: const Color.fromRGBO(198, 76, 123, 0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$result ETB',
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: textEditingController,
                  onSubmitted: (String value) {
                    setState(() {
                      result = double.parse(textEditingController.text) * 100;
                    });
                  },
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    hintText: ' amount',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(Icons.monetization_on),
                    filled: true,
                    fillColor: Color.fromRGBO(100, 30, 0, 0.2),
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = double.parse(textEditingController.text) * 100;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 20,
                    backgroundColor: Colors.black87,
                    minimumSize: const Size(double.infinity, 60),
                    foregroundColor: Colors.white70,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
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
