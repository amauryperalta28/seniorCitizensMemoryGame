import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:senior_citizens_memory_games/src/assets.dart';
import 'package:senior_citizens_memory_games/src/models/models.dart';

class MemoryGameService with ChangeNotifier {
  List<ImageCardModel> imagesCard;

  MemoryGameService() {
    imagesCard = [];
    imagesCard.add(new ImageCardModel(
        1, Assets.babosaPath, false, false, GlobalKey<FlipCardState>()));
    imagesCard.add(new ImageCardModel(
        1, Assets.babosaPath, false, false, GlobalKey<FlipCardState>()));

    imagesCard.add(new ImageCardModel(
        2, Assets.ballenaPath, false, false, GlobalKey<FlipCardState>()));
    imagesCard.add(new ImageCardModel(
        2, Assets.ballenaPath, false, false, GlobalKey<FlipCardState>()));

    imagesCard.add(new ImageCardModel(
        3, Assets.benaoPath, false, false, GlobalKey<FlipCardState>()));
    imagesCard.add(new ImageCardModel(
        3, Assets.benaoPath, false, false, GlobalKey<FlipCardState>()));

    imagesCard.add(new ImageCardModel(
        4, Assets.cangrejoPath, false, false, GlobalKey<FlipCardState>()));
    imagesCard.add(new ImageCardModel(
        4, Assets.cangrejoPath, false, false, GlobalKey<FlipCardState>()));

    imagesCard.add(new ImageCardModel(
        5, Assets.medusaPath, false, false, GlobalKey<FlipCardState>()));
    imagesCard.add(new ImageCardModel(
        5, Assets.medusaPath, false, false, GlobalKey<FlipCardState>()));

    imagesCard.add(new ImageCardModel(
        6, Assets.monoPath, false, false, GlobalKey<FlipCardState>()));
    imagesCard.add(new ImageCardModel(
        6, Assets.monoPath, false, false, GlobalKey<FlipCardState>()));

    imagesCard.add(new ImageCardModel(
        7, Assets.patoPath, false, false, GlobalKey<FlipCardState>()));
    imagesCard.add(new ImageCardModel(
        7, Assets.patoPath, false, false, GlobalKey<FlipCardState>()));

    imagesCard.add(new ImageCardModel(
        8, Assets.pulpoPath, false, false, GlobalKey<FlipCardState>()));
    imagesCard.add(new ImageCardModel(
        8, Assets.pulpoPath, false, false, GlobalKey<FlipCardState>()));
  }

  bool _isThereAnyMatch() {
    final matches = imagesCard
        .where((card) => (!card.isGuessed) && card.isFlipped)
        .toList();

    if (matches.length == 0) return false;

    final first = matches.first;

    bool result =
        matches.length > 1 && matches.every((card) => card.id == first.id);
    return result;
  }

  void hideCardsThatFailedToBeDiscovered() {
    List<ImageCardModel> cardMatches = imagesCard
        .where((card) => (!card.isGuessed) && card.isFlipped)
        .toList();

    cardMatches.forEach((card) {
      card.flipCard();
    });

    notifyListeners();
  }

  void flipCard(int index) {


    ImageCardModel imageCard = imagesCard[index];

    if (!imageCard.isGuessed) {
      imagesCard[index].flipCard();
      imagesCard[index].cardKey.currentState.toggleCard();
         notifyListeners();
    }

        if (_isThereAnyMatch()) {
      _markAllFlippedCardsAsGuessed();
    } else {
      _flipAllCards();
    }



  }

  checkGame(){
    if (_isThereAnyMatch()) {
      _markAllFlippedCardsAsGuessed();
    } else {
      _flipAllCards();
    }
  }

  void _markAllFlippedCardsAsGuessed() {
    List<ImageCardModel> matches = imagesCard
        .where((card) => (!card.isGuessed) && card.isFlipped)
        .toList();

    matches.forEach((element) {
      element.markAsGuessed();
    });
  }

  void _flipAllCards() {
    List<ImageCardModel> matches = imagesCard
        .where((card) => (!card.isGuessed) && card.isFlipped)
        .toList();
    if (matches.length == 2) {
      matches.forEach((element) async {
        element.flipCard();
              await Future.delayed(Duration(seconds: 1));
        element.cardKey.currentState.toggleCard();
      });
    }
  }

  bool didTheGameFinish() {
    return imagesCard.every((element) => element.isGuessed);
  }

  void resetGame(){

    for (var i = 0; i < imagesCard.length; i++) {
      imagesCard[i].resetCard();
       imagesCard[i].cardKey.currentState.toggleCard();
    }

  }
}
