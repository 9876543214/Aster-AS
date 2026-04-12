<script setup>
</script>

<template>
  <div class="contact-page">
    <section class="contact-hero">
      <img
        src="/images/background/contact_lighthouse.jpg"
        alt=""
        class="contact-hero-img"
      />
      <div class="contact-hero-overlay"></div>
      <div class="contact-hero-content">
        <h1>Kontakt oss</h1>
        <p>Vi hører gjerne fra deg</p>
      </div>
    </section>
    <div class="contact-content">
      <contact />
    </div>
  </div>
</template>

<style scoped>
.contact-page {
  display: flex;
  flex-direction: column;
}

.contact-hero {
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

.contact-hero-img {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center 18%;
}

.contact-hero-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(
    180deg,
    rgba(25, 97, 100, 0.7) 0%,
    rgba(25, 97, 100, 0.55) 50%,
    rgba(25, 97, 100, 0.75) 100%
  );
}

.contact-hero-content {
  position: relative;
  z-index: 1;
  padding: 2rem var(--content-padding);
}

.contact-hero-content h1 {
  font-size: clamp(2rem, 4vw, 3rem);
  font-weight: 700;
  color: #ffffff;
  margin-bottom: 0.75rem;
}

.contact-hero-content p {
  font-size: clamp(1rem, 1.8vw, 1.2rem);
  color: rgba(255, 255, 255, 0.85);
}

.contact-content {
  flex: 1;
}

@media screen and (max-width: 480px) {
  .contact-hero {
    height: 35vh;
    min-height: 220px;
  }
}
</style>
