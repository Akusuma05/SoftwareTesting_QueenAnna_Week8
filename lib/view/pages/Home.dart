part of 'Pages.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _loginKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlemail = TextEditingController();
  final ctrlpas = TextEditingController();
  String _selectedGender = '';
  String? _selectedCity = '';

  final _city = [
    "Surabaya",
    "Jakarta",
    "Bandung",
    "Medan",
    "Ambon"
  ];

  _MyFormState(){
    _selectedCity = _city[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Stack(children: [
      Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: const Text(
                "Register",
                style: TextStyle(
                    color: Color.fromARGB(255, 40, 107, 53),
                    fontWeight: FontWeight.w900,
                    fontSize: 42),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: double.infinity,
              child: const Text(
                "Hi",
                style: TextStyle(
                  color: Color.fromARGB(255, 145, 145, 145),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Form(
                key: _loginKey,
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(labelText: "Name"),
                      controller: ctrlName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return value.toString().isEmpty
                            ? 'Please fill in the blank!'
                            : null;
                      },
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender", 
                        style: TextStyle(
                          fontSize: 16,
                        )
                      )
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      leading: Radio<String>(
                        value: 'male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                      title: const Text('Male'),
                    ),
                    ListTile(
                      leading: Radio<String>(
                        value: 'female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                      title: const Text('Female'),
                    ),
                    DropdownButtonFormField(
                      items: _city.map(
                        (e) => DropdownMenuItem(child: Text(e), value: e,)
                      ).toList(), 
                      onChanged: (value) {
                        setState(() {
                          _selectedCity = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down
                      ),
                      decoration: InputDecoration(
                        labelText: "City",
                        hintText: "Please select a city"
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                      controller: ctrlemail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return value.toString().isEmpty
                            ? 'Please fill in the blank!'
                            : null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      obscureText: true,
                      controller: ctrlpas,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return value.toString().isEmpty
                            ? 'Please fill in the blank!'
                            : null;
                      },
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (ctrlName.text.toString() == "" ||
                              ctrlpas.text.toString() == "" ||
                              ctrlemail.text.toString() == "") {
                            showDialog(
                                context: context,
                                builder: ((((context) {
                                  return AlertDialog(
                                    title: Text("There is an Error!"),
                                    content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Please fill in the blanks!"),
                                        ]),
                                  );
                                }))));
                          } else {
                            // if (InputData() != null) {
                            //   FlutterToast.showToast(
                            //       msg: "You Have Successfully Add an Item",
                            //       toastLength: Toast.LENGTH_LONG,
                            //       gravity: ToastGravity.BOTTOM,
                            //       backgroundColor: Colors.green,
                            //       textColor: Colors.white,
                            //       fontSize: 14);
                            // } else {
                            //   FlutterToast.showToast(
                            //       msg: "Failed to Add Item, try Again",
                            //       toastLength: Toast.LENGTH_LONG,
                            //       gravity: ToastGravity.BOTTOM,
                            //       backgroundColor: Colors.red,
                            //       textColor: Colors.white,
                            //       fontSize: 14);
                            // }
                          }
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 40, 107, 53),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    ]));
  }
}
