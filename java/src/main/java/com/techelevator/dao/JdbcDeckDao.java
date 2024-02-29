package com.techelevator.dao;

import com.techelevator.exception.FlashCardAppException;
import com.techelevator.model.Deck;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcDeckDao implements DeckDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcDeckDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Deck> getDecks(String username) {
        List<Deck> decks = new ArrayList<>();
        String sql = "SELECT * FROM deck WHERE username = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, username);
            while(results.next()) {
                decks.add(mapRowToDeck(results));
            }
        } catch (DataAccessException dae) {
            String detailedMessage = "Data access exception during: " + dae.getMessage();
            System.out.println(detailedMessage);
        }
        return decks;
    }

    @Override
    public Deck getDeck(int deckId, String username) {
        Deck newDeck = new Deck ();
        String sql = "SELECT * FROM deck WHERE deck_id = ? AND username = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, deckId, username);
            if(results.next()) {
                newDeck = mapRowToDeck(results);
                return newDeck;
            }
        } catch (DataAccessException dae) {
            String detailedMessage = "Data access exception during: " + dae.getMessage();
            System.out.println(detailedMessage);
        }
        return newDeck;
    }

    @Override
    public Deck createDeck(Deck newDeck, String username){
        String sql = "INSERT INTO deck (username, deck_title, deck_tags, is_public) VALUES (?,?,?,?) RETURNING deck_id";
        try {
            int newDeckId = jdbcTemplate.queryForObject(sql, Integer.class, username, newDeck.getDeckTitle(), newDeck.getDeckTags(), false);
            newDeck.setDeckId(newDeckId);
            return newDeck;
        } catch (DataAccessException dae) {
            throw new FlashCardAppException("Could not create new deck. Error: " + dae.getMessage());
        }
    }

    @Override
    public void updateDeck(int deckId, Deck newDeck, String username) {
        String sql = "UPDATE deck SET deck_title = ?, deck_tags = ? WHERE deck_id = ? AND username = ?;";
        try {
            jdbcTemplate.update(sql, newDeck.getDeckTitle(), newDeck.getDeckTags(), deckId, username);
        } catch (DataAccessException dae) {
            String detailedMessage = "Data access exception during: " + dae.getMessage();
            System.out.println(detailedMessage);
        }
    }

    @Override
    public void deleteDeck(int deckId, String username) {
        String sql = "DELETE FROM deck_card USING deck WHERE deck_card.deck_id = ? AND deck.username = ?; " +
                "DELETE FROM deck WHERE deck_id = ? AND username = ?;";
        try {
            jdbcTemplate.update(sql, deckId, username, deckId, username);
        } catch (DataAccessException dae) {
            String detailedMessage = "Data access exception during: " + dae.getMessage();
            System.out.println(detailedMessage);
        }
    }

    @Override
    public void addCardToDeck(int deckId, int cardId, String username) {
        String sql = "INSERT INTO deck_card (deck_id, card_id) " +
                "VALUES ((SELECT deck_id FROM deck WHERE username = ? AND deck_id = ?), (SELECT card_id FROM card WHERE username = ? AND card_id = ?));";
        try {
            jdbcTemplate.update(sql, username, deckId, username, cardId);
        } catch (DataAccessException dae) {
            String detailedMessage = "Data access exception during: " +dae.getMessage();
            System.out.println(detailedMessage);
        }
    }

    @Override
    public void removeCardFromDeck(int deckId, int cardId, String username) {
        String sql = "DELETE FROM deck_card USING card WHERE deck_card.deck_id = ? AND deck_card.card_id = ? AND card.username = ?;";
        try {
            jdbcTemplate.update(sql, deckId, cardId, username);
        } catch (DataAccessException dae) {
            String detailedMessage = "Data access exception during: " + dae.getMessage();
            System.out.println(detailedMessage);
        }
    }

    private Deck mapRowToDeck(SqlRowSet rowSet) {
        Deck deck = new Deck();
        deck.setDeckId(rowSet.getInt("deck_id"));
        deck.setUsername(rowSet.getString("username"));
        deck.setDeckTitle(rowSet.getString("deck_title"));
        deck.setDeckTags(rowSet.getString("deck_tags"));
        deck.setPublic(rowSet.getBoolean("is_public"));
        return deck;
    }

}
