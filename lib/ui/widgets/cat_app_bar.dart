import 'package:flutter/material.dart';

class CatAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool needPop;

  const CatAppBar({Key? key, required this.title, required this.needPop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
              color: Color(0xFF5A5A5A),
              offset: Offset(0, -1),
              spreadRadius: 4,
              blurRadius: 4)
        ]
      ),
      height: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.only(top: safePadding),
        child: Row(
          children: [
            needPop ? IconButton(
                padding: const EdgeInsets.only(left: 8),
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(
                    Icons.arrow_back_ios,
                  color: Color(0xFF4F6670),
                )) : Container(),
            const SizedBox(width: 10,),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Bahnschrift',
                  fontSize: 24,
                  color: Color(0xFF4F6670),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);

}