<template>
  <section class="cta">
    <div class="container">
      <div class="cta-card">
        <h2>Klar for en prat?</h2>
        <p>
          Vi hører gjerne fra deg. Ta kontakt for å diskutere hvordan vi kan
          hjelpe din virksomhet med å nå sine mål.
        </p>
        <NuxtLink to="/contact" class="cta-btn">Ta kontakt</NuxtLink>
      </div>
    </div>
  </section>
</template>

<script setup>
</script>

<style scoped>
.cta {
  padding: 5rem 0;
  background: var(--color-accent);
}

.cta-card {
  text-align: center;
  max-width: 700px;
  margin: 0 auto;
}

.cta-card h2 {
  font-size: clamp(1.5rem, 3vw, 2rem);
  margin-bottom: 1rem;
  color: #ffffff;
}

.cta-card p {
  font-size: 1.05rem;
  line-height: 1.6;
  color: rgba(255, 255, 255, 0.85);
  margin-bottom: 2rem;
  max-width: 480px;
  margin-left: auto;
  margin-right: auto;
}

.cta-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.75rem 2rem;
  background: #ffffff;
  color: var(--color-accent);
  border-radius: var(--radius-sm);
  font-family: var(--font-heading);
  font-size: 0.95rem;
  font-weight: 600;
  text-decoration: none;
  transition: all 0.25s ease;
}

.cta-btn:hover {
  background: rgba(255, 255, 255, 0.9);
  transform: translateY(-2px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
}

@media screen and (max-width: 768px) {
  .cta {
    padding: 3.5rem 0;
  }
}

@media screen and (max-width: 480px) {
  .cta {
    padding: 3rem 0;
  }

  .cta-card {
    padding: 2.5rem 1.5rem;
  }
}
</style>
