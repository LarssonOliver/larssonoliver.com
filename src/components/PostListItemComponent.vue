<template>
  <h2>{{ title }}</h2>
  <div class="item">
    <slot />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  props: {
    title: String,
  },
});
</script>

<style scoped>
.item {
  border: 2px dotted red;
  color: var(--nord6);
  height: 200px;
}

h2 {
  position: relative;
  text-align: center;
  overflow: hidden;
  color: var(--nord6);
}

h2:before,
h2:after {
  position: absolute;
  overflow: hidden;
  width: 40%;
  content: "\a0";
  height: 2px;
  top: 50%;
  background-color: var(--nord3);
}

h2:before {
  margin-left: -45%;
  text-align: right;
}

h2:after {
  margin-left: 5%;
}
</style>
