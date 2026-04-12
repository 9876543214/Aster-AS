<template>
  <section class="customers">
    <div class="container">
      <h2 class="section-title">Kunder som stoler på oss</h2>
      <div class="logo-grid">
        <div v-for="customer in customers" :key="customer.name" class="logo-item">
          <img :src="customer.logo" :alt="customer.name" loading="lazy" />
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const customers = [
  { name: "Rema 1000", logo: "/images/customers/Rema1000-logo.svg" },
  { name: "Kolly", logo: "/images/customers/Kolly-logo.svg" },
  { name: "Norwegian", logo: "/images/customers/Norwegian_logo.svg" },
  { name: "Posten", logo: "/images/customers/Posten-logo.svg" },
  { name: "Statens vegvesen", logo: "/images/customers/statensvegvesen-logo.svg" },
  { name: "Telenor", logo: "/images/customers/Telenor-Logo.svg" },
];
</script>

<style scoped>
.customers {
  padding: 4rem 0;
  background: var(--color-surface);
}

.section-title {
  font-size: clamp(1.5rem, 3vw, 2rem);
  text-align: center;
  margin-bottom: 3rem;
  color: var(--color-text);
}

.logo-grid {
  display: grid;
  grid-template-columns: repeat(6, 1fr);
  gap: 2rem;
  align-items: center;
}

.logo-item {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 1rem;
}

.logo-item img {
  max-width: 140px;
  max-height: 50px;
  width: 100%;
  object-fit: contain;
}

@media screen and (max-width: 1024px) {
  .logo-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

@media screen and (max-width: 480px) {
  .customers {
    padding: 3rem 0;
  }

  .logo-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 1.5rem;
  }

  .logo-item img {
    max-width: 110px;
  }
}
</style>
