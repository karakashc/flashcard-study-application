<template>
  <div id="capstone-app">
    <div id="nav">
      <div id="nav-style">
        <router-link v-bind:to="{ name: 'home' }">Home</router-link>
      </div>
      <div id="nav-style" v-if="$store.state.token != ''">
        <router-link v-bind:to="{ name: 'logout' }">Logout</router-link>
      </div>
    </div>
    <router-view />
  </div>
</template>

<style scoped>
#nav {
  display: flex;
  justify-content: center;
}

#nav-style {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  text-align: center;
  width: 30px;
  height: 15px;
  margin: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px 20px;
  background: #f48b2fb7;
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
}

#nav-style:hover {
  transform: scale(1.1);
  transition: ease 0.3s;
}

a {
  text-decoration: none;
  color: white;
}
</style>
