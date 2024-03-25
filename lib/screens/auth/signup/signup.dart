
import 'package:design/screens/auth/signup/signup_steps/business_hour.dart';
import 'package:design/screens/auth/signup/signup_steps/confirmation.dart';
import 'package:design/screens/auth/signup/signup_steps/farm_info.dart';
import 'package:design/screens/auth/signup/signup_steps/user_info.dart';
import 'package:design/screens/auth/signup/signup_steps/verification.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../../shared/custom_btn.dart';

class Signup extends StatefulWidget {
  static const String routeName = '/signup';
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confpassword = TextEditingController();
  final _userInfoformKey = GlobalKey<FormState>();

  TextEditingController businessName = TextEditingController();
  TextEditingController informalName = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  final _farmformKey = GlobalKey<FormState>();

  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  List<String> time = [
    "8:00am - 10:00am",
    "10:00am - 1:00pm",
    "1:00m - 4:00pm",
    "4:00pm - 7:00pm",
    "7:00pm - 10:00pm",
  ];

  // Map<String, bool> selectedDay;
  // days.forEach(e=>{
  //   seledDay[e]=false;
  // });

  Map<String, bool> selectedDay = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false
  };

  Map<String, bool> selectedTime = {
    "8:00am - 10:00am": false,
    "10:00am - 1:00pm": false,
    "1:00m - 4:00pm": false,
    "4:00pm - 7:00pm": false,
    "7:00pm - 10:00pm": false,
  };

  void setSelectedDayTime(event, value) {
    if (event == "day") {
      setState(() {
        selectedDay[value] = selectedDay[value] == true ? false : true;
      });
    } else if (event == "time") {
      setState(() {
        selectedTime[value] = selectedTime[value] == true ? false : true;
      });
    }
  }

  int pageNo = 1;

  @override
  void initState() {
    super.initState();
  }

  void togglePage(bool direction) {
    setState(() {
      if (direction) {
        pageNo++;
      } else if (pageNo > 0) {
        pageNo--;
      }
    });
  }

  List<String> fileNames = [];

  void uploadFile(name) {
    setState(() {
      fileNames.add(name);
    });
  }

  void removeFile(fileName) {
    setState(() {
      fileNames.remove(fileName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: pageNo == 1 ? _userInfoformKey : _farmformKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
              child: pageNo == 5
                  ? const Conformation()
                  : Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 1.18,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'FarmerEats',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 35),
                                Text(
                                  'Signup $pageNo / 4',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: ThemeColors.grey2),
                                ),
                                const SizedBox(height: 10),
                                if (pageNo == 1)
                                  UserInfo(
                                    email: email,
                                    name: name,
                                    phone: phone,
                                    password: password,
                                    confpassword: confpassword,
                                  ),
                                if (pageNo == 2)
                                  FarmInfo(
                                    businessName: businessName,
                                    informalName: informalName,
                                    adress: adress,
                                    city: city,
                                    state: state,
                                    zipCode: zipCode,
                                    formKey: _farmformKey,
                                  ),
                                if (pageNo == 3)
                                  Verification(
                                    fileNames: fileNames,
                                    uploadFile: uploadFile,
                                    removeFile: removeFile,
                                  ),
                                if (pageNo == 4)
                                  BusinessHours(
                                    days: days,
                                    time: time,
                                    selectedDay: selectedDay,
                                    selectedTime: selectedTime,
                                    setSelectedDayTime: setSelectedDayTime,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (pageNo == 1)
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            if (pageNo > 1 && pageNo < 5)
                              GestureDetector(
                                onTap: () {
                                  togglePage(false);
                                },
                                child: const Image(
                                  image: AssetImage('assets/images/back.png'),
                                ),
                              ),
                            CustomBtn(
                              onTap: () {
                                if (pageNo == 1) {
                                  if (!_userInfoformKey.currentState!
                                      .validate()) {
                                    return;
                                  }
                                }
                                if (pageNo == 2) {
                                  if (!_farmformKey.currentState!.validate()) {
                                    return;
                                  }
                                }
                                togglePage(true);
                              },
                              color: ThemeColors.primary,
                              width: MediaQuery.of(context).size.width / 2,
                              text: 'Continue',
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
