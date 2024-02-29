<template>
  <div>
    <br />
    <br />
    <div class="btn-group">
      <button id="back-to-decks">
        <router-link v-bind:to="{ name: 'home' }">Back to Decks</router-link>
      </button>

      <button id="study-session">
        <router-link v-bind:to="{ name: 'study-session' }"
          >Study Session</router-link
        >
      </button>

      <button id="delete-deck" v-on:click="deleteDeck">Delete Deck</button>
    </div>
    <div id="title-wiz">
      <div id="deck-wiz-display">
        <img class="image" src="../assets/images/DeckWizard.png" />
      </div>
      <div id="title">
        <div class="header">
          <h1>{{ deck.deckTitle }}</h1>
        </div>
        <div class="tags">
          <!-- <h2>({{ deck.deckTags }})</h2> -->
        </div>
        <br />
        <div><SearchBox /></div>
        <br />
        <div class="btn-group">
          <button id="create" v-on:click.prevent="showCardForm">
            Create Card
          </button>
          <button id="create" v-on:click.prevent="showDeckForm">
            Edit Deck
          </button>
        </div>
      </div>
    </div>
    <div class="btn-group">
      <CreateCard id="form" v-if="showAddCard" v-bind:deckId="deck.deckId" />
      <CreateDeck id="form" v-if="showEditDeck" v-bind:deck="deck" />
    </div>

    <!-- {{ filteredCards }} -->
    <div class="card-display">
      <CardsList
        v-bind:cardList="filteredCards"
        v-bind:deckId="deck.deckId"
        from="deck"
        @refresh="loadData"
      />
    </div>
  </div>
</template>

<script>
import CardsList from "../components/CardsList.vue";
import CardService from "../services/CardService";
import DeckService from "../services/DeckService";
import CreateCard from "../components/CreateCard.vue";
import CreateDeck from "../components/CreateDeck.vue";
import SearchBox from "../components/SearchBox.vue";
export default {
    components: {
        CardsList,
        CreateCard,
        CreateDeck,
        SearchBox
    },
    data() {
        return {
            newCard: {},
            // showAddCard: false,
            // showEditDeck: false,
            from: "deck",
            searchTerm: ''
        };
    },
    computed: {
        deck() {
            return this.$store.state.currDeck;
        },
        cardList() {
            return this.$store.state.currCards;
        },
        filteredCards() {
            const searchTerm = this.$store.state.searchTerm;
            const matchText = searchTerm.toLowerCase();
            return this.cardList.filter(card =>
                card.cardTags.toLowerCase().includes(matchText)
            );
        },
        showEditDeck() {
            return this.$store.state.showEditDeck;
        },
        showAddCard() {
            return this.$store.state.showAddCard;
        }
    },
    methods: {
        showCardForm() {
            // this.showAddCard = !this.showAddCard;
            this.$store.commit('SHOW_ADD_CARD', !this.$store.state.showAddCard);
        },
        showDeckForm() {
            // this.showEditDeck = !this.showEditDeck
            this.$store.commit('SHOW_EDIT_DECK', !this.$store.state.showEditDeck);
        },
        loadData() {
            DeckService.getCardsForDeck(this.deck.deckId)
                .then((response) => {
                    let cards = response.data;
                    for (let i = 0; i < cards.length; i++) {
                        cards[i].flipped = false;
                        cards[i].completed = null;
                    }
                    this.$store.commit('SET_CARD_LIST', cards);
                    // Show cards
                    this.$store.commit('SET_CARDS_HIDDEN', false);
                })
        },
        deleteDeck() {
            if (
                confirm(
                    "Are you sure you want to delete this deck and all associated cards? This action cannot be undone."
                )
            ) {
                DeckService.deleteDeck(this.deck.deckId)
                    .then((response) => {
                        if (response.status === 200) {
                            this.$router.push({ name: "home" });
                        }
                    })
            }
        },
    },
    created() {
        this.searchTerm = '';
        this.$store.commit('UPDATE_SEARCH_TERM', this.searchTerm);
        let deckId = parseInt(this.$route.params.deckId);
        // Get deck with id so we can use deck attributes.
        DeckService.getDeck(deckId).then(resp => {
            this.$store.commit('SET_DECK', resp.data);
        });
        // Hide cards so that they aren't visible as they flip back to
        // fronts
        this.$store.commit('SET_CARDS_HIDDEN', true);
        DeckService.getCardsForDeck(deckId)
            .then((response) => {
                let cards = response.data;
                for (let i = 0; i < cards.length; i++) {
                    cards[i].flipped = false;
                    cards[i].completed = null;
                }
                this.$store.commit('SET_CARD_LIST', cards);
            });
    },
   
};
</script>

<style scoped>
#title-wiz {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-areas: "image title .";
}

#title {
  grid-area: title;
  margin-top: 20%;
}

.image {
  display: flex;
  justify-content: center;
  width: 1000px;
  margin: -10px -250px -100px -400px;
}

#deck-wiz-display {
  display: flex;
  grid-area: image;
  justify-content: center;
}

.cards {
  display: flex;
  align-items: center;
  justify-content: center;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  font-family: Arial, Helvetica, sans-serif;
}

.header {
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: Arial, Helvetica, sans-serif;
  font-size: x-large;
  font-weight: bold;
}

.tags {
  display: flex;
  align-items: center;
  justify-content: center;
  
  font-family: Arial, Helvetica, sans-serif;
}

.header h1 {
  justify-content: center;
  flex-grow: 1;
}

.btn-group {
  display: flex;
  justify-content: space-evenly;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  border: none;
  margin: 10px;
}

button {
  border-radius: 10px;
  height: 40px;
  border: none;
}

button:hover {
  transform: scale(1.1);
  transition: ease 0.3s;
}

#delete-deck:hover {
  cursor: pointer;
}

#study-session {
  text-decoration: none;
  font-size: large;
  align-items: center;
  background-color: rgba(74, 167, 110, 0.765);
  color: white;
}

#back-to-decks {
  text-decoration: none;
  font-size: large;
  align-items: center;
  background-color: rgb(224, 205, 38);
  color: white;
}

#delete-deck {
  align-items: center;
  font-size: large;
  background-color: rgba(182, 0, 0, 0.765);
  font-weight: bold;
  color: white;
  width: 140px;
}

#create {
  align-items: center;
  margin-top: 50px;
  font-size: large;
  background-color: rgba(74, 167, 110, 0.765);
  font-weight: bold;
  color: white;
  width: 120px;
  height: 40px;
}

.card-display {
  display: flex;
  flex-wrap: wrap;
  margin: 20px;
  column-gap: 140px;
  row-gap: 50px;
  justify-content: center;
  /* align-items: center; */
}

.forms {
  display: flex;
  justify-content: space-around;
}

a {
  text-decoration: none;
  color: white;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}
</style>