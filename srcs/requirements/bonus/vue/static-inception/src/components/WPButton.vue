<template>
	<button class="wp-button" @click="openWP()">Go to my Wordpress site</button>
</template>

<script setup>
const openWP = (() => {
	window.location="https://touteiro.42.fr"
})
</script>

<style scoped>
.wp-button {
	background-color: none;
	padding: 4px 10px;
	border-radius: 20px;
	font-size: 1.5rem;
	margin: 0 auto;
	margin-top: 30px;
	display: block;
	cursor: pointer;
}

.wp-button:hover {
	background-color: lightgray;
}
</style>