package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.validation.constraints.NotEmpty;

public class Card {

    private int cardId;

    private String username;

    @NotEmpty
    private String frontText;
    @NotEmpty
    private String backText;
    @NotEmpty
    private String cardTags;
    @JsonIgnore
    private boolean isPublic;

    public Card() {
    }

    public Card(int cardId, String username, String frontText, String backText, String cardTags, boolean isPublic) {
        this.cardId = cardId;
        this.username = username;
        this.frontText = frontText;
        this.backText = backText;
        this.cardTags = cardTags;
        this.isPublic = isPublic;
    }

    public int getCardId() {
        return cardId;
    }

    public void setCardId(int cardId) {
        this.cardId = cardId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFrontText() {
        return frontText;
    }

    public void setFrontText(String frontText) {
        this.frontText = frontText;
    }

    public String getBackText() {
        return backText;
    }

    public void setBackText(String backText) {
        this.backText = backText;
    }

    public String getCardTags() {
        return cardTags;
    }

    public void setCardTags(String cardTags) {
        this.cardTags = cardTags;
    }

    public boolean isPublic() {
        return isPublic;
    }

    public void setPublic(boolean aPublic) {
        isPublic = aPublic;
    }

}
