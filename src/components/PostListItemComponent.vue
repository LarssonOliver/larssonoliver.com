<template>
  <div class="full-width" :style="{ backgroundColor: colorHex }">
    <post-list-item-divider-component
      v-if="!hideDivider"
      :color-hex="prevColorHex"
    />
    <div class="item-container">
      <h2>{{ title }}</h2>
      <p v-if="subtitle">{{ subtitle }}</p>
      <div class="item">
        <slot />
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import PostListItemDividerComponent from "./PostListItemDividerComponent.vue";

export default defineComponent({
  components: {
    PostListItemDividerComponent,
  },
  props: {
    title: {
      type: String,
      default: "",
    },
    subtitle: {
      type: String,
      default: "",
    },
    colorHex: {
      type: String,
      default: "#2e3440", // nord0
    },
    prevColorHex: {
      type: String,
      default: "#2e3440", // nord0
    },
    hideDivider: Boolean,
  },
});
</script>

<style scoped>
.full-width {
  width: 100%;
}

.item {
  color: var(--nord4);
  margin-bottom: 4em;
}

p {
  color: var(--nord5);
  width: 100%;
  text-align: center;
  font-size: 1.2rem;
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

.item-container {
  width: 800px;
  margin-left: auto;
  margin-right: auto;
  padding-top: 0.1px;
  padding-bottom: 0.1px;
}

@media screen and (max-width: 850px) {
  .item-container {
    width: 100%;
  }
}
</style>
