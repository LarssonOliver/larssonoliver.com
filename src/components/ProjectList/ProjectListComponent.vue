<template>
  <div>
    <ProjectListItemComponent
      title="Portfolio Website"
      img="larssonoliver.png"
      href="https://larssonoliver.com"
      github="https://github.com/larssonoliver/larssonoliver.com"
      fill-img
    >
      My personal website. Built with Vue 3, TypeScript and WebGL.
    </ProjectListItemComponent>
    <ProjectListItemComponent
      title="Personal Blog Platform"
      img="blog.png"
      href="https://blog.larssonoliver.com"
      github="https://github.com/larssonoliver/blg"
      fill-img
    >
      My personal blog. I write stuff occasionally. The blog platform is built using Nuxt 3 and Nuxt
      content.
    </ProjectListItemComponent>
    <ProjectListItemComponent
      title="FeTP"
      img="FeTP.png"
      github="https://github.com/larssonoliver/fetp"
    >
      FeTP is a classical FTP server written in Rust with ~95% unit test coverage. It initially
      served as a project for me to learn rust and to learn to implement functionality from a
      specification. In this case RFCs.
    </ProjectListItemComponent>
    <ProjectListItemComponent
      title="PressureEngine"
      img="pressureengine.png"
      github="https://github.com/larssonoliver/PressureEngine"
      fill-img
    >
      A 3D graphics engine written in C++ using OpenGL for my end of high school project. Features
      include shadows, water, a particle system and more!
    </ProjectListItemComponent>
    <ProjectListItemComponent
      title="lnkshrt"
      github="https://github.com/larssonoliver/lnkshrt"
      href="https://lnkshrt.larssonoliver.com"
      img="lnkshrt.png"
      fill-img
    >
      A simple link shortener API written in Go and an accompying next.js web interface. The project
      was built to learn the lifetime of systems all the way from code to deployment. Using CI/CD,
      it is built into container images and deployed using kubernetes.
    </ProjectListItemComponent>
    <ProjectListItemComponent
      title="bf"
      img="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg"
      github="https://github.com/larssonoliver/bf"
    >
      A brainfuck interpreter written in C which conforms to the language specification.
    </ProjectListItemComponent>
  </div>
</template>

<script setup lang="ts">
import ProjectListItemComponent from './ProjectListItemComponent.vue'
</script>
