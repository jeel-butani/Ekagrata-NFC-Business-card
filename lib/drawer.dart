import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:mu_card/editprofile.dart';
import 'package:mu_card/login/welcomemobile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'apiConnection/apiConnection.dart';

class DrawerMenu extends StatefulWidget {
  static int userId = 0;
  DrawerMenu({super.key, required userId}) {
    // ignore: prefer_initializing_formals
    DrawerMenu.userId = userId;
  }

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  String name = '';
  String phNum = '';
  String email = '';
  //final Uri _url = Uri.parse(
  //'https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox?compose=GTvVlcRwRfHrFNSpMdtFSwFPXMpzrRsKFNLcbtgGVNXbTGHBJqrttdhqmRPkdlMbSdQFndfLTmzdF');

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,
          Colors.grey,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(2.5, 2.5, 0, 2.5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 167, 167, 167)),
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(22, 76, 76, 76),
              ),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.chevron_left_sharp,
                  color: Color.fromARGB(255, 9, 0, 103),
                  size: 30,
                ),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.person_outline_rounded,
                      size: 58,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Text(
                        name,
                        style: const TextStyle(
                            color: Colors.indigoAccent,
                            fontFamily: 'Mooli',
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Text(
                        email,
                        style: const TextStyle(
                            color: Colors.indigoAccent,
                            fontFamily: 'Mooli',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Text(
                        phNum,
                        style: const TextStyle(
                            color: Colors.indigoAccent,
                            fontFamily: 'Mooli',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          checkRequest();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 20, 20, 20),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Get Your Card Now!',
                          style: TextStyle(
                              color: Colors.amberAccent,
                              fontSize: 15,
                              fontFamily: 'Mooli'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.off(() => EditProfile(
                          userId: DrawerMenu.userId,
                          name: name,
                          email: email,
                          phoneNum: phNum));
                    },
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: const Color.fromARGB(255, 13, 21, 24),
                    ),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mooli',
                          color: Color.fromARGB(255, 0, 2, 125)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: const Color.fromARGB(255, 13, 21, 24),
                    ),
                    child: const Text(
                      'Learn',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mooli',
                          color: Color.fromARGB(255, 0, 2, 125)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: const Color.fromARGB(255, 13, 21, 24),
                    ),
                    child: const Text(
                      'About us',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mooli',
                          color: Color.fromARGB(255, 0, 2, 125)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: const Color.fromARGB(255, 13, 21, 24),
                    ),
                    child: const Text(
                      'Contact',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mooli',
                          color: Color.fromARGB(255, 0, 2, 125)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: const Color.fromARGB(255, 13, 21, 24),
                    ),
                    child: const Text(
                      'FAQs',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mooli',
                          color: Color.fromARGB(255, 0, 2, 125)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('isLogin', false);
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        'Log Out successfullly',
                        style: TextStyle(fontFamily: 'Mooli', fontSize: 12),
                      )));
                      Get.offAll(() => const WelcomeMobile());
                    },
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      backgroundColor: const Color.fromARGB(255, 246, 0, 0),
                      elevation: 0,
                      shadowColor: const Color.fromARGB(255, 13, 21, 24),
                    ),
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Mooli',
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'App Version : XYZ',
                  style: TextStyle(
                      color: Colors.amber[900],
                      fontFamily: 'Mooli',
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    final apiUrl = '${API.getUserinfo}?id=${DrawerMenu.userId}';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          name = data['uName'];
          email = data['uEmail'];
          phNum = data['uPhone'];
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error: $e");
    }
  }

  void checkRequest() async {
    try {
      var res = await http.post(Uri.parse(API.checkCardRequest), body: {
        'userId': DrawerMenu.userId.toString(),
      });

      if (res.statusCode == 200) {
        var resBodyOfCheck = jsonDecode(res.body);
        if (resBodyOfCheck['userIdExistsWithRequest1']) {
          Fluttertoast.showToast(msg: "Please wait!! Request in process");
          print("Request in process");
        } else {
          requestSend();
        }
      } else {}
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void requestSend() async {
    try {
      var res = await http.post(Uri.parse(API.insertCardRequest), body: {
        'userId': DrawerMenu.userId.toString(),
      });
      if (res.statusCode == 200) {
        var resBodyOfInsert = jsonDecode(res.body);
        if (resBodyOfInsert['success']) {
          Fluttertoast.showToast(msg: "Request Sended");
        }
      } else {
        // ignore: avoid_print
        print(res.statusCode);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
