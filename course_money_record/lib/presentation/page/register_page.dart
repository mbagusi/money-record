import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_asset.dart';
import '../../config/app_color.dart';
import '../../data/source/source_user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  register() async {
    if(formKey.currentState!.validate()){
      await SourceUser.register(
        controllerName.text,
        controllerEmail.text, 
        controllerPassword.text);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: LayoutBuilder(builder: (context, constraints){
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DView.nothing(),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Image.asset(AppAsset.logo, width: 200, height: 200,),
                        DView.spaceHeight(40),
                        TextFormField(
                          controller: controllerName,
                          validator: (value)=> value == '' ? 'Data Tidak Boleh Kosong' : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(
                            color: Colors.white
                          ),
                          decoration: InputDecoration(
                            fillColor: AppColor.primary.withOpacity(0.5),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Name',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16)
                          ),
                        ),
                        DView.spaceHeight(),
                        TextFormField(
                          controller: controllerEmail,
                          validator: (value)=> value == '' ? 'Data Tidak Boleh Kosong' : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(
                            color: Colors.white
                          ),
                          decoration: InputDecoration(
                            fillColor: AppColor.primary.withOpacity(0.5),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Email',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16)
                          ),
                        ),
                        DView.spaceHeight(),
                        TextFormField(
                          controller: controllerPassword,
                          validator: (value)=> value == '' ? 'Data Tidak Boleh Kosong' : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          style: const TextStyle(
                            color: Colors.white
                          ),
                          decoration: InputDecoration(
                            fillColor: AppColor.primary.withOpacity(0.5),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Password',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16)
                          ),
                        ),
                        DView.spaceHeight(30),
                        Material(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            onTap: () => register(),
                            borderRadius: BorderRadius.circular(30),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                              child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 16,),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text('Sudah punya akun?', style: TextStyle(fontSize: 16),),
                    // ignore: prefer_const_constructors
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Text('Login', style: TextStyle(
                        color: AppColor.primary,
                      ),
                      ),
                    )
                  ],
                ),
                )
              ],
            ),
          ),
        );
      },
      )
    );
  }
}