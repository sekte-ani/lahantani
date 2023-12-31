import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahantani/controller/forum_controller.dart';
import 'package:lahantani/theme.dart';
import 'package:lahantani/ui/widgets/buttons.dart';
import 'package:lahantani/ui/widgets/forms.dart';
import 'package:lahantani/ui/widgets/validator.dart';

class ForumPage extends GetView<ForumController> {
  final ForumController controller = Get.put(ForumController());
  final TextEditingController questionController = TextEditingController();
  final RxBool submitted = false.obs;

  var selected = ''.obs;

  void submitQuestion() {
    // Add logic to send the question or message
    submitted.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.forum,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Forum',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(27),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Obx(() => DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            validator: Validator.required,
                            hint: Text("Pilih Perihal.."),
                            value: selected.value.isNotEmpty
                                ? selected.value
                                : null,
                            isExpanded: true,
                            onChanged: (value) {
                              // No need to setState as it's a stateless widget
                              controller.subject = value!;
                              selected.value = value!;
                              print(value);
                            },
                            items: <String>[
                              'Pertanyaan',
                              'Saran',
                              'Lainnya',
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value
                                    .toLowerCase(), // Ensure unique values (e.g., make them lowercase)
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              );
                            }).toList(),
                          ),
                        )),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: Validator.required,
                    onChanged: (value) {
                      controller.message = value;
                    },
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: 'Tulis pertanyaan atau pesan Anda di sini',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(16), // Set border radius here
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius:
                            BorderRadius.circular(16), // Set border radius here
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius:
                            BorderRadius.circular(16), // Set border radius here
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  PrimaryButton(
                    title: "Kirim",
                    onPressed: () {
                      controller.doKirim();
                    },
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => submitted.value
                        ? Text(
                            'Forum telah dikirim, silahkan cek email',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Container(),
                  ),
                  SizedBox(height: 200),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
