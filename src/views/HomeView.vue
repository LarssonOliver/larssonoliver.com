<template>
  <nebula-title-component />
  <space-title-component />
  <post-list-component />
</template>

<script lang="ts">
import NebulaTitleComponent from "@/components/NebulaTitleComponent.vue";
import PostListComponent from "@/components/PostListComponent.vue";
import SpaceTitleComponent from "@/components/SpaceTitleComponent.vue";
import { defineComponent } from "vue";

export default defineComponent({
  components: { SpaceTitleComponent, PostListComponent, NebulaTitleComponent },
});
</script>
