import 'package:f46/ui/costum_theme.dart';
import 'package:f46/views/welcome/widget/onboardingPage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../services/auth_service.dart';
import '../auth/login/login_page.dart';
import '../home/home_screen.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool sonSayfa = false;

  @override
  void dispose(){
    controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 100),
        child: PageView(
          onPageChanged: (index) {
            setState(() => sonSayfa = index == 2);
          },
          controller: controller,
          children: const [
            OnBoardingWidget(
              img: 'https://firebasestorage.googleapis.com/v0/b/travelly-90e1c.appspot.com/o/pana-navsmall.png?alt=media&token=977cd46b-1474-4cea-86e5-1c69750d372d', 
              baslik: "Yeni Rotalar Keşfet!", 
              altBaslik: "Yeni rotalar keşfetmeye hazır mısın? Travelly ile seyahat düşlerinizi gerçeğe dönüştür!"),
            OnBoardingWidget(
              img: 'https://firebasestorage.googleapis.com/v0/b/travelly-90e1c.appspot.com/o/pana-hongsmall.png?alt=media&token=cb5f2cbf-8829-4e23-a395-e1895f0611a6', 
              baslik: "Gezgin Topluluklarına Katılın!", 
              altBaslik: "Topluluklara katıl, fotoğraflarını ve deneyimlerini paylaş! Travelly ile dünya çapında bir seyahat ailesinin parçası olun."),
            OnBoardingWidget(
              img: 'https://firebasestorage.googleapis.com/v0/b/travelly-90e1c.appspot.com/o/pana-airportpana.png?alt=media&token=7c0a970d-ac02-4bc4-b03d-dc02aeead39b', 
              baslik: "Sen de hemen Travelly Ailesine Katıl!", 
              altBaslik: "Hızlıca kayıt ol ya da Google ile hızlı giriş yap Travelly ailesinin bir parçası ol <3"),
          ],
        ),),
      bottomSheet: sonSayfa
      ? Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom:14),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
              ),
             
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage())
                );
              }, 
                  child: Text("Giriş Yap!", style: context.h4?.copyWith(color: AppColors.anarenk, fontWeight: FontWeight.w600),),
              ),
              TextButton(
             
              onPressed: () async {
                  await signInAnonymously(); // Anonim kullanıcı girişini yapacak fonksiyonunuzu buraya ekleyin
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                  child: Text("Giriş Yapmadan Devam Et!", style: context.small?.copyWith(color: AppColors.koyugri),)
              ),
          ],
        ),
      )
      
      : Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom:14),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: () => controller.jumpToPage(2), child: Text('Geç', style: context.h4?.copyWith(color: AppColors.anarenk),)),
            Center(
              child: SmoothPageIndicator(
                controller: controller, 
                count: 3,
                effect: const WormEffect(
                  spacing: 16,
                  dotColor: AppColors.ikincirenk,
                  activeDotColor: AppColors.anarenk
                ),
                onDotClicked: (index) => 
                  controller.animateToPage(index, 
                    duration: const Duration(microseconds: 500), curve: Curves.easeIn),
                ),
            ),
            TextButton(
              onPressed: () => 
                controller.nextPage(
                  duration: const Duration(milliseconds: 500), 
                  curve: Curves.easeInOut), 
              child: Text('İleri', style: context.h4?.copyWith(color: AppColors.anarenk))),
          ],
        ),
      ),
    );
  }
}