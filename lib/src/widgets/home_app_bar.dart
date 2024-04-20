import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class HomeAppBar extends PreferredSize {
  const HomeAppBar({
    super.key,
    super.preferredSize = const Size.fromHeight(180),
    super.child = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      toolbarHeight: 180,
      centerTitle: true,
      backgroundColor: fromCssColor('#4975b1'),
      title: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            'Chuva 💜 Flutter',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: fromCssColor('#ffffff'),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Programação',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: fromCssColor('#ffffff'),
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 20),
          Container(
            height: 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: fromCssColor('#ffffff'),
              borderRadius: BorderRadius.circular(90),
            ),
            child: Row(
              children: [
                const SizedBox(width: 5),
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                    color: fromCssColor('#4975b1'),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Icon(
                    Icons.calendar_month,
                    color: fromCssColor('#ffffff'),
                  ),
                ),
                const Spacer(),
                const Text(
                  'Exibindo todas as atividades',
                  style: TextStyle(
                      fontSize: 16,
                      // color: fromCssColor('#4975b1'),
                      fontWeight: FontWeight.normal),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
