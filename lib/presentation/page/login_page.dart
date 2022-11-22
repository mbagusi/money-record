import 'package:course_money_record/presentation/page/home_page.dart';
import 'package:course_money_record/presentation/page/register_page.dart';
import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_asset.dart';
import '../../config/app_color.dart';
import '../../data/source/source_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  login() async {
    if(formKey.currentState!.validate()){
      bool success = await SourceUser.login(
        controllerEmail.text, 
        controllerPassword.text);
      if(success){
        DInfo.dialogSuccess('Berhasil Login');
        DInfo.closeDialog(actionAfterClose: (){
          Get.off(() => const HomePage());
        });
        
      }else{
        DInfo.dialogError('Gagal Login');
        DInfo.closeDialog();
      }
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
                            onTap: () => login(),
                            borderRadius: BorderRadius.circular(30),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                              child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 16,),),
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
                    const Text('Belum punya akun?', style: TextStyle(fontSize: 16),),
                    // ignore: prefer_const_constructors
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>const RegisterPage());
                      },
                      child: const Text('Register', style: TextStyle(
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