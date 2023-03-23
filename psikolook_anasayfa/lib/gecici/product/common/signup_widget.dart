import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/view/home/drawer/kvkk_page.dart';
import 'package:psikolook_anasayfa/widget/textfield_widget.dart';
import 'package:psikolook_anasayfa/widget/textfiiedpassword_widget.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.onPressed,
    this.emailChanged,
    this.passwordChanged,
    required TextEditingController fullNameController,
    required TextEditingController numberController,
    required TextEditingController password0Controller,
    required TextEditingController ageController,
    required TextEditingController genderController,
    required TextEditingController complaintController,
    required TextEditingController jobController,
    required TextEditingController schoolNameController,
    required TextEditingController schoolJobController,
    required TextEditingController schoolClassController,
    this.fullNameChanged,
    this.ageChanged,
    this.genderChanged,
    this.jobChanged,
    this.schoolNameChanged,
    this.schoolJobChanged,
    this.schoolClassChanged,
    this.numberChanged,
    this.password0Changed,
    this.complaintChanged,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _fullNameController = fullNameController,
        _numberController = numberController,
        _password0Controller = password0Controller,
        _ageController = ageController,
        _genderController = genderController,
        _complaintController = complaintController,
        _jobController = jobController,
        _schoolNameController = schoolNameController,
        _schoolJobController = schoolJobController,
        _schoolClassController = schoolClassController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _complaintController;
  final TextEditingController _fullNameController;
  final TextEditingController _numberController;
  final TextEditingController _password0Controller;
  final TextEditingController _ageController;
  final TextEditingController _genderController;
  final TextEditingController _jobController;
  final TextEditingController _schoolNameController;
  final TextEditingController _schoolJobController;
  final TextEditingController _schoolClassController;

  final void Function()? onPressed;
  final Function(String)? emailChanged;
  final Function(String)? passwordChanged;
  final Function(String)? password0Changed;
  final Function(String)? fullNameChanged;
  final Function(String)? numberChanged;
  final Function(String)? complaintChanged;
  final Function(String)? ageChanged;
  final Function(String)? genderChanged;
  final Function(String)? jobChanged;
  final Function(String)? schoolNameChanged;
  final Function(String)? schoolJobChanged;
  final Function(String)? schoolClassChanged;

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  int _value = 1;
  bool isChecked = false;
  bool isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("Adınızı Soyadınızı giriniz",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldWidget(
          hintText: 'Adınızı Soyadınızı giriniz',
          controller: widget._fullNameController,
          keyboardType: TextInputType.name,
          onChanged: widget.fullNameChanged,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("E-Posta:",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldWidget(
          controller: widget._emailController,
          hintText: 'Geçerli bir E- Posta Giriniz',
          onChanged: widget.emailChanged,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("Yaş:",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldWidget(
          hintText: "Yaş",
          controller: widget._ageController,
          keyboardType: TextInputType.number,
          onChanged: widget.ageChanged,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Cinsiyetiniz:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        //gender(),
        TextFieldWidget(
          hintText: 'Cinsiyetinizi Giriniz',
          controller: widget._genderController,
          onChanged: widget.genderChanged,
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("Şikayetiniz:",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldWidget(
          hintText:
              "Neden psikolojik destek almak isiyorsunuz? Kısaca açıklayınız.",
          controller: widget._complaintController,
          keyboardType: TextInputType.name,
          onChanged: widget.complaintChanged,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("Mesleğiniz:",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldWidget(
          hintText: "Mesleğiniz Varsa Giriniz Yoksa Yok Yazınız",
          keyboardType: TextInputType.name,
          controller: widget._jobController,
          onChanged: widget.jobChanged,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("Telefon:",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldWidget(
          hintText: "Telefonunuzu Giriniz",
          controller: widget._numberController,
          keyboardType: TextInputType.number,
          onChanged: widget.numberChanged,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("Öğrenciyseniz Okulunuzun Adı:",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldWidget(
          hintText: "Okuduğunuz Okulunuzun Adını Giriniz",
          keyboardType: TextInputType.name,
          controller: widget._schoolNameController,
          onChanged: widget.schoolNameChanged,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("Öğrenciyseniz Bölümün Adı:",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldWidget(
          hintText: "Okuduğunuz Bölümün Adını Giriniz",
          keyboardType: TextInputType.name,
          controller: widget._schoolJobController,
          onChanged: widget.schoolJobChanged,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("Öğrenciyseniz Sınıfınız:",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldWidget(
          hintText: "Okuduğunuz Sınıfı Giriniz",
          keyboardType: TextInputType.name,
          controller: widget._schoolClassController,
          onChanged: widget.schoolClassChanged,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("Şifre:",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldPasswordWidget(
          onChanged: widget.passwordChanged,
          controller: widget._passwordController,
          hintText: "Şifreniz",
          isPassword: true,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            const Text("Şifre:",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextFieldPasswordWidget(
          onChanged: widget.password0Changed,
          controller: widget._password0Controller,
          hintText: "Şifrenizi Tekrar Giriniz",
          isPassword: true,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "  Belgeniz onaylandığında ana sayfanızda \n  profiliniz onaylandı yazacaktır",
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KvkkPage()));
                      },
                      child: Row(
                        children: [
                          const Text(
                            "KVKK",
                            style: TextStyle(
                              color: Colors.pink,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const Text("'yı okudum onaylıyorum",
                              style: TextStyle(
                                color: Colors.pink,
                              )),
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
                        fillColor: MaterialStateProperty.all(Colors.white),
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
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Text(
                            "Kullanıcı Sözleşmesi",
                            style: TextStyle(
                              color: Colors.pink,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const Text("ni okudum kabul ediyorum",
                              style: TextStyle(
                                color: Colors.pink,
                              )),
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
                        fillColor: MaterialStateProperty.all(Colors.white),
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
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    textStyle: const TextStyle(fontSize: 24),
                  ),
                  onPressed: widget.onPressed,
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 13, bottom: 13),
                    child: Text("Kaydol"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  //simdilik kullanımdan kaldırıdm
 /*  gender() {
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
            const Text("Kadın"),
            const Icon(Icons.female)
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
            const Text("Erkek"),
            const Icon(Icons.male)
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
            const Text("Diğer"),
            const Icon(Icons.transgender)
          ],
        )
      ],
    );
  } */
}
