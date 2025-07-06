<template>
    <h1>test list</h1>
    
    <button @click="sortMovies">sort list</button>
    <ul>
      <li v-for="movie in movies" :key="movie">
        {{ movie }} <button @click="deleteMovie(movie)">Supprimer</button>
      </li>
    </ul>
  
  
    <hr />
    <input type="text" name="movie" placeholder="movie" v-model="newMovie" />
    <span>{{ newMovie }}</span>
    <button @click="addMovie">Add movie</button>
  </template>
  
  <script setup>
  import { ref } from 'vue';
  const movies = ref([
    'Matrix',
    'Lilo & stich',
    'TItanic',
  ]);
  
  const deleteMovie = (movie) => {
    movies.value = movies.value.filter((a) => a !== movie);
  }
  
  const addMovie = (movie) => {
    movies.value.push(newMovie.value);
    newMovie.value = '';  
  }
  
  const newMovie = ref('');
  
  const sortMovies = () => {
    movies.value = movies.value.sort((a,b) => a.toLowerCase()>b.toLowerCase() ? 1 : -1);
  }
  </script>
  
  <style>
  h1{
    color: red;
  }
  </style>