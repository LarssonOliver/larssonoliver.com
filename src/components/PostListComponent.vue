<template>
  <div class="list">
    <post-list-item-component title="About Me" hide-divider>
      <img class="avatar" src="https://avatars.githubusercontent.com/u/15251568?v=4" />
      <p class="avatar-text">
        My name is Oliver and I'm a PhD student from northern Sweden. My main area of research is
        autonomous distributed systems, but I'm interested in almost anything that makes computers
        go beep boop. Everything from IoT to emulation to graphics to networking. I love learning
        new stuff and I'm starting to dive into open source development. I even occasionally write
        stuff over on my <a href="https://blog.larssonoliver.com">blog</a>.
      </p>
    </post-list-item-component>
    <post-list-item-component title="My Projects" color-hex="#3b4252">
      <project-list-component />
    </post-list-item-component>
    <post-list-item-component title="Publications" prev-color-hex="#3b4252">
      <!-- Been exporting as HTML from Zotero -->
      <p class="publication">
        <strong>O. Larsson</strong>, T. Metsch, C. Klein, and E. Elmroth, 
        <a 
          target="_blank"
          href="https://doi.org/10.1145/3774317"
        >
          “Hardware-Level QoS Enforcement Features: Technologies, Use Cases, and Research Challenges,” 
        </a>
          <i>ACM Computing Surveys</i>, 
          Nov. 2025, doi: 
          <a target="_blank" href="https://doi.org/10.1145/3774317"
            >10.1145/3774317</a
          >.
      </p>
      <p class="publication">
        <strong>O. Larsson</strong>, T. Metsch, C. Klein, and E. Elmroth,
        <a
          target="_blank"
          href="/files/2025 - Larsson, Metsch, Klein, Elmroth - ESTHER - Application-First Hardware-Level QoS-Enforcement for Cloud Native Environments.pdf"
        >
          “ESTHER: Application-First Hardware-Level QoS-Enforcement for Cloud Native Environments,”
        </a>
        in <i>2025 IEEE 18th International Conference on Cloud Computing (CLOUD)</i>, Jul. 2025, pp.
        75–85. doi:
        <a target="_blank" href="https://doi.org/10.1109/CLOUD67622.2025.00018"
          >10.1109/CLOUD67622.2025.00018</a
        >.
      </p>
      <p class="publication">
        C. Nguyen, E. Seo, M. Zahid, <strong>O. Larsson</strong>, F. T. Pokorny, and E. Elmroth,
        <a
          target="_blank"
          href="https://doi.org/10.1109/NOMS57970.2025.11073596"
        >
          “tinyKube: A Middleware for Dynamic Resource Management in Cloud-Edge Platforms for Large-Scale Cloud Robotics,”
        </a>
        in <i>2025 IEEE Network Operations and Management Symposium (NOMS)</i>,
        May. 2025, pp. 1–8. doi:
        <a target="_blank" href="https://doi.org/10.1109/NOMS57970.2025.11073596"
          >10.1109/NOMS57970.2025.11073596</a
        >.
      </p>
      <p class="publication">
        <strong>O. Larsson</strong>, C. Klein, and E. Elmroth,
        <a
          target="_blank"
          href="/files/2023 - Larsson, Klein, Elmroth - The Impact of Directed Pod Eviction on Kubernetes Resource Utilization.pdf"
        >
          “The Impact of Directed Pod Eviction on Kubernetes Resource Utilization,”
        </a>
        in <i>2023 IEEE International Conference on Service-Oriented System Engineering (SOSE)</i>,
        Jul. 2023, pp. 81–90. doi:
        <a target="_blank" href="https://doi.org/10.1109/SOSE58276.2023.00016"
          >10.1109/SOSE58276.2023.00016</a
        >.
      </p>
    </post-list-item-component>
    <post-list-item-component title="Tools and Technologies" color-hex="#3b4252">
      <div style="text-align: center">
        <h3 style="margin-top: 0">Experienced</h3>
        <tech-icon-component icon="c-original" title="C" />
        <tech-icon-component icon="csharp-original" title="C#" />
        <tech-icon-component icon="dotnetcore-original" title=".NET Core" />
        <tech-icon-component icon="java-original" title="Java" />
        <tech-icon-component icon="visualstudio-plain" title="Visual Studio" />
        <tech-icon-component icon="vscode-original" title="Visual Studio Code" />
        <hr />
        <h3>Proficient</h3>
        <tech-icon-component icon="cplusplus-original" title="C++" />
        <tech-icon-component icon="bash-original" title="Bash" inverted />
        <tech-icon-component icon="git-original" title="Git" />
        <tech-icon-component icon="css3-original" title="CSS3" />
        <tech-icon-component icon="html5-original" title="HTML5" />
        <tech-icon-component icon="javascript-original" title="JavaScript" />
        <tech-icon-component icon="nodejs-original" title="NodeJS" />
        <tech-icon-component icon="typescript-original" title="TypeScript" />
        <tech-icon-component icon="vuejs-original" title="VueJS" />
        <br />
        <tech-icon-component icon="electron-original" title="Electron" />
        <tech-icon-component icon="go-original" title="Go" />
        <tech-icon-component icon="docker-original" title="Docker" />
        <tech-icon-component icon="kubernetes-plain" title="Kubernetes" />
        <tech-icon-component icon="markdown-original" title="Markdown" inverted />
        <tech-icon-component icon="opengl-plain" title="OpenGL" />
        <tech-icon-component icon="ansible-plain" title="Ansible" inverted />
        <tech-icon-component icon="latex-original" title="LaTeX" inverted />
        <tech-icon-component icon="vim-original" title="(Neo)Vim" />
        <hr />
        <h3>Novice</h3>
        <tech-icon-component icon="matlab-original" title="Matlab" />
        <tech-icon-component icon="microsoftsqlserver-plain" title="MSSQL" inverted />
        <tech-icon-component icon="python-original" title="Python" />
        <tech-icon-component icon="react-original" title="React" />
        <tech-icon-component icon="denojs-original" title="Deno" inverted />
        <tech-icon-component icon="neo4j-plain-wordmark" title="Neo4j" inverted />
        <tech-icon-component icon="postgresql-plain" title="PostgreSQL" />
        <tech-icon-component icon="nginx-original" title="Nginx" />
        <tech-icon-component icon="nextjs-original-wordmark" inverted title="NextJS" />
        <br />
        <tech-icon-component icon="nuxtjs-plain-wordmark" inverted title="NuxtJS" />
        <tech-icon-component icon="googlecloud-plain" title="Google Cloud" />
        <tech-icon-component icon="rust-original" title="Rust" inverted />
        <tech-icon-component icon="terraform-plain" title="Terraform" inverted />
        <tech-icon-component icon="prometheus-original" title="Prometheus" />
        <tech-icon-component icon="grafana-original" title="Grafana" />
        <tech-icon-component icon="argocd-plain" title="ArgoCD" inverted />
        <tech-icon-component icon="redis-plain" title="Redis" />
        <tech-icon-component icon="zig-original" title="Zig" />
      </div>
    </post-list-item-component>
    <!--<post-list-item-component
      title="Next Up!"
      subtitle="Tools and technologies I want to learn next."
      prev-color-hex="#3b4252"
    >
      <div style="text-align: center">
      </div>
    </post-list-item-component>-->
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
import { defineComponent } from 'vue'
import PostListItemComponent from './PostListItemComponent.vue'
import ProjectListComponent from './ProjectList/ProjectListComponent.vue'
import TechIconButtonComponent from './TechIcon/TechIconButtonComponent.vue'
import TechIconComponent from './TechIcon/TechIconComponent.vue'

export default defineComponent({
  components: {
    PostListItemComponent,
    TechIconComponent,
    TechIconButtonComponent,
    ProjectListComponent
  }
})
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

.publication {
  text-align: justify;
  font-size: 1.2rem;
  width: 80%;
  margin-left: 10%;
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

a,
a:visited {
  color: var(--nord6);
}
</style>
