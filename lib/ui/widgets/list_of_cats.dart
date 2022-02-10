import 'package:cats_app/domain/entities/cat.dart';
import 'package:cats_app/ui/widgets/cat_basic_info.dart';
import 'package:flutter/cupertino.dart';

class ListOfCats extends StatelessWidget{
  final List<Cat> listOfCat;

  const ListOfCats({
    Key? key,
    required this.listOfCat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: List.generate(listOfCat.length, (index) =>
                CatBasicInfo(
                    apiId: listOfCat[index].id,
                    listId: index,
                    needPushButton: true,
                    name: listOfCat[index].name,
                    origin: listOfCat[index].origin,
                    imageUrl: listOfCat[index].imageUrl,
                    wikiUrl: listOfCat[index].wikiUrl,
                ),
            ),
          ),
        ),
    );
  }

}