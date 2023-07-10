import 'package:flutter/material.dart';

import '../../../ui/costum_theme.dart';

class CostumNavBar extends StatefulWidget {
  const CostumNavBar({super.key});

  @override
  State<CostumNavBar> createState() => _CostumNavBarState();
}

class _CostumNavBarState extends State<CostumNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 8.0,
                offset: Offset(0.0, 0.75)
            )
          ],
        ),
        child: 
      BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon((Icons.home),color: AppColors.anarenk,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon((Icons.map),color: AppColors.anarenk,
            size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon((Icons.search),color: AppColors.anarenk,
            size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon((Icons.favorite_border),color: AppColors.anarenk,
            size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon((Icons.settings),color: AppColors.anarenk,
            size: 35,
            ),
            label: '',
          ),
        ],
        backgroundColor: AppColors.beyaz,
        selectedItemColor: AppColors.siyah,
        showUnselectedLabels: false,
        showSelectedLabels: false,

      ),
      );
  }
}