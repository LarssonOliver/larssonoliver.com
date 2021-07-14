<template>
  <img src="@/assets/logo.png" :alt="definition.title" />
</template>

<script lang="ts">
import { defineComponent, PropType } from "vue";

export interface PostDefinition {
  title: string;
  body: string;
  imagePath: string;
}

export default defineComponent({
  props: {
    definition: {
      type: Object as PropType<PostDefinition>,
      default: function () {
        return {
          title: "Default Post",
          body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus, non. At, culpa. Sunt, architecto non sit asperiores fugiat nemo deleniti qui recusandae enim nam voluptatem, numquam commodi. Nemo, blanditiis quaerat?",
          imagePath: "@/assets/logo.png",
        } as PostDefinition;
      },
    },
  },
});
</script>
