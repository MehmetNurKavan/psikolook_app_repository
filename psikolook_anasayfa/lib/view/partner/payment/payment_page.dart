import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:http/http.dart' as http;
import 'package:psikolook_anasayfa/users/psikologUser/models/iyzico_payment.dart';
import 'package:psikolook_anasayfa/utils/colors.dart';
import 'package:psikolook_anasayfa/view/partner/payment/payment_successful_page.dart';

class PaymentPage extends StatefulWidget {
  final navigator;
  const PaymentPage({Key? key, required this.navigator})
      : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool registerCard = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  _pay() async {
    String token = FirebaseAuth.instance.currentUser!.uid;
    String paymentUrl = 'http://192.168.1.2:3000/api/payment/iyzico';
    final body = Map<String, dynamic>();
    var expireMonth = expiryDate.split('/')[0];
    var expireYear = expiryDate.split('/')[1];
    cardNumber = cardNumber.split(" ").join("");
    print(expiryDate[0]);
    print(expiryDate[1]);
    body['cardNumber'] = cardNumber;
    body['expireMonth'] = expireMonth;
    body['expireYear'] = expireYear;
    body['cardHolderName'] = cardHolderName;
    body['cvc'] = cvvCode;
    body['registerCard'] = registerCard ? '1' : '0';
    final response = await http
        .post(Uri.parse(paymentUrl), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final iyzicoPayment = iyzicoPaymentFromJson(response.body);
      print(iyzicoPayment.status);
      if (iyzicoPayment.status == 'success') {
        widget.navigator;
      } else {
        var err = jsonDecode(response.body);
        _showMyDialog('Unsuccessful Payment', err['errorMessage']);
      }
    } else {
      _showMyDialog('Unsuccessful Payment', 'Something went wrong');
    }
  }

  Future<void> _showMyDialog(String title, String content) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
          );
        }).then((value) => {
          setState(() {
            _isLoading = false;
          })
        });
  }

  OutlineInputBorder? border;

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: backGroundColor[0],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              colors: backGroundColor),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const Text('Ödeme Seçenekleri',
                  style: TextStyle(color: pinkColor, fontSize: 24)),
              const SizedBox(height: 10.0),
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                /* bankName: 'Banka Adı', */
                cardBgColor: Colors.transparent,
                labelCardHolder: 'Kard Sahibi',
                labelExpiredDate: 'Ay/Yıl',
                frontCardBorder: Border.all(color: Colors.grey),
                backCardBorder: Border.all(color: Colors.grey),
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                /* cardBgColor: AppColors.cardBgColor, */
                backgroundImage: 'assets/images/credit_card.png',
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                /* customCardTypeIcons: <CustomCardTypeIcon>[
                  CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/images/mastercard.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ], */
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: backGroundColor[2],
                        textColor: Colors.black87,
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Numara',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(color: Colors.black87),
                          labelStyle: const TextStyle(color: Colors.black87),
                          focusedBorder: border,
                          enabledBorder: border,
                        ),
                        expiryDateDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black87),
                          labelStyle: const TextStyle(color: Colors.black87),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Son Kullanma Tarihi',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black87),
                          labelStyle: const TextStyle(color: Colors.black87),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black87),
                          labelStyle: const TextStyle(color: Colors.black87),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Kard Sahibi',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: _pay,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: pinkColors,
                              begin: const Alignment(-1, -4),
                              end: const Alignment(1, 4),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text(
                            'Ödemeyi Onayla',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
