<template>
  <div class="cards-container" v-for="(card, index) in cardList" v-bind:key="index">
    <FlipCard v-bind:card="card" v-bind:from="from" v-bind:deckId="deckId" @refresh="refresh"/>
   
  </div>
</template>
  
<script>
import FlipCard from '../components/FlipCard.vue';
import CardService from '../services/CardService';

export default {
  props: ['cardList', 'from', 'deckId'],
  emits: ['refresh'],
  components: {
    FlipCard 
  },
  methods: {
    refresh() {
      this.$emit('refresh')
    },
  },
};
</script>

<style scoped>


</style>
