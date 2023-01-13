import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Firebase_Screen/Firebase_Function.dart';
import '../Helper/Sized.dart';
import '../Helper/Stringconst.dart';
import '../Helper/colorsconst.dart';
import '../widgets/Validator.dart';
import '../widgets/logi_sinupb.dart';
import '../widgets/textField.dart';
import 'login_page.dart';
// TextStyle middletexts = const TextStyle(
//     fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.login);
// TextStyle smalltexts = const TextStyle(
//     fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.login);
// TextStyle littlelargetexts = const TextStyle(
//     fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.login);
// TextStyle littlesmalltexts = const TextStyle(
//     fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.login);
// TextStyle littlmidleexts = const TextStyle(
//     fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.login);
// TextStyle extralargetexts = const TextStyle(
//     fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.login);
// TextStyle extrasmalls = const TextStyle(
//     fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.login);
// TextStyle extrallittles = const TextStyle(
//     fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.login);
TextStyle Login_st =
    GoogleFonts.aBeeZee(fontWeight: FontWeight.w900, fontSize: 30);
TextStyle or_signup_Email = GoogleFonts.aBeeZee(
    fontWeight: FontWeight.w300, fontSize: 16, color: Colors.grey);

TextStyle Forget_st = GoogleFonts.aBeeZee(
    fontWeight: FontWeight.w300, fontSize: 16, color: AppColors.FORGET_C);
TextStyle REMEMBER_ST = GoogleFonts.aBeeZee(
    fontWeight: FontWeight.w300, fontSize: 14, color: Colors.black);

class sign_up extends StatefulWidget {
  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwrodcontroller = TextEditingController();
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.back_ground,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                Allstring.Signup,
                style: Login_st,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 60,
              ),
              Text(
                Allstring.or_Sign_up_with_Email,
                style: or_signup_Email,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              FieldText(
                validator:(v){
                  if(v!.isEmpty){
                    return 'Name is Not Empty';
                  }
                },
                obscure:false,
                controller: namecontroller,
                hintText: Allstring.Name,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              FieldText(
                validator:(v){
                  Validators.emailValidation(v);
                },
                obscure:false,
                controller: emailcontroller,
                hintText: Allstring.Email,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              FieldText(
                validator:(v){
                  Validators.emailValidation(v);
                },
                obscure:true,
                controller: passwrodcontroller,
                hintText: Allstring.Password,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.green,
                      value: check,
                      onChanged: (value) {
                        setState(() {
                          check = value!;
                        });
                        print(check);
                      }),
                  Text(
                    Allstring.Remember_me,
                    textAlign: TextAlign.start,
                    style: REMEMBER_ST,
                  ),
                ],
              ),
              Sizebox.LITTLESMALLH,
              log_sigup(
                text: Allstring.Signup,
                onpressed:check==true? () {
                  AuthModels().EmailSingup(context, namecontroller.text,
                      emailcontroller.text, passwrodcontroller.text);
                }:null,
              ),
              Sizebox.LITTLESMALLH,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Allstring.Already_have_an_Account),
                  SizedBox(width:10,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      login()
                      ));
                    },
                    child: Text(
                      Allstring.login,
                      textAlign: TextAlign.end,
                      style: Forget_st,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
