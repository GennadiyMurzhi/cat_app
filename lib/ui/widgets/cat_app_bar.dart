import 'package:flutter/material.dart';

class CatAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool needPop;

  const CatAppBar({Key? key, required this.title, required this.needPop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;

    return SizedBox(
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
                icon: const Icon(Icons.arrow_back_ios)) : Container(),
            const SizedBox(width: 15,),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xFF5E5959),
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