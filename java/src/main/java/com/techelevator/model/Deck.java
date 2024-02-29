package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.validation.constraints.NotEmpty;

public class Deck {
    private int deckId;
    private String username;
    @NotEmpty
    private String deckTitle;
    @NotEmpty
    private String deckTags;
    @JsonIgnore
    private boolean isPublic;

    public Deck() {
    }

    public Deck(int deckId, String username, String deckTitle, String deckTags, boolean isPublic) {
        this.deckId = deckId;
        this.username = username;
        this.deckTitle = deckTitle;
        this.deckTags = deckTags;
        this.isPublic = isPublic;
    }

    public int getDeckId() {
        return deckId;
    }

    public void setDeckId(int deckId) {
        this.deckId = deckId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDeckTitle() {
        return deckTitle;
    }

    public void setDeckTitle(String deckTitle) {
        this.deckTitle = deckTitle;
    }

    public String getDeckTags() {
        return deckTags;
    }

    public void setDeckTags(String deckTags) {
        this.deckTags = deckTags;
    }

    public boolean isPublic() {
        return isPublic;
    }

    public void setPublic(boolean aPublic) {
        isPublic = aPublic;
    }

}
