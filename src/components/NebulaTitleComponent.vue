<template>
  <canvas @resize="render" id="spaceCanvas" ref="canv" />
  <div class="fade" />
  <title-text-component />
  <div class="arrow">↓</div>
</template>

<script lang="ts">
import { defineComponent, ref } from "vue";
import REGL from "regl";
import random from "../util/random";
import copyVertSrc from "@/shaders/copy_vertex.glsl?raw";
import copyFragSrc from "@/shaders/copy_fragment.glsl?raw";
import nebulaVertSrc from "@/shaders/nebula_vertex.glsl?raw";
import nebulaFragSrc from "@/shaders/nebula_fragment.glsl?raw";
import starVertSrc from "@/shaders/star_vertex.glsl?raw";
import starFragSrc from "@/shaders/star_fragment.glsl?raw";
import TitleTextComponent from "./TitleTextComponent.vue";

const renderscale = 1;

export default defineComponent({
  components: { TitleTextComponent },
  setup: function () {
    const canvas = ref<HTMLCanvasElement>();
    return {
      canv: canvas,
    };
  },
  data: function () {
    return {
      canvas: undefined as HTMLCanvasElement | undefined,
      regl: undefined as REGL.Regl | undefined,
      lastWidth: 0,
      lastHeight: 0,
      pointStarTexture: undefined as REGL.Texture2D | undefined,
      ping: undefined as REGL.Framebuffer | undefined,
      pong: undefined as REGL.Framebuffer | undefined,
      copyRenderer: undefined as REGL.DrawCommand | undefined,
      nebulaRenderer: undefined as REGL.DrawCommand | undefined,
      starRenderer: undefined as REGL.DrawCommand | undefined,
      maxTextureSize: undefined as number | undefined,
      seed: Math.floor(Math.random() * 100000),
    };
  },
  mounted: function () {
    const canvas = this.canv;
    if (canvas === undefined) throw new Error("Canvas is undefined");

    this.canvas = canvas;
    this.canvas.width = window.innerWidth * renderscale;
    this.canvas.height = window.innerHeight * renderscale;

    this.regl = REGL({ canvas: canvas });
    this.pointStarTexture = this.regl.texture();

    this.ping = this.regl.framebuffer({
      color: this.regl.texture(),
      depth: false,
      stencil: false,
      depthStencil: false,
    });
    this.pong = this.regl.framebuffer({
      color: this.regl.texture(),
      depth: false,
      stencil: false,
      depthStencil: false,
    });
    this.copyRenderer = createCopyRenderer(this.regl);
    this.nebulaRenderer = createNebulaRenderer(this.regl);
    this.starRenderer = createStarRenderer(this.regl);

    window.addEventListener("resize", () => {
      if (this.canvas === undefined) return;
      this.canvas.width = window.innerWidth * renderscale;
      this.canvas.height = window.innerHeight * renderscale;
      this.render();
    });

    this.render();
  },
  methods: {
    render: function () {
      const width = this.canvas?.width as number;
      const height = this.canvas?.height as number;
      const viewport = {
        x: 0,
        y: 0,
        width: width,
        height: height,
      } as Viewport;

      if (width !== this.lastWidth || height !== this.lastHeight) {
        this.ping?.resize(width, height);
        this.pong?.resize(width, height);
        this.lastWidth = width;
        this.lastHeight = height;
      }

      // let scale = Math.min(width, height);
      const scale = Math.max(width, height);

      (this.regl as REGL.Regl)({ framebuffer: this.ping })(() => {
        this.regl?.clear({ color: [0, 0, 0, 1] });
      });

      (this.regl as REGL.Regl)({ framebuffer: this.pong })(() => {
        this.regl?.clear({ color: [0, 0, 0, 1] });
      });

      const data = this.generatePointStars(
        width,
        height,
        0.05,
        0.125,
        random(this.seed)
      );
      (this.pointStarTexture as REGL.Texture2D)({
        format: "rgb",
        width,
        height,
        wrapS: "clamp",
        wrapT: "clamp",
        data,
      });

      const rand = random(this.seed);

      const nebulacount = Math.round(rand() * 4 + 1);
      const nebulaOut = this.alternate(
        this.pointStarTexture as REGL.Texture2D,
        this.ping as REGL.Framebuffer2D,
        this.pong as REGL.Framebuffer2D,
        nebulacount,
        (source, dest) => {
          (this.nebulaRenderer as REGL.DrawCommand)({
            source,
            destination: dest,
            viewport,
            width,
            height,
            offset: [rand() * 100, rand() * 100],
            scale: (rand() * 2 + 1) / scale,
            color: [rand(), rand(), rand()],
            density: rand() * 0.2,
            falloff: rand() * 2.0 + 3.0,
          } as Partial<NebulaProps>);
        }
      );

      const starCount = rand() * 8 + 1;
      this.alternate(
        nebulaOut as REGL.Texture2D,
        this.ping as REGL.Framebuffer2D,
        this.pong as REGL.Framebuffer2D,
        starCount,
        (source, dest) => {
          (this.starRenderer as REGL.DrawCommand)({
            source,
            destination: dest,
            viewport,
            scale,
            resolution: [width, height],
            center: [rand(), rand()],
            coreRadius: 0,
            coreColor: [1, 1, 1],
            haloColor: [rand(), rand(), rand()],
            haloFalloff: rand() * 1024 + 32,
          } as Partial<StarProps>);
        }
      );

      (this.copyRenderer as REGL.DrawCommand)({
        source: nebulaOut,
        viewport,
      });
    },

    generatePointStars: function (
      width: number,
      height: number,
      density: number,
      brightness: number,
      rand: () => number
    ) {
      const count = Math.floor(width * height * density);
      const data = new Uint8Array(width * height * 3);
      for (let i = 0; i < count; i++) {
        const r = Math.floor(rand() * width * height);
        const c = Math.floor(255 * Math.log(1 - rand()) * -brightness);
        data[r * 3] = c;
        data[r * 3 + 1] = c;
        data[r * 3 + 2] = c;
      }
      return data;
    },
    alternate: function (
      initial: REGL.Framebuffer2D | REGL.Texture2D,
      alpha: REGL.Framebuffer2D,
      beta: REGL.Framebuffer2D,
      count: number,
      func: (
        alpha: REGL.Framebuffer2D | REGL.Texture2D,
        beta: REGL.Framebuffer2D
      ) => void
    ) {
      if (count === 0) return initial;
      if (initial === alpha) {
        alpha = beta;
        beta = initial;
      }

      func(initial, alpha);
      let i = 1;
      if (i === count) return alpha;
      while (i < count) {
        func(alpha, beta);
        i++;
        if (i === count) return beta;
        func(beta, alpha);
        i++;
        if (i === count) return alpha;
      }
    },
  },
});

const createCopyRenderer = function (
  regl: REGL.Regl
): REGL.DrawCommand<REGL.DefaultContext, CopyProps> {
  return regl({
    vert: copyVertSrc,
    frag: copyFragSrc,
    attributes: {
      position: regl.buffer([-1, -1, 1, -1, 1, 1, -1, -1, 1, 1, -1, 1]),
      uv: regl.buffer([0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1]),
    },
    uniforms: {
      source: regl.prop<CopyProps, "source">("source"),
    },
    framebuffer: regl.prop<CopyProps, "destination">("destination"),
    viewport: regl.prop<CopyProps, "viewport">("viewport"),
    count: 6,
  });
};

interface Viewport {
  x: number;
  y: number;
  width: number;
  height: number;
}

interface CopyProps {
  source: REGL.Texture2D | REGL.Framebuffer2D;
  destination?: REGL.Framebuffer2D;
  viewport: Viewport;
}

const createNebulaRenderer = function (regl: REGL.Regl) {
  const pgWidth = 256;
  const l = pgWidth * pgWidth * 2;
  const data = new Uint8Array(l);
  for (let i = 0; i < l; i++) {
    data[i * 2] = Math.round(0.5 * (1.0 + Math.random()) * 255);
    data[i * 2 + 1] = Math.round(0.5 * (1.0 + Math.random()) * 255);
  }
  const pgTexture = regl.texture({
    format: "luminance alpha",
    width: pgWidth,
    height: pgWidth,
    data,
    wrapS: "repeat",
    wrapT: "repeat",
  });

  return regl({
    vert: nebulaVertSrc,
    frag: nebulaFragSrc,
    attributes: {
      position: regl.buffer([-1, -1, 1, -1, 1, 1, -1, -1, 1, 1, -1, 1]),
      uv: regl.buffer([0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1]),
    },
    uniforms: {
      tNoise: pgTexture,
      tNoiseSize: pgWidth,
      source: regl.prop<NebulaProps, "source">("source"),
      offset: regl.prop<NebulaProps, "offset">("offset"),
      scale: regl.prop<NebulaProps, "scale">("scale"),
      falloff: regl.prop<NebulaProps, "falloff">("falloff"),
      color: regl.prop<NebulaProps, "color">("color"),
      density: regl.prop<NebulaProps, "density">("density"),
    },
    framebuffer: regl.prop<NebulaProps, "destination">("destination"),
    viewport: regl.prop<NebulaProps, "viewport">("viewport"),
    count: 6,
  });
};

interface NebulaProps {
  source: REGL.Framebuffer2D;
  offset: REGL.Vec2;
  scale: number;
  falloff: number;
  color: REGL.Vec3;
  density: number;
  destination: REGL.Framebuffer2D;
  viewport: Viewport;
}

const createStarRenderer = function (regl: REGL.Regl) {
  return regl({
    vert: starVertSrc,
    frag: starFragSrc,
    attributes: {
      position: regl.buffer([-1, -1, 1, -1, 1, 1, -1, -1, 1, 1, -1, 1]),
      uv: regl.buffer([0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1]),
    },
    uniforms: {
      source: regl.prop<StarProps, "source">("source"),
      center: regl.prop<StarProps, "center">("center"),
      coreRadius: regl.prop<StarProps, "coreRadius">("coreRadius"),
      coreColor: regl.prop<StarProps, "coreColor">("coreColor"),
      haloColor: regl.prop<StarProps, "haloColor">("haloColor"),
      haloFalloff: regl.prop<StarProps, "haloFalloff">("haloFalloff"),
      resolution: regl.prop<StarProps, "resolution">("resolution"),
      scale: regl.prop<StarProps, "scale">("scale"),
    },
    framebuffer: regl.prop<StarProps, "destination">("destination"),
    viewport: regl.prop<StarProps, "viewport">("viewport"),
    count: 6,
  });
};

interface StarProps {
  center: REGL.Vec2;
  coreRadius: number;
  coreColor: REGL.Vec3;
  haloColor: REGL.Vec3;
  haloFalloff: number;
  resolution: REGL.Vec2;
  scale: number;
  source: REGL.Framebuffer2D;
  destination: REGL.Framebuffer2D;
  viewport: Viewport;
}
</script>

<style scoped>
#spaceCanvas {
  width: 100%;
  height: 100%;
  position: relative;
}

.fade {
  content: "";
  position: relative;
  z-index: 1;
  bottom: 6em;
  left: 0;
  pointer-events: none;
  background-image: linear-gradient(to bottom, #2e344000 20%, #2e3440ff 85%);
  width: 100%;
  height: 6em;
  margin-bottom: -6em;
}

.arrow {
  position: absolute;
  color: var(--nord3);
  font-size: 4rem;
  width: 100%;
  top: calc(100% - 6rem);
  text-align: center;
  z-index: 2;

  animation: arrow-animation 2s infinite ease;
}

@keyframes arrow-animation {
  0% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-25%);
  }
  100% {
    transform: translateY(0);
  }
}
</style>
