<template>
  <img
    :src="fullUrl(icon)"
    :class="{ invertColor: inverted, smallIcon: small }"
  />
</template>

<script lang="ts">
import { defineComponent } from "vue";

const url = "https://cdn.jsdelivr.net/gh/devicons/devicon/icons";

export default defineComponent({
  props: {
    icon: {
      type: String,
      default: "",
    },
    inverted: Boolean,
    small: Boolean,
  },
  methods: {
    fullUrl(iconName: string): string {
      const baseName = iconName.split("-")[0];
      return `${url}/${baseName}/${iconName}.svg`;
    },
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

.smallIcon {
  height: 2rem;
  width: 2rem;
}

.invertColor {
  filter: invert(100%);
}
</style>
