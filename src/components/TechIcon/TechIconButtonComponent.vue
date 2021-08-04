<template>
  <a
    :href="href"
    :target="newTab ? '_blank' : undefined"
    :rel="newTab ? 'noopener noreferrer' : undefined"
  >
    <tech-icon-component :icon="icon" :inverted="inverted" />
  </a>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import TechIconComponent from "./TechIconComponent.vue";

export default defineComponent({
  components: { TechIconComponent },
  extends: TechIconComponent,
  props: {
    href: String,
    newTab: Boolean,
  },
});
</script>

<style scoped>
img {
  height: 4rem;
  width: 4rem;
  margin-left: 0.25rem;
  margin-right: 0.25rem;
}

img:hover {
  cursor: pointer;
  filter: brightness(120%);
}

.invertColor {
  filter: invert(100%);
}

.invertColor:hover {
  filter: invert(100%) brightness(120%);
}
</style>
