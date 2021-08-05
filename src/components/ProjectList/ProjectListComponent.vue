<template>
  <div>
    <project-list-item-component
      title="larssonoliver.com"
      img="vue.png"
      href="https://larssonoliver.com"
      github="https://github.com/larssonoliver/larssonoliver.github.io"
    >
      My personal webiste. Built with Vue 3 and TypeScript and hosted through
      Github pages.
    </project-list-item-component>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import ProjectListItemComponent from "./ProjectListItemComponent.vue";

export default defineComponent({
  components: { ProjectListItemComponent },
});
</script>
