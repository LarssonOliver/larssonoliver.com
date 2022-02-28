<template>
  <div class="list">
    <post-list-item-component title="About Me" hide-divider>
      <img
        class="avatar"
        src="https://avatars.githubusercontent.com/u/15251568?v=4"
      />
      <p class="avatar-text">
        My name is Oliver and I am a Computer Science student from northern
        Sweden. I specialize in High Performance Computing and Distributed
        Systems. Outside my studies I am an avid golfer and skier.
      </p>
    </post-list-item-component>
    <post-list-item-component title="My Projects" color-hex="#3b4252">
      <project-list-component />
    </post-list-item-component>
    <post-list-item-component
      title="Tools and Technologies"
      prev-color-hex="#3b4252"
    >
      <div style="text-align: center">
        <h3 style="margin-top: 0">Expert</h3>
        <tech-icon-component icon="c-original" title="C" />
        <tech-icon-component icon="csharp-original" title="C#" />
        <tech-icon-component icon="dotnetcore-original" title=".NET Core" />
        <tech-icon-component icon="java-original" title="Java" />
        <tech-icon-component icon="visualstudio-plain" title="Visual Studio" />
        <tech-icon-component
          icon="vscode-original"
          title="Visual Studio Code"
        />
        <hr />
        <h3>Proficient</h3>
        <tech-icon-component icon="cplusplus-original" title="C++" />
        <tech-icon-component icon="bash-original" title="Bash" inverted />
        <tech-icon-component icon="git-original" title="Git" />
        <tech-icon-component icon="css3-original" title="CSS3" />
        <tech-icon-component icon="html5-original" title="HTML5" />
        <tech-icon-component icon="javascript-original" title="JavaScript" />
        <tech-icon-component icon="nodejs-original" title="NodeJS" />
        <br />
        <tech-icon-component icon="typescript-original" title="TypeScript" />
        <tech-icon-component icon="vuejs-original" title="VueJS" />
        <tech-icon-component icon="electron-original" title="Electron" />
        <tech-icon-component icon="go-original" title="Go" />
        <tech-icon-component icon="docker-original" title="Docker" />
        <tech-icon-component icon="kubernetes-plain" title="Kubernetes" />
        <tech-icon-component
          icon="markdown-original"
          title="Markdown"
          inverted
        />
        <tech-icon-component icon="opengl-plain" title="OpenGL" />
        <hr />
        <h3>Novice</h3>
        <tech-icon-component icon="matlab-original" title="Matlab" />
        <tech-icon-component
          icon="microsoftsqlserver-plain"
          title="MSSQL"
          inverted
        />
        <tech-icon-component icon="python-original" title="Python" />
        <tech-icon-component icon="react-original" title="React" />
        <tech-icon-component icon="denojs-original" title="Deno" inverted />
        <tech-icon-component
          icon="neo4j-plain-wordmark"
          title="Neo4j"
          inverted
        />
        <tech-icon-component icon="postgresql-plain" title="PostgreSQL" />
        <tech-icon-component icon="nginx-original" title="Nginx" />
        <tech-icon-component
          icon="nextjs-original-wordmark"
          inverted
          title="NextJS"
        />
      </div>
    </post-list-item-component>
    <post-list-item-component
      title="Next Up!"
      subtitle="Tools and technologies I want to learn next."
      color-hex="#3b4252"
    >
      <div style="text-align: center">
        <tech-icon-component icon="vim-original" title="Vim" />
        <tech-icon-component icon="rust-plain" title="Rust" inverted />
      </div>
    </post-list-item-component>
  </div>

  <div class="contact">
    <tech-icon-button-component
      icon="github-original"
      inverted
      title="Github"
      href="https://github.com/larssonoliver"
      new-tab
    />
    <br />
    <tech-icon-button-component
      icon="linkedin-original"
      title="LinkedIn"
      href="https://www.linkedin.com/in/larssonoliver"
      new-tab
    />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import PostListItemComponent from "./PostListItemComponent.vue";
import ProjectListComponent from "./ProjectList/ProjectListComponent.vue";
import TechIconButtonComponent from "./TechIcon/TechIconButtonComponent.vue";
import TechIconComponent from "./TechIcon/TechIconComponent.vue";

export default defineComponent({
  components: {
    PostListItemComponent,
    TechIconComponent,
    TechIconButtonComponent,
    ProjectListComponent,
  },
});
</script>

<style scoped>
.contact-body {
  width: 90%;
  margin-left: 5%;
  text-align: justify;
  font-size: 1.2rem;
}

.contact {
  position: fixed;
  bottom: 0.5rem;
  right: 0.5rem;
  z-index: 2;
}

@media screen and (max-width: 975px) {
  .contact {
    position: absolute;
    margin-top: 1rem;
  }
}

.avatar {
  border-radius: 50%;
  border: 2px solid var(--nord3);
  width: 12rem;
  height: 12rem;
  margin-left: 5%;
  float: left;
}

.avatar-text {
  font-size: 1.2rem;
  width: calc(100% - 12em - 10%);
  margin-left: calc(5% + 12em);
  text-align: justify;
  min-height: 10rem;
  padding-top: 1rem;
}

@media screen and (max-width: 550px) {
  .avatar {
    display: none;
  }

  .avatar-text {
    width: 90%;
    margin-left: 5%;
    min-height: 0;
  }
}

hr {
  border: 1px solid var(--nord1);
  width: 90%;
}

.list {
  padding-top: 1rem;
}
</style>
