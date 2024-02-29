package com.techelevator.dao;

import com.techelevator.model.Deck;
import java.util.List;

public interface DeckDao {

    List<Deck> getDecks(String username);

    Deck getDeck(int deckId, String username);

    Deck createDeck(Deck newDeck, String username);

    void updateDeck(int deckId, Deck newDeck, String username);

    void deleteDeck(int deckId, String username);

    void addCardToDeck(int deckId, int cardId, String username);

    void removeCardFromDeck(int deckId, int cardId, String username);

}
