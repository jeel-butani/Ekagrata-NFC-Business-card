// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mu_card/createbusinessprofile.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:mu_card/showbusinessprofile.dart';
import 'apiConnection/apiConnection.dart';
import 'get_size.dart';

class Profiles extends StatefulWidget {
  static int userId = 0;
  Profiles({super.key, required int userId}) {
    // ignore: prefer_initializing_formals
    Profiles.userId = userId;
  }

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  List<Map<String, dynamic>> profiles = [];
  int activeIndex = -1;

  Future<void> createProfile() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  'Select Your Profile Type',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Mooli',
                  ),
                )),
              ),
              const Center(
                  child: Text(
                'Create your profile and start connecting',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Mooli',
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: getHeight(context, 0.075),
                                    width: getWidth(context, 0.15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.black),
                                    child: IconButton(
                                        onPressed: () {
                                          Get.to(CreateBusinessProfile(
                                              userId: Profiles.userId));
                                        },
                                        icon: const Icon(
                                          Icons.business_center,
                                          size: 40,
                                          color: Colors.white,
                                        )),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Text(
                                      'Business',
                                      style: TextStyle(
                                          fontFamily: 'Mooli', fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    FetchActiveProfile();
    FetchBusiness();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: profiles.isEmpty
                ? const Center(
                    // Display "No Profile Found" message when profiles list is empty
                    child: Text(
                      'No Profile Found',
                      style: TextStyle(
                          fontFamily: 'Mooli',
                          color: Color.fromARGB(255, 255, 17, 0),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: profiles.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          // ignore: prefer_const_constructors
                          leading: Icon(
                            Icons.business,
                            color: Colors.blue,
                            size: 40,
                          ),
                          title: Text(
                            profiles[index]['businessName'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Mooli',
                                fontWeight: FontWeight.w600),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              updateActiveProfile(
                                  int.parse(profiles[index]['businessId']));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: activeIndex ==
                                      int.parse(profiles[index]['businessId'])
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            child: const Text(
                              'Active',
                              style: TextStyle(
                                  fontFamily: 'Mooli',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                          onTap: () {
                            Get.to(() => ShowBusinessProfile(
                                businessId:
                                    int.parse(profiles[index]['businessId'])));
                          },
                        ),
                      );
                    },
                  ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: createProfile,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 20, 20, 20),
            foregroundColor: Colors.white,
          ),
          child: const Text(
            '+ Create Profile',
            style: TextStyle(
              color: Colors.amberAccent,
              fontSize: 20,
              fontFamily: 'Mooli',
            ),
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  void FetchBusiness() async {
    final apiUrl = '${API.getBusinessName}?userId=${Profiles.userId}';
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['businessData'] != null) {
          List<Map<String, dynamic>> extractedProfiles = [];
          for (var item in data['businessData']) {
            extractedProfiles.add({
              'businessId': item['businessId'].toString(),
              'businessName': item['businessName'].toString(),
            });
          }

          setState(() {
            profiles = extractedProfiles;
          });
        } else {
          print('No business names found for the user.');
        }
      } else {
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // ignore: non_constant_identifier_names
  void FetchActiveProfile() async {
    final apiUrl = '${API.getActiveProfile}?userId=${Profiles.userId}';
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          activeIndex = int.parse(data['business_id']);
        });
      } else {
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void updateActiveProfile(int businessId) async {
    var res = await http.post(
      Uri.parse(API.updateActiveProfile),
      body: {
        "userId": Profiles.userId.toString(),
        "businessId": businessId.toString()
      },
    );

    if (res.statusCode == 200) {
      var resBodyOfUpdate = jsonDecode(res.body);
      if (resBodyOfUpdate['success']) {
        FetchActiveProfile();
      } else {
        print("Update Failed");
      }
    }
  }
}
