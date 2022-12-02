import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TankOp extends StatefulWidget {
  const TankOp({Key key}) : super(key: key);
  @override
  _TankOpState createState() => _TankOpState();
}

class _TankOpState extends State<TankOp> {
  // For at kontroller hvad user skriver
  final _textController = TextEditingController();

  double userBalance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // vise balance
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    userBalance.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),

            // Text input
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]'),
                ),
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type here your balance!',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),

            // Add button
            MaterialButton(
              onPressed: () {
                // opdaterer vores balance når man trykker på add
                setState(() {
                  userBalance += double.parse(_textController.text);
                });
              },
              color: Colors.blue,
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
