import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {
  final Space space;
  WishlistCard(this.space);
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              space.imageUrl,
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  space.name,
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text(
                  '\$${space.price}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setSpace(space);
            },
            child: Image.asset(
              'assets/btn_wishlist.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
