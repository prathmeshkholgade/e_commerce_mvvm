import 'package:flutter/material.dart';

class AddToCartBtn extends StatelessWidget {
  final double height;
  final VoidCallback onTap;
  const AddToCartBtn({super.key, required this.onTap, this.height = 22});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      // padding: EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Theme.of(context).primaryColor,
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        onPressed: onTap,
        child: Text(
          "Add to cart",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
