import 'package:flutter/material.dart';

import '../../../../shared/custom_input.dart';

class FarmInfo extends StatelessWidget {
  final TextEditingController businessName;
  final TextEditingController informalName;
  final TextEditingController adress;
  final TextEditingController city;
  final TextEditingController state;
  final TextEditingController zipCode;
  final GlobalKey formKey;
  const FarmInfo({
    super.key,
    required this.businessName,
    required this.informalName,
    required this.adress,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.formKey,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Farm Info',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 30),
        CustomFormInput(
          controller: businessName,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your business name';
            }
            return null;
          },
          keyBoardType: TextInputType.text,
          hintText: 'Business Name',
          prefixIcon: const Image(
            image: AssetImage('assets/images/businesss.png'),
            height: 20,
            width: 10,
          ),
        ),
        CustomFormInput(
          controller: informalName,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your informal name';
            }
            return null;
          },
          keyBoardType: TextInputType.text,
          hintText: 'Informal Name',
          prefixIcon: const Image(
            image: AssetImage('assets/images/name.png'),
            height: 20,
            width: 10,
          ),
        ),
        CustomFormInput(
          controller: adress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your address';
            }
            return null;
          },
          keyBoardType: TextInputType.text,
          hintText: 'Street Address',
          prefixIcon: const Image(
            image: AssetImage('assets/images/home.png'),
            height: 20,
            width: 10,
          ),
        ),
        CustomFormInput(
          controller: city,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your City';
            }
            return null;
          },
          keyBoardType: TextInputType.text,
          hintText: 'City',
          prefixIcon: const Image(
            image: AssetImage('assets/images/locations.png'),
            height: 20,
            width: 10,
          ),
        ),
        Row(
          children: [
            CustomFormInput(
              controller: state,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your State';
                }
                return null;
              },
              width: MediaQuery.of(context).size.width / 3,
              keyBoardType: TextInputType.text,
              hintText: 'State',
              suffixIcon: GestureDetector(
                onTap: () {},
                child: const Image(image: AssetImage("assets/images/drop.png")),
              ),
            ),
            const SizedBox(width: 10),
            CustomFormInput(
              controller: zipCode,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your zip code';
                }
                return null;
              },
              width: MediaQuery.of(context).size.width / 2,
              keyBoardType: TextInputType.text,
              hintText: 'Enter ZipCode',
            ),
          ],
        ),
        
      ],
    );
  }
}
