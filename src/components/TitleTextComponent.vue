<template>
  <pre id="name" />
  <pre id="title" />
  <pre id="construction" />
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Typewriter from "typewriter-effect/dist/core";

export default defineComponent({
  mounted: function () {
    this.startName();
  },
  methods: {
    startName() {
      new Typewriter("#name", {})
        .changeDelay(75)
        .pauseFor(2000)
        .typeString("I am Oliver")
        .pauseFor(1000)
        .callFunction(this.startTitle)
        .start();
    },
    startTitle() {
      const test = document.getElementsByClassName("Typewriter__cursor");
      (test[0] as HTMLElement).style.display = "none";

      new Typewriter("#title", {})
        .changeDelay(75)
        .typeString("A computer scientist from Sweden")
        .pauseFor(2000)
        .callFunction(this.startConstruction)
        .start();
    },
    startConstruction() {
      const test = document.getElementsByClassName("Typewriter__cursor");
      (test[1] as HTMLElement).style.display = "none";

      new Typewriter("#construction", {})
        .changeDelay(50)
        .typeString("My site is currently under construction, come back later!")
        .start();
    },
  },
});
</script>

<style scoped>
pre {
  color: #eceff4;
  position: absolute;
  margin: 0;
  width: 80%;
  left: calc(50% - (80% * 0.5));
  text-align: center;
  font-family: "Courier New", Courier, monospace;
}

#name {
  top: calc(50vh - 2 * (4.5vw * 1.2));
  font-size: 4.5vw;
}

#title {
  top: calc(50vh - (3.5vw * 1.2));
  font-size: 3.5vw;
}

#construction {
  top: calc(50vh + (2vw * 1.2));
  font-size: 2vw;
  color: #d8dee9;
}
</style>
