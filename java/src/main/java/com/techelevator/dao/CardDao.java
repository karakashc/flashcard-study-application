package com.techelevator.dao;

import com.techelevator.model.Card;
import java.util.List;

public interface CardDao {

   List<Card> getCards(String username);

   Card getCard(int cardId, String username);

   List<Card> getCardsForDeck(int deckId, String username);

   Card createCard(Card newCard, String username);

   void updateCard(int cardId, Card newCard, String username);

   void deleteCard(int cardId, String username);

}
