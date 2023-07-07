<template>
  <nebula-title-component />
  <post-list-component />
</template>

<script lang="ts">
import NebulaTitleComponent from '@/components/NebulaTitleComponent.vue'
import PostListComponent from '@/components/PostListComponent.vue'
import { defineComponent } from 'vue'

export default defineComponent({
  components: {
    PostListComponent,
    NebulaTitleComponent
  }
})
</script>
