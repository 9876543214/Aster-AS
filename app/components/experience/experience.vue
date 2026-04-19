<template>
  <section class="experience" ref="elRef" :class="{ visible: isVisible }">
    <div class="container experience-inner">
      <div class="experience-text">
        <h2>Erfarne konsulenter</h2>
        <p>
          Aster betyr stjerne, og våre stjernekonsulenter har som mål å skape
          verdi for kundene gjennom høy kvalitet og kostnadseffektive leveranser
          levert til riktig tid.
        </p>
        <p>
          Vi bistår våre kunder med analyser, prosesser og prosjekter for å
          utvikle og forbedre virksomheten.
        </p>
        <p>
          Hovedmålet vårt er å hjelpe kunden med å øke lønnsomhet og
          kundetilfredshet. Våre fagområder inkluderer outsourcing, ledelse,
          forretningsutvikling, IT-sikkerhet, økonomistyring og
          kvalitetssikring.
        </p>
      </div>
      <div class="experience-image-wrapper">
        <img
          src="/images/website_images/experience_rope.jpg"
          alt="Orange tau knyttet rundt stolpe - samarbeid og styrke"
          class="experience-image"
          loading="lazy"
        />
      </div>
    </div>
  </section>
</template>

<script setup>
import { useReveal } from "~/app/composables/useReveal";
const { elRef, isVisible } = useReveal();
</script>

<style scoped>
.experience {
  padding: 5rem 0;
  background: var(--color-surface);
  opacity: 0;
  transform: translateY(24px);
  transition: opacity 0.6s ease, transform 0.6s ease;
}

.experience.visible {
  opacity: 1;
  transform: translateY(0);
}

.experience-inner {
  display: flex;
  align-items: center;
  gap: 4rem;
}

.experience-text {
  flex: 1;
}

.experience-text h2 {
  font-size: clamp(1.5rem, 3vw, 2rem);
  margin-bottom: 1.5rem;
  color: var(--color-text);
}

.experience-text p {
  font-size: 0.95rem;
  line-height: 1.7;
  color: var(--color-text-secondary);
  margin-bottom: 1rem;
}

.experience-text p:last-child {
  margin-bottom: 0;
}

.experience-image-wrapper {
  flex-shrink: 0;
  width: 40%;
  max-width: 420px;
}

.experience-image {
  width: 100%;
  height: 340px;
  object-fit: cover;
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-md);
}

@media screen and (max-width: 1024px) {
  .experience-inner {
    gap: 2.5rem;
  }
}

@media screen and (max-width: 768px) {
  .experience {
    padding: 3.5rem 0;
  }

  .experience-inner {
    flex-direction: column;
    gap: 2rem;
  }

  .experience-image-wrapper {
    width: 100%;
    max-width: none;
    order: -1;
  }

  .experience-image {
    height: 240px;
  }
}
</style>
