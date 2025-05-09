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
          <li><a class="link" href="#home">Hjem</a></li>
          <li><a class="link" href="#about">Om oss</a></li>
          <li><a class="link" href="#contact">Kontakt</a></li>
        </div>
      </div>
      <ul class="nav-links">
        <li><a class="link" href="#home">Hjem</a></li>
        <li><a class="link" href="#about">Om oss</a></li>
        <li><a class="link" href="#contact">Kontakt</a></li>
      </ul>
    </div>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      isMenuActive: false,
    };
  },
  watch: {
    isMenuActive(newValue) {
      console.log("isMenuActive changed:", newValue);
    },
  },
};
</script>

<style scoped>
.navbar {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0.6rem;
  background-color: #ffffff;
  color: #000000;
  box-shadow: 0px 4px 40px rgba(0, 0, 0, 0.25);
}

.nav-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 92%;
}

.logo img {
  height: 45px;
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
  font-size: 18px;
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
    font-size: calc(14px + 0.4vw);
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