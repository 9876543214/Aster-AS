<template>
  <section class="about-hero">
    <div class="video-bg">
      <video
        autoplay
        muted
        loop
        playsinline
        class="hero-video"
      >
        <source src="/videos/about_hero.mp4" type="video/mp4" />
      </video>
      <div class="hero-overlay"></div>
    </div>

    <div class="hero-content">
      <span class="hero-label">Om Aster</span>
      <h1 class="hero-title">Vi gjør strategi om til handling</h1>
      <p class="hero-subtitle">
        Siden 1998 har vi hjulpet virksomheter med rådgivning, prosjektledelse
        og digital transformasjon - med erfarne konsulenter som leverer resultater.
      </p>

      <div class="hero-stats">
        <div class="stat">
          <span class="stat-number">30+</span>
          <span class="stat-label">Års erfaring</span>
        </div>
        <div class="stat-divider"></div>
        <div class="stat">
          <span class="stat-number">50+</span>
          <span class="stat-label">Fullførte prosjekter</span>
        </div>
        <div class="stat-divider"></div>
        <div class="stat">
          <span class="stat-number">15+</span>
          <span class="stat-label">Store kunder</span>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
</script>

<style scoped>
.about-hero {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  min-height: 75vh;
  overflow: hidden;
}

.video-bg {
  position: absolute;
  inset: 0;
  z-index: 0;
}

.hero-video {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center 95%;
}

.hero-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(
    180deg,
    rgba(30, 40, 45, 0.75) 0%,
    rgba(30, 40, 45, 0.6) 40%,
    rgba(30, 40, 45, 0.8) 100%
  );
}

.hero-content {
  position: relative;
  z-index: 1;
  max-width: 750px;
  padding: 3rem var(--content-padding);
}

.hero-label {
  display: inline-block;
  font-family: var(--font-heading);
  font-size: 0.8rem;
  font-weight: 600;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: rgba(255, 255, 255, 0.7);
  margin-bottom: 1.25rem;
  border: 1px solid rgba(255, 255, 255, 0.3);
  padding: 0.4rem 1rem;
  border-radius: 100px;
}

.hero-title {
  font-size: clamp(2rem, 4.5vw, 3.25rem);
  font-weight: 700;
  line-height: 1.15;
  color: #ffffff;
  margin-bottom: 1.25rem;
  text-wrap: balance;
}

.hero-subtitle {
  font-size: clamp(0.95rem, 1.6vw, 1.15rem);
  line-height: 1.7;
  color: rgba(255, 255, 255, 0.85);
  max-width: 560px;
  margin: 0 auto 3rem;
}

.hero-stats {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 2rem;
}

.stat {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.35rem;
}

.stat-number {
  font-family: var(--font-heading);
  font-size: clamp(1.75rem, 3vw, 2.5rem);
  font-weight: 700;
  color: #ffffff;
}

.stat-label {
  font-size: 0.8rem;
  font-weight: 500;
  color: rgba(255, 255, 255, 0.65);
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.stat-divider {
  width: 1px;
  height: 48px;
  background: rgba(255, 255, 255, 0.25);
}

@media screen and (max-width: 768px) {
  .about-hero {
    min-height: 65vh;
  }

  .hero-stats {
    gap: 1.5rem;
  }
}

@media screen and (max-width: 480px) {
  .about-hero {
    min-height: 60vh;
  }

  .hero-subtitle {
    margin-bottom: 2rem;
  }

  .hero-stats {
    gap: 1rem;
  }

  .stat-divider {
    height: 36px;
  }

  .stat-label {
    font-size: 0.7rem;
  }
}
</style>
