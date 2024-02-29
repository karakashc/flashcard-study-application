package com.techelevator.dao;

import com.techelevator.exception.FlashCardAppException;
import com.techelevator.model.Card;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcCardDao implements CardDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcCardDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Card> getCards(String username) {
        List<Card> cards = new ArrayList<>();
        String sql = "SELECT * FROM card WHERE username = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, username);
            while(results.next()) {
                cards.add(mapRowToCard(results));
            }
        } catch (DataAccessException dae) {
            String detailedMessage = "Data access exception during: " + dae.getMessage();
            System.out.println(detailedMessage);
        }
        return cards;
    }
    @Override
    public Card getCard(int cardId, String username) {
        String sql = "SELECT * FROM card WHERE card_id = ? AND username = ?;";
        try {
            SqlRowSet result = jdbcTemplate.queryForRowSet(sql, cardId, username);
            if (result.next()) {
                return mapRowToCard(result);
            }
        } catch (DataAccessException dae) {
            String detailedMessage = "Data access exception during: " + dae.getMessage();
            System.out.println(detailedMessage);
        }
        return null;
    }

    @Override
    public List<Card> getCardsForDeck(int deckId, String username) {
        List<Card> deckCards = new ArrayList<>();
        String sql = "SELECT * FROM card JOIN deck_card ON card.card_id = deck_card.card_id " +
                "JOIN deck ON deck_card.deck_id = deck.deck_id WHERE deck.deck_id = ? AND deck.username = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, deckId, username);
            while(results.next()) {
                deckCards.add(mapRowToCard(results));
            }
        } catch (DataAccessException dae) {
            String detailedMessage = "Data access exception during: " + dae.getMessage();
            System.out.println(detailedMessage);
        }
        return deckCards;
    }

    @Override
    public Card createCard(Card newCard, String username) {
        String sql = "INSERT INTO card (username, front_text, back_text, card_tags, is_public) VALUES (?,?,?,?,?) RETURNING card_id";
        try {
            int newCardId = jdbcTemplate.queryForObject(sql, Integer.class, username, newCard.getFrontText(), newCard.getBackText(), newCard.getCardTags(), false);
            newCard.setCardId(newCardId);
            return newCard;
        } catch (DataAccessException dae) {
            throw new FlashCardAppException("Could not create new card. Error: " + dae.getMessage());
        }

    }

    @Override
    public void updateCard(int cardId, Card newCard, String username) {
        String sql = "UPDATE card SET front_text = ?, back_text = ?, card_tags = ? WHERE card_id = ? AND username = ?;";
        try {
            jdbcTemplate.update(sql, newCard.getFrontText(), newCard.getBackText(), newCard.getCardTags(), cardId, username);
        } catch (DataAccessException dae) {
            String detailedMessage = "Data access exception during: " +dae.getMessage();
            System.out.println(detailedMessage);
        }
    }

    @Override
    public void deleteCard(int cardId, String username){
        String sql = "DELETE FROM deck_card USING card WHERE deck_card.card_id = ? AND card.username = ?; " +
                "DELETE FROM card WHERE card_id = ? AND username = ?;";
        try {
            jdbcTemplate.update(sql, cardId, username, cardId, username);
        } catch (DataAccessException dae) {
            String detailedMessage = "Data access exception during: " + dae.getMessage();
            System.out.println(detailedMessage);
        }
    }

    private Card mapRowToCard(SqlRowSet rowSet) {
        Card card = new Card();
        card.setCardId(rowSet.getInt("card_id"));
        card.setUsername(rowSet.getString("username"));
        card.setFrontText(rowSet.getString("front_text"));
        card.setBackText(rowSet.getString("back_text"));
        card.setCardTags(rowSet.getString("card_tags"));
        card.setPublic(rowSet.getBoolean("is_public"));
        return card;
    }

}
