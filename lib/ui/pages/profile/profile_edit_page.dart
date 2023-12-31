import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lahantani/controller/profile_controller.dart';
import 'package:lahantani/theme.dart';
import 'package:lahantani/ui/widgets/buttons.dart';
import 'package:lahantani/ui/widgets/datepicker.dart';
import 'package:lahantani/ui/widgets/forms.dart';
import 'package:lahantani/ui/widgets/validator.dart';

class ProfileEditPage extends GetView<ProfileController> {
  ProfileController controller = Get.put(ProfileController());

  final Map? itemProfile;
  ProfileEditPage({
    Key? key,
    this.itemProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: greenColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: greenColor,
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
        title: Text(
          "Edit Profile",
          style: font_semiBold.copyWith(
            color: whiteColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: greenColor,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(27),
                    ),
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 34),
                        const SizedBox(height: 20),
                        InputField(
                          title: "Nomor HP",
                          hintText: "Masukkan nomor telpon anda...",
                          validator: Validator.number,
                          value: controller.phone,
                          onChange: (value) {
                            controller.phone = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        // InputFieldDate(
                        //   title: "Tanggal Lahir",
                        //   hintText: "Masukkan tanggal lahir...",
                        // ),
                        QDatePicker(
                          label: "Tanggal Lahir",
                          validator: Validator.required,
                          value: controller.born != null
                              ? DateTime.parse(controller.born!)
                              : null,
                          onChanged: (value) {
                            controller.born = value.toString();
                          },
                        ),
                        const SizedBox(height: 20),
                        InputFieldBox(
                          title: "Alamat",
                          hintText: "Masukkan alamat rumah anda...",
                          validator: Validator.required,
                          value: controller.address,
                          onChange: (value) {
                            controller.address = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        InputFieldPassword(
                          title: "Password",
                          hintText: "Masukkan password lama/baru anda..",
                          validator: Validator.required,
                          onChange: (value) {
                            controller.password = value;
                          },
                        ),
                        const SizedBox(height: 50),
                        PrimaryButton(
                          title: "Update Profile",
                          onPressed: controller.isUpdatingProfile.value
                              ? null
                              : () {
                                  controller.updateProfile(
                                    phone: controller.phone!,
                                    born: controller.born!,
                                    address: controller.address!,
                                    password: controller.password!,
                                  );
                                },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
