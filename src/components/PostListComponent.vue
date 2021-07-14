<template>
  <div class="container">
    <post-component />
    <div v-for="i in 5" :key="i" class="item">Test</div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import PostComponent from "./PostComponent.vue";

export default defineComponent({
  components: { PostComponent },
});
</script>

<style scoped>
.contain PostComponenter {
  width: 800px;
  margin-left: auto;
  margin-right: auto;
  margin-top: 1em;
  margin-bottom: 1em;
}

@media screen and (max-width: 850px) {
  .container {
    width: 100%;
  }
}

.item {
  border: 2px dotted red;
  color: white;
  height: 200px;
}
</style>
