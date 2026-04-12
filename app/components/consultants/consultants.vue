<template>
  <section class="consultants">
    <div class="container">
      <h2 class="section-title">Møt våre konsulenter</h2>
      <div class="consultant-grid">
        <NuxtLink
          v-for="person in consultants"
          :key="person.id"
          :to="`/consultantDetails?id=${person.id}`"
          class="consultant-card"
        >
          <div class="card-image-wrap">
            <img
              :src="`/images/consultants/${person.image}`"
              :alt="`Portrett av ${person.name}`"
              loading="lazy"
            />
            <div class="card-image-overlay"></div>
          </div>
          <div class="card-body">
            <h3>{{ person.name }}</h3>
            <span class="card-title">{{ person.title }}</span>
            <span class="card-cta">Les mer <span class="arrow">&rarr;</span></span>
          </div>
        </NuxtLink>
      </div>
    </div>
  </section>
</template>

<script setup>
const consultants = [
  {
    id: 0,
    name: "Ruth Elisabeth Bakken",
    title: "CEO & partner",
    image: "ruth_elisabeth_bakken.png",
  },
  {
    id: 1,
    name: "Anne Sofie Nordvik",
    title: "Senior IT-leder & partner",
    image: "anne_sofie_nordvik.png",
  },
];
</script>

<style scoped>
.consultants {
  padding: 5rem 0;
  background: var(--color-accent);
}

.section-title {
  font-size: clamp(1.5rem, 3vw, 2rem);
  text-align: center;
  margin-bottom: 3rem;
  color: #ffffff;
}

.consultant-grid {
  display: flex;
  justify-content: center;
  gap: 2rem;
  flex-wrap: wrap;
}

.consultant-card {
  display: flex;
  flex-direction: column;
  width: min(320px, 100%);
  background: var(--color-surface);
  border-radius: var(--radius-md);
  overflow: hidden;
  text-decoration: none;
  color: inherit;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.consultant-card:hover {
  transform: translateY(-6px);
  box-shadow: var(--shadow-lg);
}

/* Image with gradient overlay */
.card-image-wrap {
  position: relative;
  overflow: hidden;
}

.consultant-card img {
  width: 100%;
  height: 300px;
  object-fit: cover;
  object-position: top;
  transition: transform 0.4s ease;
}

.consultant-card:hover img {
  transform: scale(1.03);
}

.card-image-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 40%;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.15), transparent);
  pointer-events: none;
}

/* Card body */
.card-body {
  padding: 1.5rem;
  display: flex;
  flex-direction: column;
  gap: 0.3rem;
  border-top: 3px solid var(--color-accent);
}

.card-body h3 {
  font-size: 1.1rem;
  color: var(--color-text);
}

.card-title {
  font-size: 0.875rem;
  color: var(--color-accent);
  font-weight: 500;
}

.card-cta {
  margin-top: 0.75rem;
  font-family: var(--font-heading);
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--color-text-muted);
  transition: color 0.2s ease;
}

.arrow {
  display: inline-block;
  transition: transform 0.2s ease;
}

.consultant-card:hover .card-cta {
  color: var(--color-accent);
}

.consultant-card:hover .arrow {
  transform: translateX(4px);
}

@media screen and (max-width: 480px) {
  .consultants {
    padding: 3.5rem 0;
  }

  .consultant-card {
    width: 100%;
    max-width: 340px;
  }

  .consultant-card img {
    height: 260px;
  }
}
</style>
