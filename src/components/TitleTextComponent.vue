<template>
  <pre id="name" />
  <pre id="title" />
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import Typewriter from 'typewriter-effect/dist/core'

export default defineComponent({
  mounted: function () {
    this.startName()
  },
  methods: {
    startName() {
      new Typewriter('#name', {})
        .changeDelay(50)
        .pauseFor(500)
        .typeString("Hi, I'm Oliver")
        .pauseFor(250)
        .callFunction(this.startTitle)
        .start()
    },
    startTitle() {
      const test = document.getElementsByClassName('Typewriter__cursor')
      ;(test[0] as HTMLElement).style.display = 'none'

      new Typewriter('#title', {})
        .changeDelay(50)
        .typeString("I'm a doctoral student from Sweden")
        .start()
    }
  }
})
</script>

<style scoped>
pre {
  color: #eceff4;
  position: absolute;
  margin: 0;
  width: 80%;
  left: calc(50% - (80% * 0.5));
  text-align: center;
  font-family: 'Courier New', Courier, monospace;
}

#name {
  top: calc(50vh - 2 * (4.5vw * 1.2));
  font-size: 4.5vw;
}

#title {
  top: calc(50vh - (2vw * 1.2));
  font-size: 2vw;
}
</style>
