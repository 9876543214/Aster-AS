<template>
  <nav class="navbar">
    <div class="nav-content">
      <div class="logo">
        <a href="#home">
          <img src="/images/logos/logo-color.svg" alt="Logo" />
        </a>
      </div>
      <div id="menuToggle" class="hamburger">
        <input type="checkbox" v-model="isMenuActive" />
        <span></span>
        <span></span>
        <span></span>
        <div
          class="nav-links-hamburger"
          :class="{ 'nav-links-active': isMenuActive }"
        >
          <li><a class="link" href="">Hjem</a></li>
          <li><a class="link" href="/about">Om oss</a></li>
          <li><a class="link" href="/contact">Kontakt</a></li>
        </div>
      </div>
      <ul class="nav-links">
        <li><a class="link" href="">Hjem</a></li>
        <li><a class="link" href="/about">Om oss</a></li>
        <li><a class="link" href="/contact">Kontakt</a></li>
      </ul>
      <div
        v-if="showFixedHamburger"
        class="hamburger fixed"
        @click="isMenuActive = !isMenuActive"
      >
        <input type="checkbox" v-model="isMenuActive" style="display: none" />
        <span :class="{ active: isMenuActive }"></span>
        <span :class="{ active: isMenuActive }"></span>
        <span :class="{ active: isMenuActive }"></span>
        <div
          class="nav-links-hamburger"
          :class="{ 'nav-links-active': isMenuActive }"
          @click.stop
        >
          <li><a class="link" href="">Hjem</a></li>
          <li><a class="link" href="/about">Om oss</a></li>
          <li><a class="link" href="/contact">Kontakt</a></li>
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      isMenuActive: false,
      showFixedHamburger: false,
    };
  },
  mounted() {
    window.addEventListener("scroll", this.handleScroll);
  },
  beforeDestroy() {
    window.removeEventListener("scroll", this.handleScroll);
  },
  methods: {
    handleScroll() {
      const navbar = this.$el;
      const rect = navbar.getBoundingClientRect();
      this.showFixedHamburger = rect.bottom <= 0;
      if (!this.showFixedHamburger) this.isMenuActive = false;
    },
  },
};
</script>

<style scoped>
.navbar {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0.3rem;
  background-color: #ffffff;
  color: #000000;
  box-shadow: 0px 4px 40px rgba(18, 13, 13, 0.25);
  z-index: 1000;
}

.nav-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 92%;
}

.logo img {
  height: 41px;
}

.hamburger {
  display: none;
  position: relative;
}

.hamburger input {
  opacity: 0;
  position: absolute;
  z-index: 2;
  height: 100%;
  width: 100%;
  cursor: pointer;
  margin: 0;
}

.hamburger span {
  display: block;
  width: 33px;
  height: 4px;
  margin-bottom: 5px;
  background: #3a3a3a;
  border-radius: 3px;
  transition: transform 0.5s cubic-bezier(0.77, 0.2, 0.05, 1),
    background 0.5s cubic-bezier(0.77, 0.2, 0.05, 1), opacity 0.55s ease;
}

.hamburger span:nth-last-child(3) {
  transform-origin: 0% 0%;
}

.hamburger span:nth-last-child(4) {
  transform-origin: 0% 100%;
}
.hamburger span:nth-last-child(2) {
  transform-origin: 0% 100%;
}

.hamburger input:checked ~ span {
  opacity: 1;
  transform: rotate(45deg) translate(-2px, -1px);
  background: #3a3a3a;
}

.hamburger input:checked ~ span:nth-last-child(3) {
  opacity: 0;
  transform: rotate(0deg) scale(0.2, 0.2);
}

.hamburger input:checked ~ span:nth-last-child(2) {
  transform: rotate(-45deg) translate(-1.6px, 3.5px);
}

.nav-links,
.nav-links-hamburger {
  list-style: none;
  display: flex;
  gap: 2rem;
  font-size: 16px;
}

.link {
  font-family: montserrat;
  color: #000000;
  text-decoration: none;
  height: min-content;
}

.link::after {
  transition: all ease-in-out 0.2s;
  background: none repeat scroll 0 0 #000000;
  content: "";
  display: block;
  height: 2px;
  border-radius: 50px;
  width: 0;
}
.link:hover::after {
  width: 100%;
}

.hamburger.fixed {
  display: flex !important;
  flex-direction: column;
  justify-content: center;
  align-items: flex-end;
  position: fixed;
  top: 18px;
  right: 18px;
  z-index: 1001;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.12);
  padding-right: 9px;
  width: 44px;
  height: 43px;
  padding-top: 3px;
}
.hamburger.fixed .nav-links-hamburger {
  position: absolute;
  top: 54px;
  right: 0;
  background: white;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.12);
  border-radius: 0.2rem;
  padding: 8px 24px 10px 10px;
  opacity: 0;
  pointer-events: none;
  transform: translateY(-10px);
  transition: all 0.3s;
  display: flex;
  flex-direction: column;
  gap: 0.6rem;
  z-index: 1002;
}
.hamburger.fixed .nav-links-hamburger.nav-links-active {
  opacity: 1;
  pointer-events: auto;
  transform: translateY(0);
}

@media (max-width: 610px) {
  .nav-links {
    display: none;
  }
  .hamburger {
    display: block;
  }
  .nav-links-hamburger {
    display: flex;
    flex-direction: column;
    gap: 0.6rem;
    position: absolute;
    top: 100%;
    right: 0;
    background: white;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    opacity: 0;
    transform: translateY(-15px);
    transition: all 0.5s;
    border-radius: 0.2rem;
    padding: 2px 30px 6px 10px;
  }
  .link {
    margin: 0;
    font-size: calc(13px + 0.4vw);
    width: min-content;
  }

  li {
    width: min-content;
    white-space: nowrap;
  }

  .nav-links-hamburger.nav-links-active {
    opacity: 1;
    transform: translateY(0px);
  }
}
</style>