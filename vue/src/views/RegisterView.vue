<template>
  <div id="register" class="text-center">
    
    <form v-on:submit.prevent="register">
      <h1>Create Account</h1>
      <div  class="alert" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="form-input-group">
        <!-- <label for="username">Username</label> -->
        <input class="input" type="text" id="username" placeholder="Enter your username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <!-- <label for="password">Password</label> -->
        <input class="input" type="password" id="password" placeholder="Enter your password" v-model="user.password" required />
      </div>
      <div class="form-input-group">
        <!-- <label for="confirmPassword">Confirm Password</label> -->
        <input class="input" type="password" id="confirmPassword" placeholder="Confirm your password" v-model="user.confirmPassword" required />
      </div>
      <button type="submit">Create Account</button>
      <p><router-link class="link" v-bind:to="{ name: 'login' }">Already have an account? Log in!</router-link></p>
    </form>
  </div>
  <div class="avatar">
      <img class="register-wiz" src="../assets/images/RegisterWizard.png" />
    </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
input {
  text-align: center;
  padding: 8px;
  width: 40%;
  margin-bottom: 10px;
  border: 2px solid #ccc;
  border-radius: 15px;
  
}

#register {
  border-radius: 50px;
  text-align: center;
  margin: 50px auto;
  width: 500px;
  background-color: #6AB0AA;
  padding: 10px;
  box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
}

h1{
  color: white;
  font-family:Arial, Helvetica, sans-serif;
  font-weight: bold;
  margin-bottom: 30px;
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
  width: 120px;
}

button:hover {
  background-color: #424344;
 transition: background-color 0.8s ease;
}

.form-input-group {
  margin-bottom: 1rem;
  margin-bottom: 20px;

}

.form-input-group:hover{
    transform: scale(1.1);
    border-radius: 15px;
  }
 

.input1 {
  border-radius: 15px;
}

label {
  margin-right: 0.5rem;
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

.alert {
  color: rgb(250, 129, 129);
  font-family: Arial, Helvetica, sans-serif;
  margin-bottom: 10px;
}

.avatar {
  display:flex;
  justify-content: flex-start;
  
  
}


.register-wiz{
  width: 1000px;
  bottom: 15%;
  position: relative;
  -webkit-animation: linear infinite;
  -webkit-animation-name: run;
  -webkit-animation-duration: 15s;
}
@-webkit-keyframes run {
  0% {
    left: 0;
  }
  48% {
    -webkit-transform: rotateY(0deg); 
  }
  50% { 
    left: calc(100% - 1050px);
    -webkit-transform: rotateY(180deg); 
  }
  98% {
    -webkit-transform: rotateY(180deg); 
  }
  100% {
    left: 0;    
     -webkit-transform: rotateY(0deg);
  }
 
}
</style>
