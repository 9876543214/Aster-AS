<script setup>
</script>

<template>
  <div class="work-page">
    <section class="work-hero">
      <img
        src="/images/background/work_arrow.jpg"
        alt=""
        class="work-hero-img"
      />
      <div class="work-hero-overlay"></div>
      <div class="work-hero-content">
        <h1>Jobb hos oss</h1>
        <p>Frihet, ansvar og rettferdig lønn</p>
      </div>
    </section>
    <div class="work-content">
      <work />
    </div>
  </div>
</template>

<style scoped>
.work-page {
  display: flex;
  flex-direction: column;
}

.work-hero {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  height: 40vh;
  min-height: 260px;
  max-height: 400px;
  overflow: hidden;
}

.work-hero-img {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
}

.work-hero-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(
    180deg,
    rgba(25, 97, 100, 0.72) 0%,
    rgba(25, 97, 100, 0.55) 50%,
    rgba(25, 97, 100, 0.75) 100%
  );
}

.work-hero-content {
  position: relative;
  z-index: 1;
  padding: 2rem var(--content-padding);
}

.work-hero-content h1 {
  font-size: clamp(2rem, 4vw, 3rem);
  font-weight: 700;
  color: #ffffff;
  margin-bottom: 0.75rem;
}

.work-hero-content p {
  font-size: clamp(1rem, 1.8vw, 1.2rem);
  color: rgba(255, 255, 255, 0.85);
}

.work-content {
  flex: 1;
}

@media screen and (max-width: 480px) {
  .work-hero {
    height: 35vh;
    min-height: 220px;
  }
}
</style>
