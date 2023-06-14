<script setup>

import { ref, onMounted } from 'vue'

const blogs = ref([])
async function fetchData() {
	try {
		const res = await fetch('http://localhost:4000/')
		if (!res.ok) {
			throw new Error('Error fetching')
		}
		const data = await res.json()
		blogs.value = data
		console.log(blogs.value)
	} catch (error) {
		console.log(error)
	}
};
onMounted(() => {
	fetchData()
});

</script>

<template>
  <header class="App-header">
	<h1>all blogs</h1>
	<p v-for="blog in blogs"> {{ blog.title }}</p>
  </header>
</template>

<style scoped>

</style>
