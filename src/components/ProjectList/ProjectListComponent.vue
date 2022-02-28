<template>
  <div>
    <project-list-item-component
      title="larssonoliver.com"
      img="larssonoliver.png"
      href="https://larssonoliver.com"
      github="https://github.com/larssonoliver/larssonoliver.github.io"
      fill-img
    >
      My personal webiste. Built with Vue 3, TypeScript and WebGL. Hosted
      through Github pages.
    </project-list-item-component>
    <project-list-item-component
      title="PressureEngine"
      img="pressureengine.png"
      github="https://github.com/larssonoliver/PressureEngine"
      fill-img
    >
      A 3D graphics engine written in C++ using OpenGL for my end of high school
      project. Features include shadows, water, a particle system and more!
    </project-list-item-component>
    <project-list-item-component
      title="bf"
      img="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg"
      github="https://github.com/larssonoliver/bf"
    >
      A brainfuck interpreter written in C which conforms to the language
      specification.
    </project-list-item-component>
    <project-list-item-component
      title="lnkshrt"
      github="https://github.com/larssonoliver/lnkshrt"
      href="https://lnkshrt.larssonoliver.com"
      img="lnkshrt.png"
      fill-img
    >
      A simple link shortener API written in Go and an accompying next.js web
      interface. The project was built to learn the lifetime of systems all the
      way from code to deployment. Using CI/CD, it is built into container
      images and deployed using kubernetes.
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
