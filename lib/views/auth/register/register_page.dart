import 'package:f46/views/auth/register/register_done.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../services/auth_service.dart';
import '../../../ui/costum_input.dart';
import '../../../ui/costum_theme.dart';



class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  

  bool _obscureText = true;

  AuthService _authService = AuthService();
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: Padding(
          padding: const EdgeInsets.only(top: 17),
          child:
            IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.anarenk, size: 30),
            onPressed: (){
              Navigator.pop(context);
            },
            ),
          
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage('assets/pana.png')),
                const SizedBox(height: 20),
                Row(
                  children: [
                    
                    Text(
                      'Kayıt Ol',
                      style: context.h4?.copyWith(fontWeight: FontWeight.w600)
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      focusedBorder: CostumInput.Focus,
                                    enabledBorder: CostumInput.Enabled,
                                    filled: true,
                                    fillColor: AppColors.beyaz,
                      prefixIcon: const Icon(
                        Icons.person_outline_sharp,
                        color: Colors.orange,
                      ),
                      labelText: 'Ad',
                      labelStyle: context.paragraph?.copyWith(color: AppColors.koyugri),
                      floatingLabelStyle: context.h5?.copyWith(color: AppColors.anarenk, fontWeight: FontWeight.w800),
                    )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                    controller: _surnameController,
                    decoration: InputDecoration(
                      focusedBorder: CostumInput.Focus,
                                    enabledBorder: CostumInput.Enabled,
                                    filled: true,
                                    fillColor: AppColors.beyaz,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                      labelText: 'Soyad',
                      labelStyle: context.paragraph?.copyWith(color: AppColors.koyugri),
                      floatingLabelStyle: context.h5?.copyWith(color: AppColors.anarenk, fontWeight: FontWeight.w800),
                    )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      focusedBorder: CostumInput.Focus,
                                    enabledBorder: CostumInput.Enabled,
                                    filled: true,
                                    fillColor: AppColors.beyaz,
                      prefixIcon: const Icon(
                        Icons.mail,
                        color: Colors.orange,
                      ),
                      labelText: 'E-Mail',
                      labelStyle: context.paragraph?.copyWith(color: AppColors.koyugri),
                      floatingLabelStyle: context.h5?.copyWith(color: AppColors.anarenk, fontWeight: FontWeight.w800),
                    )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      focusedBorder: CostumInput.Focus,
                                    enabledBorder: CostumInput.Enabled,
                                    filled: true,
                                    fillColor: AppColors.beyaz,
                      suffixIcon: IconButton(
                        icon: Icon(
                          color: AppColors.anarenk,
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      prefixIcon: const Icon(
                        Icons.vpn_key,
                        color: Colors.orange,
                      ),
                      labelText: 'Parola',
                      labelStyle: context.paragraph?.copyWith(color: AppColors.koyugri),
                      floatingLabelStyle: context.h5?.copyWith(color: AppColors.anarenk, fontWeight: FontWeight.w800),
                    )),
                SizedBox(height: size.height * 0.05),
                
                Container(
                  width: 240,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      _authService
                          .createPerson(
                              _nameController.text,
                              _surnameController.text,
                              _emailController.text,
                              _passwordController.text)
                          .then((value) {
                        return Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterDone()));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child:
                        Text('Kaydol', style: context.paragraph?.copyWith(color: AppColors.beyaz)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
