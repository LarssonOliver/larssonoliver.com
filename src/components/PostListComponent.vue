<template>
  <div class="container">
    <div v-for="i in 5" :key="i">
      <div class="item">Test</div>
      <hr />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({});
</script>

<style scoped>
.container {
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

hr {
  border: 1px solid var(--nord1);
  margin-block-start: 1em;
  margin-block-end: 1em;
}
</style>
