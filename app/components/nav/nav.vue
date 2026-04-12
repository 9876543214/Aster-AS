<template>
  <nav class="navbar" ref="navbarRef">
    <div class="nav-content container">
      <NuxtLink to="/" class="logo">
        <img src="/images/logos/logo-color.svg" alt="Aster AS" />
      </NuxtLink>

      <ul class="nav-links">
        <li v-for="link in links" :key="link.to">
          <NuxtLink :to="link.to" class="nav-link">{{ link.label }}</NuxtLink>
        </li>
      </ul>

      <button
        class="hamburger"
        :class="{ open: isMenuOpen }"
        @click="toggleMenu"
        aria-label="Meny"
      >
        <span></span>
        <span></span>
        <span></span>
      </button>
    </div>

    <Transition name="dropdown">
      <div v-if="isMenuOpen" class="mobile-menu" @click="isMenuOpen = false">
        <NuxtLink
          v-for="link in links"
          :key="link.to"
          :to="link.to"
          class="mobile-link"
        >
          {{ link.label }}
        </NuxtLink>
      </div>
    </Transition>

    <!-- Fixed hamburger when scrolled past navbar -->
    <Teleport to="body">
      <Transition name="fade">
        <button
          v-if="showFixed"
          class="hamburger fixed-hamburger"
          :class="{ open: isMenuOpen }"
          @click="toggleMenu"
          aria-label="Meny"
        >
          <span></span>
          <span></span>
          <span></span>

          <Transition name="dropdown">
            <div v-if="isMenuOpen" class="fixed-dropdown" @click.stop="isMenuOpen = false">
              <NuxtLink
                v-for="link in links"
                :key="link.to"
                :to="link.to"
                class="mobile-link"
              >
                {{ link.label }}
              </NuxtLink>
            </div>
          </Transition>
        </button>
      </Transition>
    </Teleport>
  </nav>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount } from "vue";

const links = [
  { to: "/", label: "Hjem" },
  { to: "/about", label: "Om oss" },
  { to: "/work", label: "Jobb hos oss" },
  { to: "/contact", label: "Kontakt" },
];

const isMenuOpen = ref(false);
const showFixed = ref(false);
const navbarRef = ref(null);

function toggleMenu() {
  isMenuOpen.value = !isMenuOpen.value;
}

function handleScroll() {
  if (!navbarRef.value) return;
  const rect = navbarRef.value.getBoundingClientRect();
  const wasFixed = showFixed.value;
  showFixed.value = rect.bottom <= 0;
  if (wasFixed && !showFixed.value) {
    isMenuOpen.value = false;
  }
}

onMounted(() => {
  window.addEventListener("scroll", handleScroll, { passive: true });
});

onBeforeUnmount(() => {
  window.removeEventListener("scroll", handleScroll);
});
</script>

<style scoped>
.navbar {
  position: relative;
  background: var(--color-surface);
  border-bottom: 1px solid var(--color-border);
  z-index: 1000;
}

.nav-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 64px;
}

.logo img {
  height: 38px;
  display: block;
}

/* Desktop links */
.nav-links {
  list-style: none;
  display: flex;
  gap: 2rem;
  margin: 0;
  padding: 0;
}

.nav-link {
  font-family: var(--font-heading);
  font-size: 0.95rem;
  font-weight: 500;
  color: var(--color-text);
  text-decoration: none;
  position: relative;
  padding: 0.25rem 0;
}

.nav-link::after {
  content: "";
  display: block;
  height: 2px;
  background: var(--color-accent);
  border-radius: 2px;
  width: 0;
  transition: width 0.2s ease;
}

.nav-link:hover::after,
.nav-link.router-link-exact-active::after {
  width: 100%;
}

.nav-link.router-link-exact-active {
  color: var(--color-accent);
}

/* Hamburger button */
.hamburger {
  display: none;
  flex-direction: column;
  justify-content: center;
  gap: 5px;
  background: none;
  border: none;
  padding: 8px;
  cursor: pointer;
  z-index: 1001;
}

.hamburger span {
  display: block;
  width: 24px;
  height: 2px;
  background: var(--color-text);
  border-radius: 2px;
  transition: transform 0.3s ease, opacity 0.3s ease;
}

.hamburger.open span:nth-child(1) {
  transform: rotate(45deg) translate(5px, 5px);
}

.hamburger.open span:nth-child(2) {
  opacity: 0;
}

.hamburger.open span:nth-child(3) {
  transform: rotate(-45deg) translate(5px, -5px);
}

/* Mobile menu */
.mobile-menu {
  display: none;
  flex-direction: column;
  padding: 0.5rem 0;
  border-top: 1px solid var(--color-border);
  background: var(--color-surface);
}

.mobile-link {
  font-family: var(--font-heading);
  font-size: 0.95rem;
  font-weight: 500;
  color: var(--color-text);
  text-decoration: none;
  padding: 0.75rem var(--content-padding);
  transition: background-color 0.15s ease;
}

.mobile-link:hover {
  background: var(--color-bg);
}

.mobile-link.router-link-exact-active {
  color: var(--color-accent);
  background: var(--color-accent-light);
  font-weight: 600;
}

/* Fixed hamburger */
.fixed-hamburger {
  display: flex !important;
  position: fixed;
  top: 0;
  right: 0;
  z-index: 2000;
  background: var(--color-surface);
  border-radius: 0 0 0 var(--radius-sm);
  box-shadow: var(--shadow-sm);
  padding: 10px;
  width: 44px;
  height: 44px;
}

.fixed-dropdown {
  position: absolute;
  top: 52px;
  right: 0;
  background: var(--color-surface);
  box-shadow: var(--shadow-md);
  border-radius: var(--radius-sm);
  padding: 0.5rem 0;
  min-width: 180px;
  display: flex;
  flex-direction: column;
}

/* Transitions */
.dropdown-enter-active,
.dropdown-leave-active {
  transition: opacity 0.2s ease, transform 0.2s ease;
}

.dropdown-enter-from,
.dropdown-leave-to {
  opacity: 0;
  transform: translateY(-8px);
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* Responsive */
@media screen and (max-width: 768px) {
  .nav-links {
    display: none;
  }

  .hamburger {
    display: flex;
  }

  .mobile-menu {
    display: flex;
  }
}

@media screen and (min-width: 769px) {
  .fixed-hamburger {
    display: none !important;
  }
}
</style>
