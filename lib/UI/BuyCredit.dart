import 'package:ailatrieuphu/UI/Homepage.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class BuyCredit extends StatefulWidget {
  final User user;
  final double credit;
  const BuyCredit({super.key, required this.user, required this.credit});

  @override
  State<BuyCredit> createState() => _BuyCreditState();
}

class _BuyCreditState extends State<BuyCredit> {
  late String labelText = "Mua Credit";
  final FirebaseAuth auth = FirebaseAuth.instance;
  late User user;
  //tính số credit mua
  double _currentValue = 0;
  late double _credit;
  double sumCredit = 0;

  @override
  void initState() {
    // TODO: implement initState
    user = widget.user;
    _credit = widget.credit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kprimaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Slider(
              label: _currentValue.round().toString(),
              max: 5000,
              divisions: 10,
              value: _currentValue,
              onChanged: (value) => setState(() {
                _currentValue = value;
              }),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Số Credit muốn mua: ${_currentValue.round()}',
              style: const TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Số Credit hiện tại của bạn là: ${_credit.round()}',
              style: const TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: incorrect.withOpacity(0.7), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              onPressed: () {
                showDialogBuy(context);
              },
              child: const Text(
                'Mua Credit',
                style: TextStyle(color: white, fontSize: 16, letterSpacing: 2),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent.withOpacity(0.7), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                onPressed: () {
                  setState(() {
                    sumCredit = _credit;
                  });
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(user: user, credit: sumCredit)), (route) => false);
                },
                child: const Text(
                  'Trang Chủ',
                  style: TextStyle(color: white, fontSize: 16, letterSpacing: 2),
                ))
          ],
        ),
      ),
    );
  }

  void showDialogBuy(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: kprimaryColor,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 0),
                decoration: const BoxDecoration(
                  color: boldBlue,
                ),
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    labelText,
                    style: const TextStyle(
                      fontSize: 20,
                      color: white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Bạn muốn mua ',
                      style: TextStyle(color: white),
                    ),
                    TextSpan(
                      text: 'CREDIT?',
                      style: TextStyle(color: white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightBlue,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const Text('Hủy bỏ'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightBlue,
                    ),
                    onPressed: () {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Bạn đã mua ${_currentValue.round()} credit thành công',
                      );
                      setState(() {
                        labelText = "Tiếp tục mua Credit";
                        _credit += _currentValue;
                      });
                      // Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Mua',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
