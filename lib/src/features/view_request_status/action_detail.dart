import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../app_configs/custom_style.dart';
import '../../common_widgets/paint_custom/custom_normal_container.dart';
import '../../themes/custom_text_style.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class ActionDetail extends StatefulWidget {
  const ActionDetail({super.key});


  @override
  State<ActionDetail> createState() => _ActionDetailState();
}

class _ActionDetailState extends State<ActionDetail> {
  String? _selectedActionStatus;
  DateTime? _selectedDate;
  String? _dateText;
  String? _impactDescription;
  File? _uploadedFile;

  Size? screen_size;
  @override

  Widget build(BuildContext context) {
    screen_size=MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomNormalContainer(
          child: Align(
            alignment: Alignment.topLeft,
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image and Heading
                Row(
                  children: [
                    Image.asset('assets/images/action.png'),
                    const SizedBox(width: 10.0),
                    Text('Action', style: CustomTextSty.mTextStyle13),
                  ],
                ),

                // Action Status and Options
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Action Status', style:CustomTextSty.mTextStyle14),

                      // Options
                      Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 24, // adjust the width to your desired value
                                height: 24, // adjust the height to your desired value
                                child: Radio(
                                  value: 'Pending',
                                  groupValue: _selectedActionStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedActionStatus = value;
                                    });
                                  },
                                ),
                              ),
                              Text('Pending for action'),
                            ],
                          ),
                          const SizedBox(width: 20.0),
                          Row(
                            children: [
                              SizedBox(
                                width: 24, // adjust the width to your desired value
                                height: 24, // adjust the height to your desired value
                                child: Radio(
                                  value: 'Complete',
                                  groupValue: _selectedActionStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedActionStatus = value;
                                    });
                                  },
                                ),
                              ),
                              Text('Complete for action'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Target Date
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Target Date',
                        style: CustomTextSty.mTextStyle14,
                      ),
                      Container(
                        width: 386, // adjust the width to your desired value
                        child: TextFormField(
                          readOnly: true,
                          controller: TextEditingController(text: _dateText),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Image(
                              image: AssetImage('assets/images/calendar_month.png'),
                              width: 18, // adjust the width of the image
                              height: 20, // adjust the height of the image
                            ),
                            hintText: 'Select target date',
                          ),
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030),
                            );
                            if (date != null) {
                              setState(() {
                                _selectedDate = date;
                                _dateText = DateFormat('dd MMM yyyy').format(date);
                              });
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),

                // Impact Description and Upload Picture
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),

                  child: (screen_size!.width>600)?Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Impact Description
                      Expanded(
                        child: LeftContainer(),
                      ),
                 // const SizedBox(width: 10.0),

                      // Upload Picture
                      Expanded(
                        child: rightContainer(),
                      ),
                    ],
                  ):Column(
                    children: [
                      LeftContainer(),

                      rightContainer()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LeftContainer()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Impact Description', style:CustomTextSty.mTextStyle14),
      Container(
        width: 386,
        height: 96,
        child: TextFormField(
          maxLines: 4,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter impact description',
          ),
          onChanged: (value) {
            setState(() {
              _impactDescription = value;
            });
          },
        ),
      ),
    ],
  );

  rightContainer() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Upload Picture', style:CustomTextSty.mTextStyle14),
      Container(
        width: 386,
        height: 96,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['png', 'jpg', 'gif'],
                  );
                  if (result != null) {
                    setState(() {
                      _uploadedFile = File(result.files.first.path!);
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/upload_icon.png'),
                      width: 36, // adjust the width of the image
                      height: 36, // adjust the height of the image
                    ),
                    Column(
                      children: [
                        Text('Upload a file or drag and drop'),
                        Text('PNG,JPG,GIF upto 5MB'),
                      ],
                    ),
                  ],
                ),
              ),
              Text(_uploadedFile != null ? _uploadedFile!.path : ''),
            ],
          ),
        ),
      ),
    ],
  );
}