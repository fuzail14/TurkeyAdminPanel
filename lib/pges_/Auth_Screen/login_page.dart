import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turkeyadmin/pges_/Auth_Screen/sing_up.dart';
import '../Firebase_Screen/Firebase_Function.dart';
import '../Helper/Sized.dart';
import '../Helper/Stringconst.dart';
import '../Helper/colorsconst.dart';
import '../widgets/SnackBar_widget.dart';
import '../widgets/Validator.dart';
import '../widgets/logi_sinupb.dart';
import '../widgets/textField.dart';

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

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    super.initState();
  }

  bool isloading = true;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwrodcontroller = TextEditingController();
  bool check = false;
  final _formKey = GlobalKey<FormState>();
  bool buttonenable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.back_ground,
      body: Padding(
        padding: const EdgeInsets.only(top: 110, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            onChanged: () {
              buttonenable = _formKey.currentState!.validate();
            },
            child: Column(
              children: [
                Text(
                  Allstring.login,
                  style: Login_st,
                ),
                Sizebox.EXTRAHEIGT,
                Text(
                  Allstring.or_Sign_up_with_Email,
                  style: or_signup_Email,
                ),
                Sizebox.LITTLESMALLH,
                FieldText(
                  validator: (v) {
                    Validators.emailValidation(v);
                  },
                  obscure: false,
                  controller: emailcontroller,
                  hintText: Allstring.Email,
                ),
                Sizebox.SMALLLARGEH,
                FieldText(
                  validator: (v) {
                    Validators.passwordValidation(v);
                  },
                  onchange: (v) {},
                  obscure: true,
                  controller: passwrodcontroller,
                  hintText: Allstring.Password,
                ),
                Sizebox.LITTLESMALLH,
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
                    Sizebox.LITTLESMALLW,
                    InkWell(
                      onTap: () {},
                      child: Text(
                        Allstring.Forgotten_Password,
                        textAlign: TextAlign.end,
                        style: Forget_st,
                      ),
                    )
                  ],
                ),
                Sizebox.LITTLESMALLH,
                log_sigup(
                  text: Allstring.login,
                  onpressed: check == true
                      ? () {
                          if (check == true) {
                            AuthModels().EmailSingnIn(context,
                                emailcontroller.text, passwrodcontroller.text);
                            ClearText();
                          } else if (check == false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                MySnackbar.ErrorSnackBar(
                                    'please Select check Box'));
                          }
                        }
                      : null,
                ),
                Sizebox.LITTLESMALLH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Allstring.Not_registered_yet),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => sign_up()));
                      },
                      child: Text(
                        Allstring.Create_an_Account,
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
      ),
    );
  }

  void ClearText() {
    emailcontroller.clear();
    passwrodcontroller.clear();
    namecontroller.clear();
  }
}
