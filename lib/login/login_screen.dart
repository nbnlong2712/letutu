import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letutu/base/widgets/base_button.dart';
import 'package:letutu/login/bloc/login_bloc.dart';
import 'package:letutu/routes/eroute.dart';
import 'package:letutu/screen/main_screen.dart';
import 'package:letutu/utils/utils.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../base/widgets/base_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: LoginWidget(),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  LoginBloc? loginBloc;
  LoginState? state;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of(context)..add(LoginStartEvent());
    state = loginBloc!.state;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BlocConsumer(
        bloc: loginBloc,
        listener: (context, state) {
          if (state is LoginCheckingState) {
            setState(() {
              loading = true;
            });
          } else {
            setState(() {
              loading = false;
            });
            if (state is LoginCheckFinishedState) {
              if (state.isCheckPass!) {
                Navigator.popAndPushNamed(context, Eroute.main);
              } else {
                Utils.showMyDialog(context, state.error!);
              }
            }
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: loading,
            child: Scaffold(
              body: Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/hahaha.jpg"), opacity: 0.8, fit: BoxFit.fill),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        alignment: Alignment.bottomLeft,
                        child: const Text(
                          "   Log in",
                          style: TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.15),
                              borderRadius: const BorderRadius.all(Radius.circular(30))),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.49,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: const Text(
                                    "\"Because she neva knows, vì cuộc sống luôn thay màu...\" - Vũ Cổ Nâu a.k.a Vũ Nhôm",
                                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              BaseTextField(
                                controller: emailController,
                                label: "Email",
                                hint: "Enter you email...",
                                prefixIcon: const Icon(Icons.person, color: Colors.orange),
                                inputType: TextInputType.emailAddress,
                                validator: (value) => "",
                                onSaved: (value) {},
                                obscureText: false,
                                fillColor: Colors.white,
                                outlineColor: Colors.orange,
                                floatingLabelColor: Colors.orange,
                                cursorColor: Colors.orange,
                                labelColor: Colors.orange,
                                outlineWidth: 1.2,
                                borderRadius: 10,
                              ),
                              BaseTextField(
                                controller: passwordController,
                                label: "Password",
                                hint: "Enter you password...",
                                prefixIcon: const Icon(Icons.password, color: Colors.orange),
                                inputType: TextInputType.visiblePassword,
                                validator: (value) => "",
                                onSaved: (value) {},
                                obscureText: true,
                                fillColor: Colors.white,
                                outlineColor: Colors.orange,
                                floatingLabelColor: Colors.orange,
                                cursorColor: Colors.orange,
                                labelColor: Colors.orange,
                                outlineWidth: 1.2,
                                borderRadius: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "\"Giọt nước mắt đã thôi không rơi nữa, có những vết đau rồi cũng đã lèng...\" - Vũ Cổ Nâu a.k.a Vũ Nhôm",
                                        style:
                                            TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "App dạy như lai thầng chưởng",
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.orangeAccent, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              BaseButton(
                                onPressed: () {
                                  if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                                    Utils.showMyDialog(context, "Please fill enough!");
                                  } else {}
                                },
                                label: const Text("Agree and Continue", style: TextStyle(fontSize: 22)),
                                textPadding: 90,
                                borderRadius: 10,
                                color: Colors.orangeAccent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: const Text(
                                "Đăng ký",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    decorationStyle: TextDecorationStyle.double),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
