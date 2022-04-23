import 'package:bwa_cozy/models/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  List<Space> _wishlist = [];

  List<Space> get wishlist => _wishlist;

  set wishlist(List<Space> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setSpace(Space space) {
    if (!isWishlist(space)) {
      _wishlist.add(space);
    } else {
      _wishlist.removeWhere((element) => element.id == space.id);
    }

    notifyListeners();
  }

  isWishlist(Space space) {
    if (_wishlist.indexWhere((element) => element.id == space.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
