import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Metrics Converter',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _metrics = ["", "km", "m", "cm"];
  String? from;
  String? to;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _numberController = TextEditingController();
  String convertedStr = "";
  double fromNum = 0;

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (_) => _focusNode.unfocus(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text("Metrics Converter",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: Column(children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Number:",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  SizedBox(
                      height: 50,
                      width: 150,
                      child: TextField(
                        focusNode: _focusNode,
                        controller: _numberController,
                        onChanged: (inputednum) {
                          setState(() {
                            var rangeAmount = double.tryParse(inputednum);
                            if (rangeAmount == null) {
                              fromNum = 0;
                            } else {
                              fromNum = rangeAmount;
                            }
                          });
                        },
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            fillColor: Colors.blue,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30))),
                        keyboardType: TextInputType.number,
                      )),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade200, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 50),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("From:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.blue.shade200),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: from,
                                    iconEnabledColor: Colors.blue,
                                    borderRadius: BorderRadius.circular(35),
                                    style: const TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                    selectedItemBuilder: (_) => _metrics
                                        .map((i) => Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(i,
                                                  style: const TextStyle(
                                                      color: Colors.blue)),
                                            )))
                                        .toList(),
                                    items: _metrics
                                        .map((i) => DropdownMenuItem<String>(
                                              value: i,
                                              child: Text(i),
                                            ))
                                        .toList(),
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        from = value;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("To:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.blue.shade200),
                                    borderRadius: BorderRadius.circular(35)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    //dropdownColor: Colors.white,
                                    value: to,
                                    iconEnabledColor: Colors.blue,
                                    borderRadius: BorderRadius.circular(35),
                                    style: const TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                    selectedItemBuilder: (_) => _metrics
                                        .map((i) => Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(i,
                                                  style: const TextStyle(
                                                      color: Colors.blue)),
                                            )))
                                        .toList(),
                                    items: _metrics
                                        .map((i) => DropdownMenuItem<String>(
                                              value: i,
                                              child: Text(i),
                                            ))
                                        .toList(),
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        to = value;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Result:",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: Colors.blue,
                      width: 150,
                      height: 50,
                      child: Center(
                          child: Text(convertedStr,
                              style: const TextStyle(color: Colors.white))),
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  child: const Text('CONVERSION'),
                  onPressed: () {
                    setState(() {
                      convertedStr = ConvertHelpers()
                          .convertMethod(from, to, fromNum)
                          .toString();
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  child: const Text('RESET'),
                  onPressed: () {
                    setState(() {
                      _focusNode.unfocus();
                      from = null;
                      to = null;
                      _numberController.clear();
                      convertedStr = "";
                      fromNum = 0;
                    });
                  },
                ),
              ),
            ),
          ]),
        ));
  }
}

class ConvertHelpers {
  double? convertMethod(String? from, String? to, double amount) {
    if (from == to) {
      return amount;
    } else if (from == "" && (to == "km" || to == "m" || to == "cm")) {
      return 0;
    } else if ((from == "km" || from == "m" || from == "cm") && to == "") {
      return amount;
    } else if (from == "km" && to == "m") {
      return amount * 1000;
    } else if (from == "km" && to == "cm") {
      return amount * 100000;
    } else if (from == "m" && to == "cm") {
      return amount * 100;
    } else if (from == "m" && to == "km") {
      return amount / 1000;
    } else if (from == "cm" && to == "m") {
      return amount / 100;
    } else if (from == "cm" && to == "km") {
      return amount / 100000;
    }
  }
}
