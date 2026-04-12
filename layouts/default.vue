<template>
  <div class="app-wrapper">
    <Nav />
    <main class="page-content">
      <slot />
    </main>
    <Footer />
  </div>
</template>

<style scoped>
.app-wrapper {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.page-content {
  flex: 1;
}
</style>
