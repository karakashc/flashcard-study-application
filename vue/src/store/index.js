import { createStore as _createStore } from 'vuex';
import axios from 'axios';

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {},
      currDeck: {},
      currCard:{},
      currCards: [],
      hideCards: false,
      searchTerm: '',
      editCardMode: false,
      editModeDeckId: null,
      showAddCard: false,
      showEditDeck: false,
    },
    mutations: {
      SHOW_ADD_CARD(state, showAddCard){
        state.showAddCard = showAddCard;
      },
      SHOW_EDIT_DECK(state, showEditDeck){
        state.showEditDeck = showEditDeck;
      },
      SET_AUTH_TOKEN(state, token) {
        state.token = token;
        localStorage.setItem('token', token);
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
      },
      SET_USER(state, user) {
        state.user = user;
        localStorage.setItem('user', JSON.stringify(user));
      },
      LOGOUT(state) {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        state.token = '';
        state.user = {};
        axios.defaults.headers.common = {};
      },
      SET_DECK(state, deck) {
        state.currDeck = deck;
      },
      SET_CARD(state, card) {
        state.currCard = card;
      },
      SET_CARD_LIST(state, cardList) {
        state.currCards = cardList;
      },
      ADD_CARD_CURRDECK(state, card) {
        state.currCards.push(card);
      },
      UPDATE_CARD(state, cardInfo) {
        const card = state.currCards.find( crd => crd.cardId == cardInfo.cardId);
        if (card) {
          card.flipped = cardInfo.flipped;
          card.correct = cardInfo.correct;
        }
      },
      UPDATE_CORRECT(state, card) {
        card.correct = !card.correct;
      },
      SET_ALL_CARDS_TO_FRONT(state) {
        state.currCards.forEach( card => card.flipped = false);
      },
      SET_CARDS_HIDDEN(state, hidden) {
        state.hideCards = hidden;
      },
      UPDATE_SEARCH_TERM(state, searchText) {
        state.searchTerm = searchText;
      }, 
      UPDATE_EDIT_STATUS(state, inEditMode) {
        state.editCardMode = inEditMode;
      },
      SET_EDIT_DECK_ID(state, id) {
        state.editModeDeckId = id;
      }
    },
  });
  return store;
}
