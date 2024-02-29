<template>
  <div>
    <div id="create-deck">
      <h1 id="deck-head">{{ action }} Deck Form</h1>

      <form v-on:submit.prevent="customizedDeckForm">
        <input
          class="form"
          type="text"
          placeholder="Title"
          v-model="newDeck.deckTitle"
        />
        <br /><br />
        <input
          class="form"
          type="text"
          placeholder="Tags"
          v-model="newDeck.deckTags"
        />
        <br /><br />
        <div>
          <button
            type="submit"
            class="button"
            v-if="action === 'New'"
            @click="refresh()"
          >
            Submit
          </button>
          <button type="submit" class="button" v-if="action === 'Edit'">
            Submit
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import DeckService from "../services/DeckService";

export default {
  props: {
    deck: {
      type: Object,
      required: false,
    },
  },
  data() {
    return {
      newDeck: {},
      action: "",
    };
  },
  methods: {
    refresh() {
      location.reload
        ? location.reload()
        : (location = this.$router.push({ name: "home" }));
    },
    customizedDeckForm() {
      if (this.deck && this.deck.deckId) {
        DeckService.updateDeck(this.deck.deckId, this.newDeck).then((resp) => {
          const deckInfo = {
            deckId: this.newDeck.deckId,
            deckTitle: this.newDeck.deckTitle,
            deckTags: this.newDeck.deckTags,
          };
          this.$store.commit("SET_DECK", this.newDeck);
          this.newDeck = deckInfo;
          this.$store.commit('SHOW_EDIT_DECK', false)
        });
      } else {
        DeckService.createDeck(this.newDeck).then((response) => {
          if (response.status === 201) {
            this.$router.push({ name: "home" });
          } else {
            DeckService.updateDeck(this.newDeck.deckId).then((response) => {
              if (response.status === 200) {
                this.$router.push({
                  name: "deck-view",
                  params: { deckId: this.deck.deckId },
                });
              }
            });
          }
        });
      }
    },
  },
  created() {
    if (this.$route.params.deckId) {
      DeckService.getDeck(this.$route.params.deckId).then((resp) => {
        const deck = resp.data;
        this.newDeck.deckId = deck.deckId;
        this.newDeck.deckTitle = deck.deckTitle;
        this.newDeck.deckTags = deck.deckTags;
        this.$store.commit("SET_DECK", deck);
        this.action = "Edit";
      });
    } else {
      this.action = "New";
    }
  },
};
</script>

<style>
#create-deck {
  display: grid;
  border-radius: 15px;
  justify-content: center;
  text-align: center;
  margin: 50px auto;
  width: 300px;
  height: 200px;
  color: white;
  background-color: #7b68cec7;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}

#deck-head {
  color: white;
  margin-bottom: -10px;
}

.form {
  border-radius: 5px;
  font-family: Arial, Helvetica, sans-serif;
  border: none;
  font-weight: bold;
}

.button {
  border: none;
  color: black;
  background: white;
  border-radius: 5px;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}
</style>
