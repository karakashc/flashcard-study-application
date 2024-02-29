<template>
  <div class="home">
    <h1 id="my-decks">My Decks</h1>

    <div class="deck-wiz">
      <div id="deck-display">
        <DecksList v-bind:deckList="deckList" />
      </div>
      <div id="wiz-display">
        <img class="home-wiz" src="../assets/images/HomeWizard.png" />
      </div>
    </div>

    
    <div class="btn-group">
      <button id="create" v-on:click.prevent="showDeckForm">Create Deck</button>
    </div>
    <div class="btn-group">
      <CreateDeck id="form" v-if="showAddDeck" />
    </div>
    
    <br />
    <br />
    <SearchBox class="search"/>
    <br />
    <div class="btn-group">
      <button id="create" v-on:click.prevent="showCardForm">Create Card</button>
    </div>
    <div class="btn-group">
      <CreateCard id="form" v-if="showAddCard" />
    </div>
   
    <div class="card-display" v-show="showCards">
      <CardsList v-bind:cardList="filteredCards" from='home' @refresh="loadCards" />
    </div>
  </div>
</template>

<script>
import DecksList from '../components/DecksList.vue';
import CardsList from '../components/CardsList.vue';
import DeckService from "../services/DeckService.js";
import CardService from "../services/CardService.js";
import CreateCard from "../components/CreateCard.vue";
import CreateDeck from '../components/CreateDeck.vue';
import SearchBox from '../components/SearchBox.vue';

export default {
  name: "home",
  data() {
    return {
      deckList: [],
      showAddCard: false,
      showAddDeck: false,
    };
  },
  computed: {
    cardList() {
      return this.$store.state.currCards;
    },
    showCards() {
      return !this.$store.state.hideCards;
    },
    filteredCards() {

      // return this.cardList;
      const searchTerm = this.$store.state.searchTerm;
      const matchText = searchTerm.toLowerCase();
      return this.cardList.filter(card => {
        return card.cardTags.toLowerCase().includes(matchText)
      });
    }
  },
  components: {
    DecksList,
    CardsList,
    CreateCard,
    CreateDeck,
    SearchBox
  },
  created() {
    // Hide cards so that they aren't visible as they flip back to
    // fronts
    this.$store.commit('SET_CARDS_HIDDEN', true);
    DeckService.getDecks().then((response) => {
      this.deckList = response.data;
    });
    this.loadCards()
    this.searchTerm = '';
    this.$store.commit('UPDATE_SEARCH_TERM', this.searchTerm);
    this.$store.commit('UPDATE_EDIT_STATUS', false);
  },
  methods: {
    // refresh() {
    //   location.reload ? location.reload() : location = this.$router.push({name: "home"});
    // },
    showCardForm() {
      this.showAddCard = !this.showAddCard;
    },
    showDeckForm() {
      this.showAddDeck = !this.showAddDeck;
    },
    loadCards() {
      CardService.getCards().then((response) => {
        let cards = response.data;
        for (let i = 0; i < cards.length; i++) {
          cards[i].flipped = false;
          cards[i].completed = null;
        }
        this.$store.commit('SET_CARD_LIST', response.data);

        // Once done loading, show the cards
        this.$store.commit('SET_CARDS_HIDDEN', false)
      })
    },
    goToCreateCard() {
      this.$router.push({ name: 'create-card' });
    }
  }
};
</script>

<style>

body {
  background-image: url("https://www.wallpaperboulevard.com/Images/product/cream-white-triangle-geometric-shapes-w-qsac-l.jpg");
  background-size: stretch;
}

h1 {
  border-radius: 10px;
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
  color: black;
}

#my-decks {
  font-size: 40px;
}

.create-deck-button {
  display: flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
  border-radius: 10px;
  border-color: #3498db;
}

.create-card-button {
  display: flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
  border-radius: 10px;
  border-color: #3498db;
}

.router {
  display: flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
  padding: 12px;
  color: #3498db;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.home {
  column-gap: 25px;
  row-gap: 25px;
  align-items: center;
}

.deck-wiz {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
  grid-template-areas: ". deck deck deck image";
}

#deck-display {
  display: flex;
  grid-area: deck;
  flex-wrap: wrap;
  column-gap: 25px;
  row-gap: 10px;
  justify-content: center;
  align-items: center;
}

#wiz-display {
  grid-area: image;
}

.card-display {
  display: flex;
  flex-wrap: wrap;
  margin: 20px;
  padding: 50px;
  column-gap: 140px;
  row-gap: 50px;
  justify-content: center;
  align-items: center;
}

.btn-group {
  display: flex;
  justify-content: center;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  border: none;
  margin-top: 10px;
}

#create {
  align-items: center;
  margin-top: 10px;
  font-size: large;
  background-color: rgba(74, 167, 110, 0.765);
  font-weight: bold;
  color: white;
  width: 120px;
  height: 40px;
  border-radius: 15px;
  border: none;
}

#create:hover {
  transform: scale(1.1);
  transition: ease 0.3s;
}

.home-wiz{
  display: inline-block;
  width: 300px;
}
</style>
