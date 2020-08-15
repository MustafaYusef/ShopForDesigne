import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatefulWidget {
  AboutUsScreen({Key key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: InkWell(
                      onTap: () async {
                        await FlutterOpenWhatsapp.sendSingleMessage(
                            "+964" + "7717751582", "");
                      },
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Directionality(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      margin: EdgeInsets.only(left: 5),
                                      child: Image.asset(
                                          "assets/images/call.png")),
                                ),
                                Text(
                                  "07717751582",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ],
                            ),
                            textDirection: TextDirection.rtl,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: InkWell(
                      onTap: () async {
                        final Uri _emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'info@shopfordesign-iq.com',
                        );

// ...

// mailto:smith@example.com?subject=Example+Subject+%26+Symbols+are+allowed%21
                        launch(_emailLaunchUri.toString());
                      },
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Directionality(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      margin: EdgeInsets.only(left: 5),
                                      child: Image.asset(
                                          "assets/images/gmail.png")),
                                ),
                                Text(
                                  "info@shopfordesign-iq.com",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ],
                            ),
                            textDirection: TextDirection.rtl,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: InkWell(
                      onTap: () async {
                        var url = 'http://www.shopfordesign-iq.com/';

                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            universalLinksOnly: true,
                          );
                        } else {
                          throw 'There was a problem to open the url: $url';
                        }
                      },
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Directionality(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      margin: EdgeInsets.only(left: 5),
                                      child:
                                          Image.asset("assets/images/www.png")),
                                ),
                                Text(
                                  "الموقع الألكتروني",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ],
                            ),
                            textDirection: TextDirection.rtl,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: InkWell(
                      onTap: () async {
                        var url = 'https://www.facebook.com/shopfordesign/';

                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            universalLinksOnly: true,
                          );
                        } else {
                          throw 'There was a problem to open the url: $url';
                        }
                      },
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Directionality(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      margin: EdgeInsets.only(left: 5),
                                      child: Image.asset(
                                          "assets/images/facebook.png")),
                                ),
                                Text(
                                  "شوب فور دزاين",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ],
                            ),
                            textDirection: TextDirection.rtl,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: InkWell(
                      onTap: () async {
                        await MapsLauncher.launchCoordinates(
                            33.4091495, 44.3669584);
                      },
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Directionality(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      margin: EdgeInsets.only(left: 5),
                                      child: Icon(
                                        Icons.pin_drop,
                                        color: Colors.red[600],
                                        size: 40,
                                      )),
                                ),
                                Container(
                                  child: Expanded(
                                    child: Text(
                                      "الموقع على الخريطة",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[900],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            textDirection: TextDirection.rtl,
                          )),
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
}
