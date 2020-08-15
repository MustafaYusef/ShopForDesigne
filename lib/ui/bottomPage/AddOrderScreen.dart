import 'package:Shope_desgine/blocs/makeOrderBloc.dart';
import 'package:Shope_desgine/models/sendFeedbackBody.dart';
import 'package:Shope_desgine/repastory/repastory.dart';
import 'package:Shope_desgine/ui/custumUi/circularProgress.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class AddOrderScreen extends StatefulWidget {
  AddOrderScreen({Key key}) : super(key: key);

  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  TextEditingController name = TextEditingController();

  TextEditingController content = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) {
            return FeedbackBloc(Repo: Repastory());
          },
          child: Container(
            margin: EdgeInsets.only(top: 30),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Directionality(
                    child: Container(
                      padding: EdgeInsets.only(top: 50),
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.blueAccent,
                          primaryColorDark: Colors.red,
                        ),
                        child: TextField(
                          controller: name,
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 20),
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                              ),
                              hoverColor: Colors.amber,
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              hintText: "",
                              alignLabelWithHint: true,
                              labelText: "الأسم الكامل",
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  backgroundColor: Colors.transparent,
                                  decorationColor: Colors.transparent),
                              prefixIcon: const Icon(Icons.person),
                              helperText: "يرجى ادخال الأسم الكامل",
                              contentPadding: EdgeInsets.only(
                                  left: 6, right: 6, top: 0, bottom: 15),
                              fillColor: Colors.white70),
                        ),
                      ),
                    ),
                    textDirection: TextDirection.rtl),
                Directionality(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.blueAccent,
                          primaryColorDark: Colors.red,
                        ),
                        child: TextField(
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          maxLength: 11,
                          style: TextStyle(fontSize: 20),
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                              ),
                              hoverColor: Colors.amber,
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              hintText: "",
                              alignLabelWithHint: true,
                              labelText: "رقم الهاتف",
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  backgroundColor: Colors.transparent,
                                  decorationColor: Colors.transparent),
                              prefixIcon: Icon(Icons.phone),
                              helperText: "يرجى ادخال رقم صحيح",
                              contentPadding: EdgeInsets.only(
                                  left: 6, right: 6, top: 0, bottom: 15),
                              fillColor: Colors.white70),
                        ),
                      ),
                    ),
                    textDirection: TextDirection.rtl),
                Directionality(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.blueAccent,
                          primaryColorDark: Colors.red,
                        ),
                        child: TextField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: 20),
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                              ),
                              hoverColor: Colors.amber,
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              hintText: "",
                              alignLabelWithHint: true,
                              labelText: "البريد الألكتروني",
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  backgroundColor: Colors.transparent,
                                  decorationColor: Colors.transparent),
                              prefixIcon: const Icon(Icons.email),
                              helperText: "يرجى ادخال البريد الألكتروني ",
                              contentPadding: EdgeInsets.only(
                                  left: 6, right: 6, top: 0, bottom: 15),
                              fillColor: Colors.white70),
                        ),
                      ),
                    ),
                    textDirection: TextDirection.rtl),
                Directionality(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.blueAccent,
                          primaryColorDark: Colors.red,
                        ),
                        child: TextField(
                          controller: content,
                          maxLines: 4,
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(fontSize: 20),
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                              ),
                              hoverColor: Colors.amber,
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              hintText: "",
                              alignLabelWithHint: true,
                              labelText: "تفاصيل الطلب",
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  backgroundColor: Colors.transparent,
                                  decorationColor: Colors.transparent),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(bottom: 65),
                                child: Icon(Icons.details),
                              ),
                              helperText: "يرجى ادخال التفاصيل الخاصة بطلبك",
                              contentPadding: EdgeInsets.only(
                                  left: 6, right: 6, top: 0, bottom: 15),
                              fillColor: Colors.white70),
                        ),
                      ),
                    ),
                    textDirection: TextDirection.rtl),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    width: 100,
                    height: 40,
                    child: BlocBuilder<FeedbackBloc, FeedbackState>(
                      builder: (context, state) {
                        if (state is FeedbackUninitialized) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: RaisedButton(
                              color: Theme.of(context).primaryColor,
                              elevation: 5,
                              onPressed: () {
                                if (name.text.isNotEmpty &&
                                    phone.text.isNotEmpty &&
                                    email.text.isNotEmpty &&
                                    content.text.isNotEmpty) {
                                  if (phone.text.length == 11) {
                                    if (EmailValidator.validate(email.text)) {
                                      SendFeedbackBody body = SendFeedbackBody(
                                          name: name.text,
                                          email: email.text,
                                          body: content.text,
                                          phone: phone.text);
                                      BlocProvider.of<FeedbackBloc>(context)
                                          .add(SendFeedback(body,
                                              context: context));
                                    } else {
                                      Toast.show(
                                          "يرجى ادخال بريد الكتروني صحيح",
                                          context,
                                          duration: Toast.LENGTH_LONG,
                                          gravity: Toast.BOTTOM);
                                    }
                                  } else {
                                    Toast.show(
                                        "يرجى أدخال رقم هاتف صحيح", context,
                                        duration: Toast.LENGTH_LONG,
                                        gravity: Toast.BOTTOM);
                                  }
                                } else {
                                  Toast.show("يرجى أكمال جميع الحقول", context,
                                      duration: Toast.LENGTH_LONG,
                                      gravity: Toast.BOTTOM);
                                }
                              },
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text("أرسال",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              ),
                            ),
                          );
                        }
                        if (state is SendingFeedback) {
                          return Container(
                              child: Container(
                                  width: 30, child: circularProgress())
                                  );
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
