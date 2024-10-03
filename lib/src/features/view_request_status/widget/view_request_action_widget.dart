import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../app_configs/app_colors.dart';
import '../../../app_configs/app_images.dart';
import '../../../app_configs/custom_style.dart';
import '../../../common_widgets/custom_fields/text/custom_text_field.dart';
import '../provider/view_request_provider.dart';

class ViewRequestActionWidget extends StatelessWidget {
  const ViewRequestActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final requestProvider = Provider.of<RequestProvider>(context);
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.greyBackgroundColor,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      SvgPicture.asset(AppImages.edit, width: 20, height: 20),
                ),
                Text('Action', style: CustomTextSty.mTextStyle13),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Action Status', style: CustomTextSty.mTextStyle14),
                    Text('*', style: CustomTextSty.mTextStyleColor),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Radio(
                            value: 'Pending',
                            groupValue: requestProvider.selectedActionStatus,
                            activeColor: AppColors.darkMaron,
                            onChanged: (value) {
                              requestProvider.updateActionStatus(value);
                            },
                          ),
                        ),
                        const Text('Pending for action'),
                      ],
                    ),
                    const SizedBox(width: 20.0),
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Radio(
                            value: 'Complete',
                            groupValue: requestProvider.selectedActionStatus,
                            activeColor: AppColors.darkMaron,
                            onChanged: (value) {
                              requestProvider.updateActionStatus(value);
                            },
                          ),
                        ),
                        const Text('Complete for action'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Target Date', style: CustomTextSty.mTextStyle14),
                    Text('*', style: CustomTextSty.mTextStyleColor),
                  ],
                ),
                const SizedBox(height: 7),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: CustomTextField(
                    labelText: 'Select target date',
                    controller: requestProvider.dateController,
                    suffix: GestureDetector(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (date != null) {
                          requestProvider.updateTargetDate(date);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          AppImages.calendar,
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ),
                    onSaved: (string) {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: (screenSize.width > 600)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: leftContainer(requestProvider, context)),
                      Expanded(child: rightContainer(requestProvider)),
                    ],
                  )
                : Column(
                    children: [
                      leftContainer(requestProvider, context),
                      rightContainer(requestProvider),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  leftContainer(RequestProvider requestProvider, BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Impact Description', style: CustomTextSty.mTextStyle14),
              Text('*', style: CustomTextSty.mTextStyleColor),
            ],
          ),
          const SizedBox(height: 7),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 96,
            child: CustomTextField(
              labelText: 'Impact Description',
              maxLines: 4,
              onChanged: (value) {
                requestProvider.updateImpactDescription(value);
              },
              onSaved: (string) {},
            ),
          ),
        ],
      );
  rightContainer(RequestProvider requestProvider) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Upload File', style: CustomTextSty.mTextStyle14),
          const SizedBox(height: 7),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            color: AppColors.borderColor,
            strokeWidth: 1,
            child: Container(
              width: 386,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    if (result != null) {
                      requestProvider
                          .updateUploadedFile(File(result.files.single.path!));
                    }
                  },
                  child: Center(
                    child: requestProvider.uploadedFile != null
                        ? Text(
                            'File Uploaded: ${requestProvider.uploadedFile!.path.split('/').last}',
                            style: const TextStyle(
                              color: AppColors.darkMaron,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(AppImages.bulkDownload),
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Upload a file',
                                        style: TextStyle(
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      Text(
                                        'or drag and drop',
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text('PNG, JPG, GIF up to 5MB'),
                                ],
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
