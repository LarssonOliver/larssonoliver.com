<template>
  <a
    :href="href"
    :target="newTab ? '_blank' : undefined"
    :rel="newTab ? 'noopener noreferrer' : undefined"
  >
    <tech-icon-component :icon="icon" :inverted="inverted" :small="small" />
  </a>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import TechIconComponent from './TechIconComponent.vue'

export default defineComponent({
  components: { TechIconComponent },
  extends: TechIconComponent,
  props: {
    href: {
      type: String,
      default: ''
    },
    newTab: Boolean
  }
})
</script>

<style scoped>
img {
  margin-bottom: -0.25em;
}

img:hover {
  cursor: pointer;
  filter: brightness(120%);
}

.invertColor:hover {
  filter: invert(100%) brightness(120%);
}
</style>
