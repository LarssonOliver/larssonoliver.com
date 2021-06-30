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
  overflow-y: scroll;
  background-color: #2e3440;
}

body {
  margin: 0;
}

#app {
  height: 100%;
  width: 100%;
}
</style>
