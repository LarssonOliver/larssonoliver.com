<template>
  <home-view />
</template>

<script lang="ts">
import { defineComponent } from "vue";
import HomeView from "./views/HomeView.vue";

export default defineComponent({
  name: "App",
  components: {
    HomeView,
  },
});
</script>

<style>
html {
  overflow: hidden;
}

body {
  margin: 0;
}

#app {
  height: 100%;
  width: 100%;
  background-color: #2e3440;
}
</style>
