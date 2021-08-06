<template>
  <div>
    <a v-if="href" :href="href">
      <img :src="img" :alt="title" class="image" :class="{ fill: fillImg }" />
    </a>
    <img
      v-else
      :src="img"
      :alt="title"
      class="image"
      :class="{ fill: fillImg }"
    />

    <div class="text">
      <h3 class="title">
        {{ title }}
        <tech-icon-button-component
          v-if="github"
          icon="github-original"
          inverted
          small
          :title="`${title} on Github`"
          :href="github"
          new-tab
          class="repolink"
        />
      </h3>
      <p><slot /></p>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import TechIconButtonComponent from "../TechIcon/TechIconButtonComponent.vue";

export default defineComponent({
  components: { TechIconButtonComponent },
  props: {
    img: String,
    fillImg: Boolean,
    title: String,
    href: String,
    github: String,
  },
});
</script>

<style scoped>
.repolink {
  margin-top: -0.25em;
}

.title {
  width: 100%;
  display: flex;
  justify-content: space-between;
}

.image {
  border: 2px solid var(--nord3);
  width: 12rem;
  height: 8rem;
  margin-left: 5%;
  margin-top: 0.5rem;
  float: left;
  object-fit: contain;
}

.image.fill {
  object-fit: cover;
}

.text {
  font-size: 1.2rem;
  width: calc(100% - 12rem - 15%);
  margin-left: calc(10% + 12rem);
  text-align: justify;
  min-height: 9rem;
}

@media screen and (max-width: 550px) {
  .image {
    width: 90%;
    float: none;
  }

  .text {
    width: 90%;
    margin-left: 5%;
    min-height: 0;
    margin-bottom: 2rem;
  }
}
</style>
