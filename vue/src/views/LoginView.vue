<template>
  <div id="login">
    
    <form v-on:submit.prevent="login">
      <h1> Welcome to Flash Card App!</h1>
      <h3>Please Sign In</h3>
      <div class="alert" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div class="alert" role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <!-- <label for="username">Username</label> -->
        <input class="input" type="text" id="username" placeholder="Enter your username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <!-- <label for="password">Password</label> -->
        <input class="input1" type="password" id="password" placeholder="Enter your password" v-model="user.password" required />      </div>
      <div>
        <button type="submit">Sign In</button>
      </div>
      <p>
        <router-link class="link" v-bind:to="{ name: 'register' }">Need an account? Sign up!</router-link>
      </p>
    </form>
    
  </div>
  <div class="avatar">
      <img class="login-wiz" src="../assets/images/LoginWizard.png" />
    </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>
body {
  font-family:Arial, Helvetica, sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
}

h1{
  color: white;
  font-family:Arial, Helvetica, sans-serif;
  font-weight: bold;
  margin: 10px;
}

h3 {
  color: white;
  font-family:Arial, Helvetica, sans-serif;
  font-weight: bold;
  margin-bottom: 20px;
}

form {
  display: flex;
  flex-direction: column;
}
.form-input-group {
  margin-bottom: 1rem;
  margin-bottom: 20px;
}

.form-input-group:hover{
    transform: scale(1.1);
    border-radius: 15px;
  }
 
  .input {
    border-radius: 15px;
  }
.input1 {
  border-radius: 15px;
}

label {
  display: block;
  text-align: left;
  margin-bottom: 8px;
  color: #333;
  text-align: center;
}

input {
  text-align: center;
  padding: 8px;
  width: 40%;
  margin-bottom: 10px;
  border: none;
  border-radius: 4px;
}

.link{
color: rgb(255, 255, 255);
font-family:Arial, Helvetica, sans-serif;
font-weight: bold;
text-decoration: none;
}

.link:hover {
  color:rgb(0, 0, 0);
  transition: color 0.8s ease;
  
}
.checkbox-group {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.checkbox-group input {
  margin-right: 8px;
}

button {
  padding: 8px;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  background-color: rgb(170, 167, 167);
  color: #ffffff;
  border-radius: 20px;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s ease;
  width: 85px;
}

button:hover {
  background-color: #424344;
 transition: background-color 0.8s ease;
}

.forgot-password a {
  color: #3498db;
  text-decoration: none;
}

.forgot-password a:hover {
  text-decoration: underline;
}

#login{
  border-radius: 50px;
  text-align: center;
  margin: 50px auto;
  max-width: 500px;
  background-color: rgba(68, 118, 255, 0.753);
  padding: 20px;
  box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
}

label {
  margin-right: 0.5rem;
}

.alert {
  color: rgb(250, 129, 129);
  font-family: Arial, Helvetica, sans-serif;
  margin-bottom: 10px;
}

.avatar {
  display: flex;
  justify-content: center;
  animation-name: floating;
    animation-duration: 3s;
    animation-iteration-count: infinite;
    animation-timing-function: ease-in-out;
    margin-top: 5px;
}
 
@keyframes floating {
    0% { transform: translate(0,  0px); }
    50%  { transform: translate(0, 30px); }
    100%   { transform: translate(0, -0px); }    
}

.login-wiz{
  width: 750px;
  margin-right: 50px;
  
}


</style>
