import 'package:flutter/material.dart';

const lightBlue = Color(0XFF39d0cb);

class ActivationCodeUI extends StatelessWidget {
  ActivationCodeUI({Key? key}) : super(key: key);

  final List<String> numbers = [...List.generate(9, (index) => (index + 1).toString())];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFFf3fdfe),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Spacer(),
                    const FittedBox(
                      child: Text(
                        'ENTER CODE',
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please enter the code sent to your phone.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 2,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'The code will expire in ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '29s',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: lightBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TypedCodeItem(currentValue: '3'),
                        TypedCodeItem(isActive: true),
                        TypedCodeItem(),
                        TypedCodeItem(),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height * .5,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -1),
                    color: lightBlue.withOpacity(.1),
                    blurRadius: 3,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.spaceAround,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ...numbers.map((e) => KeyboardNumbers(number: e)).toList(),
                        GestureDetector(
                          onTap: () {
                            print('number');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            height: 60,
                            width: MediaQuery.of(context).size.width / 3.9,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('0');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            height: 60,
                            width: MediaQuery.of(context).size.width / 3.9,
                            child: const Center(
                              child: Text(
                                '0',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('number');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            height: 60,
                            width: MediaQuery.of(context).size.width / 3.9,
                            child: const Center(
                              child: Icon(
                                Icons.backspace_rounded,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: lightBlue,
                      side: const BorderSide(
                        color: lightBlue,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('RESEND CODE'),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KeyboardNumbers extends StatelessWidget {
  const KeyboardNumbers({
    Key? key,
    required this.number,
  }) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(number);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 60,
        width: MediaQuery.of(context).size.width / 3.9,
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class TypedCodeItem extends StatelessWidget {
  const TypedCodeItem({
    Key? key,
    this.isActive = false,
    this.currentValue,
  }) : super(key: key);

  final bool isActive;
  final String? currentValue;

  @override
  Widget build(BuildContext context) {
    if (currentValue != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(currentValue!),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isActive ? lightBlue : Colors.grey,
          ),
        ),
      ),
    );
  }
}
