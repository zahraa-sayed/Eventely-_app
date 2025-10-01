import 'package:evently_app/core/assets_manager/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_tabBar.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/models/category_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Event")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(ImageAssets.bookClub),
              ),
              SizedBox(height: 16.h),
              CustomTabBar(
                selectedBgColor: ColorsManager.blue,
                selectedFgColor: ColorsManager.whiteBlue,
                unSelectedBgColor: Colors.transparent,
                unSelectedFgColor: ColorsManager.blue,
                categories: CategoryModels.categories,
              ),
              SizedBox(height: 16.h),
              Text("Title", style: Theme.of(context).textTheme.titleSmall),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hint: "Event Title",
                validator: (input) {},
                controller: _titleController,
                prefixIcon: Icons.edit_calendar_sharp,
              ),
              SizedBox(height: 16.h),
              Text(
                "Description",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hint: "Event Description",
                lines: 4,
                validator: (input) {},
                controller: _descriptionController,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(width: 4.w),
                  Text(
                    "Event Date",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Spacer(),
                  CustomTextButton(
                    text: "Choose Date",
                    onTap: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 4.w),
                  Text(
                    "Event Time",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Spacer(),
                  CustomTextButton(
                    text: "Choose Time",
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text("Location", style: Theme.of(context).textTheme.titleSmall),
              SizedBox(height: 8.h),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: ColorsManager.blue, width: 1),
                  padding: REdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    side: BorderSide(color: ColorsManager.blue, width: 3),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Card(
                      color: ColorsManager.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.my_location_outlined,
                          color: ColorsManager.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Text(
                      "Choose Event Location",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 30,
                      color: ColorsManager.blue,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              CustomElevatedButton(title: "Add Event", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
