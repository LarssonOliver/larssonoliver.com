<template>
  <div class="container">
    <div class="list">
      <div v-for="i in 5" :key="i">
        <post-list-item-component title="Title"
          >Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima
          dignissimos, repellat sint in nobis exercitationem vel impedit ut sunt
          alias, asperiores excepturi eos, consequatur animi veritatis sit id
          illo debitis.</post-list-item-component
        >
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import PostListItemComponent from "./PostListItemComponent.vue";

export default defineComponent({
  components: { PostListItemComponent },
});
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

.list {
  padding: 1em;
}
</style>
