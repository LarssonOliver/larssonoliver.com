<template>
  <div>
    <project-list-item-component
      title="larssonoliver.com"
      img="larssonoliver.png"
      href="https://larssonoliver.com"
      github="https://github.com/larssonoliver/larssonoliver.github.io"
      fillImg
    >
      My personal webiste. Built with Vue 3, TypeScript and WebGL. Hosted
      through Github pages.
    </project-list-item-component>
    <project-list-item-component
      title="PressureEngine"
      img="pressureengine.png"
      github="https://github.com/larssonoliver/PressureEngine"
      fillImg
    >
      A 3D graphics engine written in C++ using OpenGL for my end of high school
      project. Features include shadows, water, a particle system and more!
    </project-list-item-component>
    <project-list-item-component
      title="bf"
      img="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg"
      github="https://github.com/larssonoliver/bf"
    >
      A brainf*ck interpreter written in C which conforms to the language
      specification.
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
