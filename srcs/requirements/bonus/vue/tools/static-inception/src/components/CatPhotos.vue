<script setup>
const props = defineProps(['cats']);
// console.log(cats.value);
</script>

<template>
	<h2 class="cat-intro">Here are a couple of cat pictures</h2>
    <div class="cat-pictures">
		<img v-for="cat in cats" :src="cat.path" :alt="cat.alt" />
    </div>
</template>

<style scoped>
.cat-pictures {
    display: flex;
    justify-content: center;
    margin-inline: auto;
    width: 90vw;
    height: 400px;
    gap: 20px;
}

img {
    border: 0;
    width: 25%;
    height: 100%;
    object-fit: cover;
}
</style>