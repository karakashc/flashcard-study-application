<template>
    <!-- Display for HomeView, shows all card properties -->
    <div name="home-view" v-if="from === 'home'">
        <div class="scene">
            <div class="card" :class="{ 'is-flipped': card.flipped }" v-on:click.stop="flip($event, card)">
                <div class="card-face front">
                    <div class="heading-section">

                        
                        <div class="heading-text-section">
                            <button class="edit">
                                <router-link v-bind:to="{ name: 'edit-card', params: { cardId: this.card.cardId } }">⚙️</router-link>
                            </button>
                            {{ card.username }}
                        </div>
                        <div class="button-section">
                            <button class="x" v-on:click.stop="deleteCard(card.cardId)">X</button>
                        </div>
                    </div>
                    <div class="front-back-section">{{ card.frontText }}</div>
                    <div class="foot-section">
                        private
                    </div>
                </div>
                <div class="card-face back">

                    <div class="heading-section">

                        
                        <div class="heading-text-section">
                            <button class="edit">
                                <router-link v-bind:to="{ name: 'edit-card', params: { cardId: this.card.cardId } }">⚙️</router-link>
                            </button>

                        </div>
                        <div class="button-section">
                            <button class="x" v-on:mousedown.stop="deleteCard(card.cardId)">X</button>
                        </div>
                    </div>
                    <div class="front-back-section">{{ card.backText }}</div>
                    <div class="foot-section">
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Display for DeckView, shows all card properties except for public status -->
    <div class="card" name="deck-view" v-if="from === 'deck'" v-on:click="flip($event, card)">
        <div class="scene">
            <div class="card" :class="{ 'is-flipped': card.flipped }">
                <div class="card-face front">
                    <div class="heading-section">

                        <div class="heading-text-section">
                            &nbsp;{{ card.username }}
                        </div>
                        
                        <div class="button-section">
                            <button class="x" v-on:click.stop="removeCardFromDeck(deckId, card.cardId)">X</button>
                        </div>
                    </div>
                    <div class="front-back-section">{{ card.frontText }}</div>
                    <div class="foot-section">
                        {{ card.cardTags }}
                    </div>
                </div>




                <div class="card-face back">
                    <div class="heading-section">
                        <div class="heading-text-section">
                            {{ card.username }}
                        </div>
                        <div class="button-section">
                            <button class="x" v-on:click.stop="removeCardFromDeck(deckId, card.cardId)">X</button>
                        </div>
                        
                    </div>
                    <div class="front-back-section">{{ card.backText }}</div>
                    <div class="foot-section">
                        {{ card.cardTags }}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Display for Study Session, shows front and back text only -->
    <div class="card" name="session-view" v-if="from === 'session'" v-on:click="flip($event, card)">
        <div class="scene">
            <div class="card" :class="{ 'is-flipped': card.flipped }">
                <div class="card-face front">
                    <div class="heading-section">

                        <div class="button-section">

                        </div>
                        <div class="heading-text-section">

                        </div>
                    </div>
                    <div class="front-back-section">{{ card.frontText }}</div>
                    <div class="foot-section">

                    </div>

                </div>
                <div class="card-face back">
                    <div class="heading-section">


                        <div class="heading-text-section">

                        </div>
                    </div>
                    <div class="front-back-section"  v-show="showAnswer" >{{ card.backText }}</div>
                    <div class="foot-section">
                        <div class="button-section" v-show="showAnswer">
                            <input type="checkbox" id="correct" name="response" v-bind:checked="card.correct" v-on:click.stop="correctToggle">
                            <label for="answer"> Correct? </label><br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import CardService from '../services/CardService';
import DeckService from '../services/DeckService';
import CreateCard from './CreateCard.vue';

export default {
    props: [
        'card', 'from', 'deckId'],
    emits: ['refresh'],
    data() {
        return {
            cardData: {},
        }
    },
    computed: {
        showAnswer() {
            // We only want to show the answer if we are flipping
            // TO back - otherwise we may see the answer as the card
            // flips back to non-flipped state while moving to next card
            return this.card.flipped;
        }
    },
    methods: {
        correctToggle() {
            this.$store.commit('UPDATE_CORRECT', this.card);
        },
        flip(evt, card) {
            const cardInfo = {
                cardId: card.cardId,
                flipped: !card.flipped,
                correct: card.correct
            }
            this.$store.commit('UPDATE_CARD', cardInfo);

        },
        deleteCard(cardId) {
            if (confirm("Are you sure you want to delete this card? This action cannot be undone.")) {
                CardService.deleteCard(cardId).then((response) => {
                    if (response.status === 200) {
                        // HALIL C KARAKAS: We don't have any mutations called SET_NOTIFICATION in store/index.js folder.
                        // Do we need to keep?: this.$store.commit("SET_NOTIFICATION")
                        // Because if we don't remove, it throws an error in Chrome Dev Tools.
                        this.$store.commit("SET_NOTIFICATION", {
                            message: `Card has been deleted`,
                            type: "success",
                        });
                        this.$store.commit('SET_CARDS_HIDDEN', true);
                        this.$emit('refresh')
                        this.$router.push({ name: "home" });
                    }
                })
                    .catch((error) => {
                        if (error.response) {
                            this.$store.commit(
                                "SET_NOTIFICATION",
                                "Error deleting card. Response received was '" +
                                error.response.statusText +
                                "'."
                            );
                        } else if (error.request) {
                            this.$store.commit(
                                "SET_NOTIFICATION",
                                "Error deleting card. Server could not be reached."
                            );
                        } else {
                            this.$store.commit(
                                "SET_NOTIFICATION",
                                "Error deleting card. Request could not be created."
                            );
                        }
                    });
            }
        },
        removeCardFromDeck(deckId, cardId) {
            if (confirm("Are you sure you want to remove this card from the deck?")) {
                DeckService.removeCardFromDeck(deckId, cardId).then((response) => {
                    if (response.status === 200) {
                        this.$store.commit("SET_NOTIFICATION", {
                            message: `Card has been removed from deck.`,
                            type: "success",
                        });
                        this.$store.commit('SET_CARDS_HIDDEN', true);
                        this.$emit('refresh')
                        this.$router.push({ name: "deck-view", params: { deckId: deckId } });
                    }
                })
                    .catch((error) => {
                        if (error.response) {
                            this.$store.commit(
                                "SET_NOTIFICATION",
                                "Error removing card from deck. Response received was '" +
                                error.response.statusText +
                                "'."
                            );
                        } else if (error.request) {
                            this.$store.commit(
                                "SET_NOTIFICATION",
                                "Error removing card from deck. Server could not be reached."
                            );
                        } else {
                            this.$store.commit(
                                "SET_NOTIFICATION",
                                "Error removing card from deck. Request could not be created."
                            );
                        }
                    });
            }
        }
    },
    created() {
        this.cardData = {
            cardId: this.card.cardId,
            username: this.$store.state.user.username,
            frontText: this.card.frontText,
            backText: this.card.backText,
            cardTags: this.card.cardTags,
            public: this.card.public,
            flipped: false,
            correct: false,
        }
    }

}
</script>

<style scoped>
.card {
    width: 100%;
    height: 100%;
    border-radius: 20px;
    transition: transform 1s;
    transform-style: preserve-3d;
    cursor: pointer;
    position: relative;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: bold;
    border: 2px;
}
.heading-section {
    height: 27px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 16px;
    color: white;
}

.front-back-section {
    height: 117px;
    display: flex;
    flex: wrap;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding: 10px;
    margin-left: 5px;
    margin-right: 5px;
    color: white;
    overflow-wrap: break-word;
/*     overflow-y: auto;
    overflow-x: auto; */
}
.x {
    height: 10%;
    margin-right: 10px;
    border-radius: 10px;
    background: none;
    border: none;
    font-size: 18px;
    font-weight: bold;
    margin-top: 10px;
    padding: 10px 5px;
    opacity: .4;
    transition: all 0.5s ease;
    color: rgb(255, 255, 255);
}
.x:hover, .error {
    opacity: 1;
    transform: rotate(360deg);
}

.edit {
    height: 10%;
    margin-left: -5px;
    border-radius: 10px;
    background: none;
    border: none;
    font-size: 18px;
    font-weight: bold;
    margin-top: 10px;
    padding: 10px 5px;
    opacity: 1;
    transition: all 0.5s ease;
    color: rgb(255, 255, 255);
}
.edit:hover, .error {
    opacity: 1;
    transform: rotate(360deg);
}

.heading-text-section {
    flex-grow: 1;
    margin: 10px;
    text-align: left;
}

a {
    text-decoration: none;
}

.foot-section {
    height: 27px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 16px;
    color: rgb(255, 255, 255);
}

.scene {
    width: 200px;
    height: 180px;
    /* margin: 40px 0; */
    perspective: 600px;

}

.card:hover{
    transform: scale(1.1);
    transition: ease 0.3s;
  }

.card.is-flipped {
    transform: rotateY(180deg);
}

.card-face {
    border-radius: 15px;
    position: absolute;
    width: 100%;
    height: 100%;
    /* line-height: 260px; */
    color: white;
    text-align: center;
    font-size: 20px;
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
}

.card-face.front {
    border-radius: 20px;
    height: 200px;
    width: 300px;
    background-color: rgb(68, 118, 255, 0.8);
    color: #000000;
}

.card-face.back {
    border-radius: 20px;
    height: 200px;
    width: 300px;
    /* background-color: blue; */
    background-color: rgba(74, 167, 110, 0.8);
    transform: rotateY(180deg);
    color: #000000;
    
}


</style>