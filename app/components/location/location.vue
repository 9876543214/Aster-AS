<template>
  <nav class="breadcrumb">
    <h1>{{ breadcrumbs[breadcrumbs.length - 1].label }}</h1>
    <div class="path">
      <span
        v-for="(crumb, idx) in breadcrumbs"
        :key="idx"
        class="breadcrumb-item"
      >
        <router-link
          v-if="idx < breadcrumbs.length - 1"
          :to="crumb.path"
          class="breadcrumb-link"
        >
          {{ crumb.label }}
        </router-link>
        <span v-else class="breadcrumb-current">{{ crumb.label }}</span>
        <span
          v-if="idx < breadcrumbs.length - 1"
          class="breadcrumb-separator"
          aria-hidden="true"
        >
          &gt;
        </span>
      </span>
    </div>
  </nav>
</template>

<script>
export default {
  computed: {
    breadcrumbs() {
      const pathMap = {
        "": "Hjem",
        about: "Om oss",
        contact: "Kontakt oss",
      };
      const paths = this.$route.path.split("/").filter(Boolean);
      let fullPath = "";
      return [
        { label: "Hjem", path: "/" },
        ...paths.map((segment, idx) => {
          fullPath += "/" + segment;
          return {
            label:
              pathMap[segment] ||
              segment.charAt(0).toUpperCase() + segment.slice(1),
            path: fullPath,
          };
        }),
      ];
    },
  },
};
</script>

<style>
.breadcrumb {
  display: flex;
  flex-direction: column;
  position: relative;
  font-size: 14px;
  margin-bottom: 1rem;
  height: 200px;
  align-items: center;
  justify-content: center;
  background-color: #eae0e0;
}
.breadcrumb-item {
  display: flex;
  align-items: center;
}
.breadcrumb-link {
  color: #000000;
  text-decoration: none;
  height: min-content;
}
h1 {
  font-size: 1.9rem;
  margin: 0;
  color: #000000;
}
.path {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 1.9rem;
  flex-direction: row;
}
.breadcrumb-link::after {
  transition: all ease-in-out 0.2s;
  background: none repeat scroll 0 0 #000000;
  content: "";
  display: block;
  height: 1.5px;
  border-radius: 50px;
  width: 0;
}
.breadcrumb-link:hover::after {
  width: 100%;
}

.breadcrumb-separator {
  margin: 0 0.5em;
  color: #000000;
}
</style>