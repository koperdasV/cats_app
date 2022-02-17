import 'package:cats_app/screen/Details/details_screen.dart';
import 'package:flutter/material.dart';

class CatsCardWidget extends StatefulWidget {
  final AssetImage image;
  const CatsCardWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<CatsCardWidget> createState() => _CatsCardWidgetState();
}

class _CatsCardWidgetState extends State<CatsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const DetailsScreen())));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[300],
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                color: Colors.grey.withOpacity(0.8),
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Center(
                child: Image(
                  image: widget.image,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
                iconSize: 32,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
