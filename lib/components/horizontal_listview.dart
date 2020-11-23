import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/images/cats/tshirt.png',
            image_Caption: 'Shirt',
          ),
          Category(
            image_location: 'assets/images/cats/dress.png',
            image_Caption: 'dress',
          ),
          Category(
            image_location: 'assets/images/cats/jeans.png',
            image_Caption: 'pants',
          ),
          Category(
            image_location: 'assets/images/cats/formal.png',
            image_Caption: 'formal',
          ),
          Category(
            image_location: 'assets/images/cats/informal.png',
            image_Caption: 'informal',
          ),
          Category(
            image_location: 'assets/images/cats/shoe.png',
            image_Caption: 'shoes',
          ),
          Category(
            image_location: 'assets/images/cats/accessories.png',
            image_Caption: 'accessories',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_Caption;

  Category({
    this.image_location,
    this.image_Caption
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all((2.0)),
      child: InkWell(onTap: (){},
      child: Container(
        width: 100.0,
        child: ListTile(
          title: Image.asset(image_location, width: 100.0,height: 80.0,),
          subtitle: Container(
            alignment: Alignment.topCenter,
              child: Text(image_Caption)
          ),
        ),
      ),),
    );
  }
}