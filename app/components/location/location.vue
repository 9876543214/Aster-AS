<template>
  <nav class="breadcrumb">
    <h1>{{ breadcrumbs[breadcrumbs.length - 1].label }}</h1>
    <div class="path">
      <span
        v-for="(crumb, index) in breadcrumbs"
        :key="index"
        class="breadcrumb-item"
      >
        <router-link
          v-if="index < breadcrumbs.length - 1"
          :to="crumb.path"
          class="breadcrumb-link"
        >
          {{ crumb.label }}
        </router-link>
        <span v-else class="breadcrumb-current">{{ crumb.label }}</span>
        <span
          v-if="index < breadcrumbs.length - 1"
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
      const consultantId = this.$route.query.id;
      const consultantNames = {
        0: "Ruth Elisabeth Bakken",
        1: "Anne Sofie Nordvik",
      };

      const consultantName = consultantId
        ? consultantNames[consultantId]
        : null;

      const paths = this.$route.path.split("/").filter(Boolean);
      let fullPath = "";
      let crumbs = [{ label: "Hjem", path: "/" }];

      // Hvis vi er på consultantDetails, legg til "Om oss"
      if (paths.includes("consultantDetails")) {
        crumbs.push({ label: "Om oss", path: "/about" });
        crumbs.push({
          label: consultantName || "Konsulent",
          path:
            "/about/consultantDetails" +
            (consultantId ? `?id=${consultantId}` : ""),
        });
      } else {
        // Standard breadcrumb-bygging
        crumbs = [
          { label: "Hjem", path: "/" },
          ...paths.map((segment, index) => {
            fullPath += "/" + segment;
            let label =
              segment === "about"
                ? "Om oss"
                : segment === "contact"
                ? "Kontakt oss"
                : segment.charAt(0).toUpperCase() + segment.slice(1);
            return {
              label,
              path: fullPath,
            };
          }),
        ];
      }
      return crumbs;
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
  height: 190px;
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

.breadcrumb-link,
.breadcrumb-current {
  font-size: 0.9rem;
  font-weight: 500;
  margin: 0 0.1em;
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