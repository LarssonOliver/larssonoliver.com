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
@import "assets/vendor/nord.css";

html {
  overflow-y: scroll;
  background-color: var(--nord0);
}

body {
  margin: 0;
}

#app {
  height: 100%;
  width: 100%;
}
</style>
