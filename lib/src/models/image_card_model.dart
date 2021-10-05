import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class ImageCardModel {
  int _id;
  String _routePath;
  bool _isFlipped;
  bool _isGuessed;
  GlobalKey<FlipCardState> _cardKey;
  
  get id {
    return _id;
  }

  get routePath {
    return _routePath;
  }

  get isFlipped {
    return _isFlipped;
  }

  get isGuessed {
    return _isGuessed;
  }

  GlobalKey<FlipCardState> get cardKey {
    return _cardKey;
  }

  flipCard(){
    _isFlipped = !_isFlipped;
  }

  markAsGuessed(){
    _isGuessed = true;
  }

  resetCard(){
    _isFlipped = false;
    _isGuessed = false;
  }

  ImageCardModel(this._id, this._routePath, this._isFlipped, this._isGuessed, this._cardKey);
}
