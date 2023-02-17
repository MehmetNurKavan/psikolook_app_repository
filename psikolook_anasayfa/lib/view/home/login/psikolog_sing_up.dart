import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/login/PsikologsingInPage.dart';
import 'package:psikolook_anasayfa/view/home/login/signInPage.dart';
import 'package:psikolook_anasayfa/view/home/login/Login_home.dart';

class psikologSignUpPage extends StatefulWidget {
  const psikologSignUpPage({super.key});

  @override
  State<psikologSignUpPage> createState() => _psikologSignUpPageState();
}

class _psikologSignUpPageState extends State<psikologSignUpPage> {
  int _value = 1;
  bool isChecked = false;
  bool isChecked2 = false;
  bool _obscureText00 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin:Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 255, 235, 240),
                Color.fromARGB(255, 255, 243, 244),
                Color.fromARGB(255, 255, 249, 246),
                Color.fromARGB(255, 255, 254, 248),
                Color.fromARGB(255, 255, 254, 248), 
              ]

            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 30.0, left: 15, right: 15.0, bottom: 25.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.10,
                        child: FloatingActionButton.small(
                            elevation: 0,
                            backgroundColor: Colors.black,
                            
                            child: Icon(
                              
                              Icons.arrow_back_ios_new,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Image.asset(
                              "assets/images/logo_kucuk.png",
                              height: MediaQuery.of(context).size.height*0.15,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    buildSignUpView(
                      "Adınız Soyadınız",
                      TextInputType.name,
                    ),
                    buildSignUpView("E-Posta", TextInputType.emailAddress),
                    buildSignUpView("Yaş", TextInputType.number),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Cinsiyetiniz",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    gender(),
                    buildSignUpView("Telefon", TextInputType.number),
                    buildPassword("Şifreniz", TextInputType.visiblePassword),
                  buildPassword(
                        "Şifrenizi Tekrar Giriniz", TextInputType.name),
                    
                        buildSignUpView(
                        "Yüksek Lisans veya Doktora Öğrencisiyseniz \nOkulunuzun Adı", TextInputType.name),
                    buildSignUpView(
                        "Çalışıyorsanız Çalıştığınız Kurum", TextInputType.name),
                        buildSignUpView(
                        "Unvanınız", TextInputType.name),
                         buildSignUpView(
                        "Diplomanız ya da Öğrenci Belgeniz", TextInputType.name),
                    
                    
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text("  Belgeniz onaylandığında ana sayfanızda \n  profiliniz onaylandı yazacaktır",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             TextButton(onPressed: () {
                               
                             }, 
                             
                             child: Row(
                               children: [
                                 Text("KVKK",style: TextStyle(color: Colors.pink,decoration: TextDecoration.underline,),),
                                 Text("'yı okudum onaylıyorum",style: TextStyle(color: Colors.pink,)),
                               ],
                             )),
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: Card(
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    checkColor: Colors.pink,
                                    activeColor: Colors.pink,
                                    fillColor:
                                        MaterialStateProperty.all(Colors.white),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             TextButton(onPressed: () {
                               
                             }, child: Row(
                               children: [
                               
                                 Text("Kullanıcı Sözleşmesi",style: TextStyle(color: Colors.pink,decoration: TextDecoration.underline,),),
                                 Text("ni okudum kabul ediyorum",style: TextStyle(color: Colors.pink,)),
                               ],
                             )),
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: Card(
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    checkColor: Colors.pink,
                                    activeColor: Colors.pink,
                                    fillColor:
                                        MaterialStateProperty.all(Colors.white),
                                    value: isChecked2,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked2 = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            textStyle: TextStyle(fontSize: 24),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 13, bottom: 13),
                            child: Text("Kayıt Ol"),
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildSignUpView(value, _kytp) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10.0),
            Text(value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          keyboardType: _kytp,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: value,
              filled: true,
              fillColor: Color.fromARGB(255, 255, 255, 255)),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }

  gender() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Radio(
                activeColor: Colors.black,
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                }),
            Text("Kadın"),
            Icon(Icons.female)
          ],
        ),
        Row(
          children: [
            Radio(
                activeColor: Colors.black,
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                }),
            Text("Erkek"),
            Icon(Icons.male)
          ],
        ),
        Row(
          children: [
            Radio(
                activeColor: Colors.black,
                value: 3,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                }),
            Text("Diğer"),
            Icon(Icons.transgender)
          ],
        )
      ],
    );
  }
buildPassword(value, _kytp){

return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10.0),
            Text(value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: _obscureText00,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText00 = !_obscureText00;
                                  });
                                },
                                color: Colors.black,
                                icon: Icon(_obscureText00
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
            
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: value,
              filled: true,
              fillColor: Color.fromARGB(255, 255, 255, 255)),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );

  
}}