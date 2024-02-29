import axios from 'axios';

export default {

    getDecks() {
        return axios.get('/deck');
    },

    getDeck(deckId) {
        return axios.get(`/deck/${deckId}`);
    },

    getCardsForDeck(deckId) {
        return axios.get(`/deck/${deckId}/cards`);
    },

    createDeck(deck) {
        return axios.post(`/deck/create`, deck);
    },

    addCard(deckId, cardId) {
        return axios.post(`/deck/${deckId}/${cardId}`);
    },

    updateDeck(deckId, deck){
        return axios.put(`/deck/${deckId}`, deck);
    },

    removeCardFromDeck(deckId, cardId){
        return axios.delete(`/deck/${deckId}/${cardId}`);
    },

    deleteDeck(deckId) {
        return axios.delete(`/deck/${deckId}`);
    }
}