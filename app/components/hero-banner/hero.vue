<template>
  <section class="hero">
    <div class="hero-bg">
      <img
        src="/images/background/hero_home.jpg"
        alt=""
        class="hero-image"
      />
      <div class="hero-overlay"></div>
    </div>
    <div class="hero-content">
      <img src="/images/logos/logo-white.svg" alt="Aster AS" class="hero-logo" />
      <h1 class="hero-title">Fra strategi til handling</h1>
      <p class="hero-subtitle">
        Vi hjelper virksomheter med IT-ledelse, sikkerhet og forbedring av prosesser. 
        Pragmatisk rådgivning som gir målbare resulteter - ikke bare PowerPoint.
      </p>
      <div class="hero-actions">
        <NuxtLink to="/about" class="btn btn-primary">Om oss</NuxtLink>
        <NuxtLink to="/contact" class="btn btn-outline">Kontakt oss</NuxtLink>
      </div>
    </div>
    <div class="scroll-indicator" @click="scrollDown">
      <span></span>
    </div>
  </section>
</template>

<script setup>
function scrollDown() {
  const html = document.documentElement;
  html.style.scrollBehavior = 'auto';

  const start = window.scrollY;
  const target = window.innerHeight;
  const distance = target - start;
  const duration = 1400;
  let startTime = null;

  function step(timestamp) {
    if (!startTime) startTime = timestamp;
    const elapsed = timestamp - startTime;
    const progress = Math.min(elapsed / duration, 1);
    const ease = progress < 0.5
      ? 2 * progress * progress
      : 1 - Math.pow(-2 * progress + 2, 2) / 2;
    window.scrollTo(0, start + distance * ease);
    if (progress < 1) {
      requestAnimationFrame(step);
    } else {
      html.style.scrollBehavior = '';
    }
  }

  requestAnimationFrame(step);
}
</script>

<style scoped>
.hero {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  min-height: calc(100vh - 65px);
  overflow: hidden;
}

.hero-bg {
  position: absolute;
  inset: 0;
  z-index: 0;
}

.hero-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center 50%;
}

.hero-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(
    180deg,
    rgba(25, 97, 100, 0.75) 0%,
    rgba(25, 97, 100, 0.6) 60%,
    rgba(25, 97, 100, 0.8) 100%
  );
}

.hero-content {
  position: relative;
  z-index: 1;
  max-width: 700px;
  padding: 2rem var(--content-padding);
}

.hero-logo {
  height: 52px;
  width: auto;
  margin-bottom: 2.5rem;
}

.hero-title {
  font-size: clamp(2.25rem, 5vw, 3.5rem);
  font-weight: 700;
  line-height: 1.1;
  color: #ffffff;
  margin-bottom: 1.5rem;
  text-wrap: balance;
}

.hero-subtitle {
  font-size: clamp(1rem, 1.8vw, 1.2rem);
  line-height: 1.7;
  color: rgba(255, 255, 255, 0.88);
  margin-bottom: 2.5rem;
  max-width: 540px;
  margin-left: auto;
  margin-right: auto;
}

.hero-actions {
  display: flex;
  justify-content: center;
  gap: 1rem;
}

.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.85rem 2rem;
  border-radius: var(--radius-sm);
  font-family: var(--font-heading);
  font-size: 1rem;
  font-weight: 600;
  text-decoration: none;
  transition: all 0.25s ease;
}

.btn-primary {
  background: #ffffff;
  color: var(--color-accent);
  border: 2px solid #ffffff;
}

.btn-primary:hover {
  background: rgba(255, 255, 255, 0.9);
  border-color: rgba(255, 255, 255, 0.9);
  transform: translateY(-2px);
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
}

.btn-outline {
  background: transparent;
  color: #ffffff;
  border: 2px solid rgba(255, 255, 255, 0.6);
}

.btn-outline:hover {
  background: rgba(255, 255, 255, 0.12);
  border-color: #ffffff;
  transform: translateY(-2px);
}

/* Scroll indicator */
.scroll-indicator {
  position: absolute;
  bottom: 2rem;
  left: 50%;
  transform: translateX(-50%);
  z-index: 1;
  cursor: pointer;
}

.scroll-indicator span {
  display: block;
  width: 24px;
  height: 24px;
  border-right: 2px solid rgba(255, 255, 255, 0.6);
  border-bottom: 2px solid rgba(255, 255, 255, 0.6);
  transform: rotate(45deg);
  animation: scrollBounce 2s ease-in-out infinite;
}

@keyframes scrollBounce {
  0%, 100% { transform: rotate(45deg) translate(0, 0); opacity: 0.6; }
  50% { transform: rotate(45deg) translate(6px, 6px); opacity: 1; }
}

@media screen and (max-width: 480px) {
  .hero-actions {
    flex-direction: column;
    gap: 0.75rem;
    width: 100%;
    max-width: 280px;
    margin: 0 auto;
  }

  .hero-logo {
    height: 40px;
    margin-bottom: 2rem;
  }
}
</style>
