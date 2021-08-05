<template>
  <div>
    <a v-if="href" :href="href">
      <img :src="img" :alt="title" class="image" />
    </a>
    <img v-else :src="img" :alt="title" class="image" />

    <div class="text">
      <div class="title">
        <h3>{{ title }}</h3>
        <tech-icon-button-component
          v-if="github"
          icon="github-original"
          inverted
          small
          title="Repository on Github"
          :href="github"
          new-tab
          class="repolink"
        />
      </div>
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
    title: String,
    href: String,
    github: String,
  },
});
</script>

<style scoped>
.repolink {
  margin-top: 1rem;
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
  object-fit: cover;
}

.text {
  font-size: 1.2rem;
  width: calc(100% - 12em - 10%);
  margin-left: calc(5% + 12em);
  text-align: justify;
  min-height: 9rem;
}
</style>
