/* eslint-disable */
declare module "*.vue" {
  import type { DefineComponent } from "vue";
  const component: DefineComponent<
    Record<string, unknown>,
    Record<string, unknown>,
    unknown
  >;
  export default component;
}
declare module "*?raw" {
  const string: string;
  export default string;
}

declare module "typewriter-effect/dist/core" {
  export {
    Options,
    TypewriterState,
    TypewriterClass as default,
  } from "typewriter-effect";
}
