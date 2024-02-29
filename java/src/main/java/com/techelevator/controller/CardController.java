package com.techelevator.controller;

import com.techelevator.dao.JdbcCardDao;
import com.techelevator.dao.JdbcUserDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Card;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class CardController {

    final private JdbcCardDao cardDao;

    final private UserDao userDao;

    public CardController(JdbcCardDao cardDao, JdbcUserDao userDao) {
        this.cardDao = cardDao;
        this.userDao = userDao;
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/card")
    public List<Card> getCards(Principal principal) {
        return cardDao.getCards(principal.getName());
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/card/{cardId}")
    public Card getCard(@PathVariable int cardId, Principal principal) {
        return cardDao.getCard(cardId, principal.getName());
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/deck/{deckId}/cards")
    public List<Card> getCardsForDeck(@PathVariable int deckId, Principal principal) {
        return cardDao.getCardsForDeck(deckId, principal.getName());
    }

    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/card/create")
    public Card createCard(@Valid @RequestBody Card newCard, Principal principal) {
        return cardDao.createCard(newCard, principal.getName());
    }

    @PreAuthorize("isAuthenticated()")
    @PutMapping("/card/{cardId}")
    public void updateCard(@PathVariable int cardId, @Valid @RequestBody Card newCard, Principal principal) {
        cardDao.updateCard(cardId, newCard, principal.getName());
    }

    @PreAuthorize("isAuthenticated()")
    @DeleteMapping("/card/{cardId}")
    public void deleteCard(@PathVariable int cardId, Principal principal) {
        cardDao.deleteCard(cardId, principal.getName());
    }

}
