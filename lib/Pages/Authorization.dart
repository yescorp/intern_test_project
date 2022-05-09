import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  var isButtonDisabled = true;

  void login(String? email, String? password) {
    if (validateEmail(email) && validatePassword(password)) {
      Navigator.pushReplacementNamed(context, "/main-page");
    }
  }

  bool validateEmail(String? email) {
    if (email == null) {
      return false;
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  bool validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 72,
              ),
              Center(
                child: Image.asset(
                  "lib/assets/logo.png",
                  width: 120,
                  height: 112,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                  child: Text(
                AppLocalizations.of(context)!.motto,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )),
              const SizedBox(
                height: 100,
              ),
              Text(
                AppLocalizations.of(context)!.loginHeader,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: email,
                onChanged: (String val) {
                  if (validateEmail(val) && validatePassword(password.text)) {
                    setState(() {
                      isButtonDisabled = false;
                    });
                  } else {
                    setState(() {
                      isButtonDisabled = true;
                    });
                  }
                },
                decoration: InputDecoration(
                    hintText:
                        AppLocalizations.of(context)!.emailTexfieldPlaceholder),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: password,
                obscureText: true,
                onChanged: (String? val) {
                  if (validateEmail(email.text) && validatePassword(val)) {
                    setState(() {
                      isButtonDisabled = false;
                    });
                  } else {
                    setState(() {
                      isButtonDisabled = true;
                    });
                  }
                },
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!
                        .passwordTextfieldPlaceholder),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: IgnorePointer(
                      ignoring: isButtonDisabled,
                      child: ElevatedButton(
                          style: isButtonDisabled
                              ? ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blueGrey))
                              : null,
                          onPressed: () {
                            login(email.text, password.text);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(
                                AppLocalizations.of(context)!.loginButtonText),
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
