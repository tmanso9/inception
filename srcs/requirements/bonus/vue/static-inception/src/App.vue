<script setup>
import WPButton from './components/WPButton.vue'
import Welcome from './components/Welcome.vue'
import CatPhotos from './components/CatPhotos.vue'

import Cat1 from '@/assets/cat1.jpg'
import Cat2 from '@/assets/cat2.jpg'
import Cat3 from '@/assets/cat3.jpg'

const cats = [{
		path : Cat1,
		alt : 'cat silhouette'
	},
	{
		path : Cat2,
		alt : 'cat with blep'
	},
	{
		path : Cat3,
		alt : 'another black cat'
	},
];
</script>

<template>
  <header>
	<Welcome />
  </header>

  <main>
	<CatPhotos :cats="cats" />
    <WPButton />
  </main>
</template>

<style>
html, body, div {
    margin: 0;
    padding: 0;
	background-color: black;
	color: white;
}

h1, h2 {
	font-family: Arial, Helvetica, sans-serif;
    font-weight:normal;
    margin-inline: auto;
    text-align: center;
}
</style>