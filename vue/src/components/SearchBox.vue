<template>
<div class="search-box-container">
    <input id="search-box" type="text" placeholder="Enter search term here!" v-model="searchTerm" v-on:keyup="updateSearchTerm"/>
    <label for="search-box">Filter</label>
  </div>
</template>

<script>
export default {
    name: 'search-box',
    data() {
        return {
            searchTerm: ''
        }
    },
    methods: {
        updateSearchTerm() {
            // update searchTerm in store so other components can use it
            // this.searchTerm = this.searchTerm.toUpperCase();

            /* DO NOT DO THIS!!!! */
            // this.$store.state.searchTerm = this.searchTerm;
            this.$store.commit('UPDATE_SEARCH_TERM',  this.searchTerm);
        }
    }
}
</script>

<style>
.search-box-container {
    display: flex;
    justify-content: center;
}
#search-box {
    display: flex;
    border-radius: 10px;
    border: none;
    width: 175px;
}
div.search-box-container>label {
    display: flex;
    justify-content: center;
    padding-left: 10px;
    font-weight: bold;
    font-family: Arial, Helvetica, sans-serif;
}
</style>