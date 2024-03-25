
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';

class Verification extends StatefulWidget {
  final List<String> fileNames;
  final Function uploadFile;
  final Function removeFile;

  const Verification({
    super.key,
    required this.fileNames,
    required this.uploadFile,
    required this.removeFile,
  });

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  Future<void> _pickFile() async {
    FilePickerResult? file = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);
    if (file != null) {
      String filename = file.files.first.name;

      widget.uploadFile(filename);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Verification',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          "Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ThemeColors.grey2),
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            _pickFile();
          },
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "Attach proof of registration",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ThemeColors.black),
                ),
              ),
              Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: ThemeColors.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Image(
                      image: AssetImage("assets/images/camera.png"))),
            ],
          ),
        ),
        const SizedBox(height: 50),
        if (widget.fileNames.isNotEmpty)
          Column(
            children: widget.fileNames.map((fileName) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: ThemeColors.grey2,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            fileName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ThemeColors.black,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              widget.removeFile(fileName);
                            },
                            child: const Image(
                                image: AssetImage("assets/images/cross.png"))),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
