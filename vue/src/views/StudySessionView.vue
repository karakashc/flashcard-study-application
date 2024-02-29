<template>
  <div class="card">
    <Card v-bind:card="currCard" from="session" v-bind:deckId="$route.params.deckId" v-show="showCard" />
  </div>
  <br />
  <br />
  
  <div id="next-card-div">
    <button id="next-card-button" v-on:click="nextCard" v-show="cardIndex < cardList.length - 1"><span>Next Card</span></button>
  </div>

  <div class="popup" id="endSession" ref="endSession">
    <p>Session Complete!</p>
    <p>You correctly answered {{ correctCount }} of {{ this.cardList.length }} cards.</p>
    
    <br />
    <button id="back-to-deck" @click.prevent="toDeckView"><span>Back to Deck</span></button>
  </div>

  <div id="end-session-div">
    <button id="end-session" @click.prevent="show()"><span>End Session</span></button>
  </div>
  <div class="avatar">
      <img class="study-wiz" src="../assets/images/StudyWizard.png" />
    </div>
  
</template>

<script>

// import CardService from '../services/CardService';
import Card from '../components/FlipCard.vue';

export default {
  name: "home",
  data() {
    return {
      cardIndex: 0,
      // cardList: [],
    };

  },

  components: {
    Card
  },

  methods: {
    nextCard() {
      this.$store.commit('UPDATE_CARD', {
        cardId: this.currCard.cardId,
        flipped: false,
        correct: this.currCard.correct
      });

      // Hide cards as we move to next card
      this.$store.commit('SET_CARDS_HIDDEN', true);
      this.cardIndex++;

      // Show the cards
      this.$store.commit('SET_CARDS_HIDDEN', false);

    },

    show() {
      return this.$refs.endSession.style.display = 'block';
    },

    toDeckView() {
      this.$router.push({name: "deck-view", params: {deckId: this.$route.params.deckId}})
    }
  },

  computed: {
    showCard() {
      return !this.$store.state.hideCards;
    },
    cardList() {
      return this.$store.state.currCards;
    },
    currCard() {
      return this.cardList[this.cardIndex];
    },
    correctCount() {
      let count = 0;
      for (let i = 0; i < this.cardList.length; i++) {
        if (this.cardList[i].correct == true) {
          count++;
        }
      } return count;
    }
  },
  created() {
    // Hide cards while flipping all back to front
    this.$store.commit('SET_CARDS_HIDDEN', true);
    this.$store.commit('SET_ALL_CARDS_TO_FRONT');
    // Show cards
    this.$store.commit('SET_CARDS_HIDDEN', false);
  },
}
</script>

<style>
.card {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 2%;
  margin-bottom: 1%;
}

.count {
  display: flex;
  align-items: center;
  justify-content: center;
}

#next-card-div {
  display: flex;
  justify-content: center;
  
}



.popup {
  display: none;
  text-align: center;
  justify-items: center;
  border-radius: 20px;
  position: fixed;
  font-family:Arial, Helvetica, sans-serif;
  padding: 10px;
  width: 320px;
  left: 50%;
  margin-left: -170px;
  height: 225px;
  margin-top: -300px;
  background: #7b68cec5;
}

#endSession:before {
  position: absolute;
  border-radius: 20px;
  content: "";
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  background: #7b68cee0;
  z-index: -1;
}

p {
  color: white;
  font-size: larger;
}

#end-session-div {
  display: flex;
  justify-content: center;
  margin-top: 50px;

}

/* #end-session {
  display: flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
  font-size: large;
  color: white;
  background-color: rgb(224, 205, 38);
  border: none;
  border-radius: 20px;
  align-items: center;
  align-content: center;
  text-align: center;
  font-weight: bold;
  font-size: large;
  height: 40px;
  width: 130px;
  text-decoration: none;
  cursor: pointer;
} */

#end-session {
  font-size: large;
  font-weight: bold;
  border: none;
  padding: 10px;
  color: white;
  background-color: rgb(224, 205, 38);
  border-radius: 20px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

#end-session span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

#end-session span:after {
  content: '\25a0';
  font-size: xx-large;
  position: absolute;
  margin-top: -12px;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

#end-session:hover span {
  padding-right: 25px;
}

#end-session:hover span:after {
  opacity: 1;
  right: 0;
}

#next-card-button {
  font-size: large;
  font-weight: bold;
  border: none;
  padding: 10px;
  color: white;
  background-color: rgba(74, 167, 110, 0.8);
  border-radius: 20px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

#next-card-button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

#next-card-button span:after {
  content: '\00bb';
  font-size: xx-large;
  position: absolute;
  margin-top: -10px;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

#next-card-button:hover span {
  padding-right: 25px;
}

#next-card-button:hover span:after {
  opacity: 1;
  right: 0;
}

#back-to-deck {
  border-radius: 15px;
  border: none;
  color: #7b68cee0;
  font-weight: bold;
  height: 25px;
}

#back-to-deck span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

#back-to-deck span:after {
  content: '\00ab';
  font-size: xx-large;
  position: absolute;
  margin-top: -13px;
  opacity: 0;
  top: 0;
  left: -20px;
  transition: 0.5s;
}

#back-to-deck:hover span {
  padding-left: 20px;
}

#back-to-deck:hover span:after {
  opacity: 1;
  left: 0;
}

.avatar {
  display: flex;
  justify-content: center;
 
}

.study-wiz{
  width: 1000px;
  margin: 0px -150px -300px 0px;
}
</style>