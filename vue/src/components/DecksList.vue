<template>
  <div class="decks-container" v-for="(deck, index) in deckList" v-bind:key="index" >
    <div class="deck-item" v-on:click.stop.prevent="showDeck(deck)">
      <div class="deck-info-text">
        <h2>{{  deck.deckTitle  }}</h2>
        <h4>Created by {{  deck.username  }}</h4>
      </div>
    </div>
  </div>
</template>

<script>
import DeckService from '../services/DeckService';

export default {
  props: ['deckList'],
  methods: {
    showDeck(deck){
      this.$store.commit('SET_DECK', deck);
      if (!this.isEditMode) {
        this.$router.push({ name: 'deck-view', params: { deckId: deck.deckId } });
      } else {
        this.$store.commit('SET_EDIT_DECK_ID', deck.deckId);
      }
    }
  },
  computed: {
    isEditMode() {
      return this.$store.state.editCardMode;
    }
  },
  created() {
    this.$store.commit('SET_EDIT_DECK_ID', null);
  }
};
</script>

<style scoped>
h2{
  color:white;
  font-size: 18px;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}

h4{
  font-family: Arial, Helvetica, sans-serif;
  color:white;
  font-size: 12px;
  font-weight: bold;
}

.decks-container { 
  display: flex;
  flex-wrap: wrap;
  column-gap: 25px;
  row-gap: 25px;
  justify-content: center;
  text-align: center;
}

.deck-item {
  display: flex;
  border-radius: 15px;
  padding: 10px;
  margin: 10px;
  border: 10px;
  width: 180px;
  height: 120px;
  background-color:#7b68cec7;
  font-family: Arial, Helvetica, sans-serif;
  justify-content: center;
  align-items: center;
}
.deck-item:hover{
    transform: scale(1.1);
    transition: all 0.3s ease;
  }
</style>
