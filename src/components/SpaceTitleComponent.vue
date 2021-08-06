<template>
  <canvas id="spaceCanvas" ref="canvas" />
  <title-text-component />
</template>

<script lang="ts">
import { defineComponent, ref } from "vue";
import vertexSrc from "!raw-loader!@/shaders/vertex.glsl";
import fragmentSrc from "!raw-loader!@/shaders/fragment.glsl";
import TitleTextComponent from "./TitleTextComponent.vue";

const renderScale = 0.5;

export default defineComponent({
  components: { TitleTextComponent },
  setup: function () {
    const canvas = ref<HTMLCanvasElement>();
    return {
      canvas,
    };
  },
  mounted: function () {
    if (this.canvas === undefined) throw new Error();

    this.canvas.width = window.innerWidth * renderScale;
    this.canvas.height = window.innerHeight * renderScale;

    const gl = this.canvas.getContext("webgl");
    if (gl === null) {
      throw new Error(
        "Unable to initialize WebGL. Your browser or machine may not support it."
      );
    }

    const shaderProgram = initShaderProgram(gl, vertexSrc, fragmentSrc);
    const buffer = initBuffer(gl);

    const programInfo = {
      program: shaderProgram,
      attribLocations: {
        vertexPosition: gl.getAttribLocation(shaderProgram, "aVertexPosition"),
      },
      uniformLocations: {
        offset: gl.getUniformLocation(shaderProgram, "offset"),
        mouse: gl.getUniformLocation(shaderProgram, "mouse"),
        resolution: gl.getUniformLocation(shaderProgram, "resolution"),
      },
    } as ProgramInfo;

    let rendering = false;
    let mousex: number, mousey: number;

    function startRender() {
      if (!rendering) {
        rendering = true;
        requestAnimationFrame(render);
      }
    }

    function render() {
      if (gl !== null) {
        drawScene(gl, programInfo, buffer, mousex, mousey);
        rendering = false;
      }
    }

    // Listen to mouse move events in the canvas
    this.canvas.addEventListener("mousemove", (e) => {
      mousex = e.offsetX;
      mousey = e.offsetY;
      startRender();
    });

    window.addEventListener("resize", () => {
      if (this.canvas !== undefined && this.canvas !== null) {
        this.canvas.width = window.innerWidth / 2;
        this.canvas.height = window.innerHeight / 2;
        gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);
        startRender();
      }
    });

    startRender();
  },
});

interface ProgramInfo {
  program: WebGLProgram;
  attribLocations: { [attrib: string]: number };
  uniformLocations: { [uniform: string]: WebGLUniformLocation };
}

/**
 * Initialize a webgl shader program.
 * @param {WebGLRenderingContext} gl webgl rendering context.
 * @param {string} vertSrc vertex shader source
 * @param {string} fragSrc fragment shader source
 */
function initShaderProgram(
  gl: WebGLRenderingContext,
  vertSrc: string,
  fragSrc: string
) {
  const vertex = loadShader(gl, gl.VERTEX_SHADER, vertSrc);
  const fragment = loadShader(gl, gl.FRAGMENT_SHADER, fragSrc);

  const shaderProgram = gl.createProgram();

  if (shaderProgram === null)
    throw new Error("An error occurred creating shader program.");

  gl.attachShader(shaderProgram, vertex);
  gl.attachShader(shaderProgram, fragment);
  gl.linkProgram(shaderProgram);

  if (!gl.getProgramParameter(shaderProgram, gl.LINK_STATUS)) {
    const err = new Error(
      "Unable to initialize the shader program: " +
        gl.getProgramInfoLog(shaderProgram)
    );
    gl.deleteProgram(shaderProgram);
    throw err;
  }

  return shaderProgram;
}

/**
 * Load and compile a shader from source.
 * @param {WebGLRenderingContext} gl webgl rendering context.
 * @param {number} type type of shader
 * @param {string} src shader source as string
 */
function loadShader(gl: WebGLRenderingContext, type: number, src: string) {
  const shader = gl.createShader(type);

  if (shader === null) throw new Error("An error occurred creating shader.");

  gl.shaderSource(shader, src);
  gl.compileShader(shader);

  if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
    const err = new Error(
      "An error occurred compiling the shaders: " + gl.getShaderInfoLog(shader)
    );
    gl.deleteShader(shader);
    throw err;
  }

  return shader;
}

/**
 * Initialize array buffers.
 * @param {WebGLRenderingContextBase} gl webgl rendering context.
 */
function initBuffer(gl: WebGLRenderingContext) {
  const positionBuffer = gl.createBuffer();

  if (positionBuffer === null)
    throw new Error("An error occured creating buffer.");

  gl.bindBuffer(gl.ARRAY_BUFFER, positionBuffer);
  // Square plane coords.
  const positions = [-1.0, 1.0, 1.0, 1.0, -1.0, -1.0, 1.0, -1.0];
  gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(positions), gl.STATIC_DRAW);

  return positionBuffer;
}

var g_offset = 0;

/**
 * Draw a scene
 * @param {WebGLRenderingContextBase} gl webgl rendering context.
 * @param {ProgramInfo} programInfo
 * @param {WebGLBuffer} buffer VAO.
 * @param {number} mousex current mouse x position.
 * @param {number} mousey current mouse y position.
 */
function drawScene(
  gl: WebGLRenderingContext,
  programInfo: ProgramInfo,
  buffer: WebGLBuffer,
  mousex: number,
  mousey: number
) {
  gl.clearColor(0.0, 0.0, 0.0, 1.0);
  gl.clear(gl.COLOR_BUFFER_BIT);

  // Tell WebGL how to pull out the positions from the position
  // buffer into the vertexPosition attribute.
  {
    const numComponents = 2; // pull out 2 values per iteration
    const type = gl.FLOAT; // the data in the buffer is 32bit floats
    const normalize = false; // don't normalize

    // how many bytes to get from one set of values to the next
    // 0 = use type and numComponents above
    const stride = 0;
    const offset = 0; // how many bytes inside the buffer to start from
    gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
    gl.vertexAttribPointer(
      programInfo.attribLocations["vertexPosition"],
      numComponents,
      type,
      normalize,
      stride,
      offset
    );
    gl.enableVertexAttribArray(programInfo.attribLocations["vertexPosition"]);
  }

  gl.useProgram(programInfo.program);

  if (g_offset === 0) g_offset = new Date().getMilliseconds();

  // Bind uniforms
  gl.uniform1f(programInfo.uniformLocations["offset"], g_offset);
  gl.uniform2f(
    programInfo.uniformLocations["resolution"],
    gl.drawingBufferWidth,
    gl.drawingBufferHeight
  );

  if (mousex !== undefined && mousey !== undefined)
    gl.uniform2f(programInfo.uniformLocations["mouse"], mousex, mousey);
  else
    gl.uniform2f(
      programInfo.uniformLocations["mouse"],
      window.innerWidth / 2,
      window.innerHeight / 2
    );

  {
    const offset = 0;
    const vertexCount = 4;
    gl.drawArrays(gl.TRIANGLE_STRIP, offset, vertexCount);
  }
}
</script>

<style scoped>
#spaceCanvas {
  width: 100%;
  height: 100%;
  filter: blur(0.1rem);
}
</style>
