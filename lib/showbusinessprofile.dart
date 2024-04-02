// ignore_for_file: prefer_const_constructors, avoid_print
import 'dart:convert';

import 'package:get/get.dart'; 
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mu_card/apiConnection/apiConnection.dart';

class ShowBusinessProfile extends StatefulWidget {
  static int businessId = 0;
  ShowBusinessProfile({super.key, required int businessId}) {
    // ignore: prefer_initializing_formals
    ShowBusinessProfile.businessId = businessId;
  }

  @override
  State<ShowBusinessProfile> createState() => _ShowBusinessProfileState();
}

class _ShowBusinessProfileState extends State<ShowBusinessProfile>
    with SingleTickerProviderStateMixin {
  String company = '';
  String industry = '';
  String contact = '';
  String email = '';
  String image = '';
  String name = '';
  String designation = '';
  String addBio = '';
  String addServices = '';
  String whatAppNo = '';
  String messenger = '';
  String address = '';
  String website = '';
  String driveLink = '';
  String document = '';
  String cloudLink = '';
  String skype = '';
  String twitter = '';
  String instagram = '';
  String linkedin = '';
  String facebook = '';
  String gpay = '';
  String paytm = '';
  String education = '';
  String experience = '';
  String hobbies = '';
  String info = '';
  String createdAt = '';
  String updatedAt = '';
  int status = 0;
  int userIdIndex = 0;

  @override
  void initState() {
    super.initState();
    print(ShowBusinessProfile.businessId);
    fetchBusinessProfile();
  }
  
  @override
  Widget build(BuildContext context) {
    //contact
    Future<void> showContacts() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Contacts',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: Text(
                      contact,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1.1,
                        fontFamily: 'Mooli',
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
    }

    //emails
    Future<void> showEmails() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Emails',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: Text(
                      email,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1.1,
                        fontFamily: 'Mooli',
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
    }

    //bio menu
    Future<void> addbio() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Bio',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: Text(
                      addBio,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1.1,
                        fontFamily: 'Mooli',
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
    }

    //edu menu
    Future<void> addedu() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Education',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: Text(
                      education,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1.1,
                        fontFamily: 'Mooli',
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
    }

    //exp menu
    Future<void> addExp() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Experience',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: Text(
                      experience,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1.1,
                        fontFamily: 'Mooli',
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
    }

    //hobby menu
    Future<void> addhobby() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Hobby',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: Text(
                      hobbies,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1.1,
                        fontFamily: 'Mooli',
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
    }

    //info menu
    Future<void> addinfo() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Info',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: Text(
                      info,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1.1,
                        fontFamily: 'Mooli',
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
    }

    //services menu
    Future<void> addservices(context) async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Services',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: Text(
                      addServices,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1.1,
                        fontFamily: 'Mooli',
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
    }

    //address menu
    Future<void> addAddress(context) async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Address',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Text(
                  address,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: 1.1,
                    fontFamily: 'Mooli',
                  ),
                ),
              ],
            );
          });
    }

    //whatsapp add
    Future<void> addwhatsapp() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'WhatsApp',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: Text(whatAppNo),
                  ),
                ),
              ],
            );
          });
    }

    //instagram add
    Future<void> addInstagram() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Instagram',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: Text(instagram),
                  ),
                ),
              ],
            );
          });
    }

    //Facebook add
    Future<void> addFacebook() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Facebook',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: Text(facebook),
                  ),
                ),
              ],
            );
          });
    }

    //linkedin add
    Future<void> addLinkedin() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'LinkedIn',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    // height: 50,
                    child: Text(linkedin),
                  ),
                ),
              ],
            );
          });
    }

    //Twitter add
    Future<void> addTwitter() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Twitter',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                      // height: 50,
                      child: Text(twitter)),
                ),
              ],
            );
          });
    }

    //skype add
    Future<void> addSkype() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Skype',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                      // height: 50,
                      child: Text(skype)),
                ),
              ],
            );
          });
    }

    //gpay add
    Future<void> addGpay() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'GPay',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                      // height: 50,
                      child: Text(gpay)),
                ),
              ],
            );
          });
    }

    //paytm add
    Future<void> addPaytm() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Paytm',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                      // height: 50,
                      child: Text(paytm)),
                ),
              ],
            );
          });
    }

    //website add
    Future<void> addWebsite() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Website',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                      // height: 50,
                      child: Text(website)),
                ),
              ],
            );
          });
    }

    //drive add
    Future<void> addDrive() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Drive',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                      // height: 50,
                      child: Text(driveLink)),
                ),
              ],
            );
          });
    }

    //document add
    Future<void> addDocument() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Document',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                      // height: 50,
                      child: Text(document)),
                ),
              ],
            );
          });
    }

    //website add
    Future<void> addCloud() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Cloud',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                      // height: 50,
                      child: Text(cloudLink)),
                ),
              ],
            );
          });
    }

    //messenger add
    Future<void> addMessenger() async {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // title: const Text('Select Booking Type'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          'Messenger',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 15, 178),
                              fontFamily: 'Mooli',
                              fontSize: 24),
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                      // height: 50,
                      child: Text(messenger)),
                ),
              ],
            );
          });
    }

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        // stops: [0.5, 0.5],
        colors: const [
          Color.fromARGB(255, 114, 114, 114),
          Colors.white,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Business Profile',
            style: TextStyle(
                fontFamily: 'Mooli',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: const [
                    Color.fromARGB(255, 208, 211, 211),
                    Color.fromARGB(255, 255, 255, 255),
                  ]),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // color: Colors.black87,
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: const [
                        Color.fromARGB(82, 72, 81, 82),
                        Color.fromARGB(197, 105, 164, 164)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(21, 12, 21, 8),
                        child: ClipOval(
                          //no need to provide border radius to make circular image
                          child: CircleAvatar(
                            radius: 50,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/guest.png',
                                fit: BoxFit.cover,
                                height: 200,
                                width: 200,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            designation,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            company,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            industry,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 40,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      addbio();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      'Bio',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Mooli'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 40,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      addAddress(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      'Address',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Mooli'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 40,
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      addservices(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      'Services',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Mooli'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 15, 2, 5),
                child: Text(
                  'Phone messenger & Emails',
                  style: TextStyle(
                      fontFamily: 'Mooli',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        showContacts();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.call,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Contact',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        showEmails();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.email,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Email ID',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addwhatsapp();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.whatsapp,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Whatsapp',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addMessenger();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.facebookMessenger,
                              size: 42,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            'Messenger',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 15, 2, 5),
                child: Text(
                  'Website & Links',
                  style: TextStyle(
                      fontFamily: 'Mooli',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addWebsite();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.earthAsia,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Website',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addDrive();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.googleDrive,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Drive Link',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addDocument();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.edit_document,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Document',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addCloud();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.cloud,
                              size: 42,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            'Cloud Link',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 15, 2, 5),
                child: Text(
                  'Social Media',
                  style: TextStyle(
                      fontFamily: 'Mooli',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addSkype();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.skype,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Skype',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addTwitter();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Twitter',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addLinkedin();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.linkedin,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'LinkedIn',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addFacebook();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              size: 42,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            'Facebook',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addInstagram();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.instagram,
                              size: 42,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            'Instagram',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 15, 2, 5),
                child: Text(
                  'Payment',
                  style: TextStyle(
                      fontFamily: 'Mooli',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addGpay();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.googlePay,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'GPay',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addPaytm();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.paypal,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Paytm',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 15, 2, 5),
                child: Text(
                  'Other Information',
                  style: TextStyle(
                      fontFamily: 'Mooli',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addedu();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.graduationCap,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Education',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addExp();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.certificate,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Experience',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addhobby();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.puzzlePiece,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Hobbies',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        addinfo();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.info,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Info',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchBusinessProfile() async {
    final apiUrl =
        '${API.fetchBusinessDetails}?id=${ShowBusinessProfile.businessId}';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data['data']['profileId']);
        setState(() {
          company = data['data']['company'];
          industry = data['data']['industry'];
          contact = data['data']['contact'];
          email = data['data']['email'];
          //'image': data['data']['image']
          name = data['data']['name'];
          designation = data['data']['designation'];
          addBio = data['data']['add_bio'];
          addServices = data['data']['add_services'];
          whatAppNo = data['data']['whatApp_no'];
          messenger = data['data']['messenger'];
          address = data['data']['address'];
          website = data['data']['website'];
          driveLink = data['data']['drivelink'];
          document = data['data']['document'];
          cloudLink = data['data']['cloud_link'];
          skype = data['data']['skype'];
          twitter = data['data']['twitter'];
          instagram = data['data']['instagram'];
          linkedin = data['data']['linkedin'];
          facebook = data['data']['facebook'];
          gpay = data['data']['gpay'];
          paytm = data['data']['paytm'];
          education = data['data']['education'];
          experience = data['data']['experience'];
          hobbies = data['data']['hobbies'];
          info = data['data']['info'];
          //status = data['data']['status'];
          //userIdIndex = data['data']['user_id'];
        });
      } else {
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  
}
