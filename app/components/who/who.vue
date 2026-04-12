<template>
  <section class="who" ref="elRef" :class="{ visible: isVisible }">
    <div class="container who-inner">
      <div class="who-image-wrapper">
        <img
          src="/images/website_images/who_compass.jpg"
          alt="Kompass som symboliserer retning og veiledning"
          class="who-image"
          loading="lazy"
        />
      </div>
      <div class="who-text">
        <h2>Hvem er vi?</h2>
        <p>
          Aster hjelper virksomheter med rådgivning, linjeledelse og
          prosjektledelse innen IT, AI, digital transformasjon og
          cybersikkerhet. Vi kombinerer teknisk og økonomisk ekspertise med
          pragmatisk ledelse for å sikre gjennomføring av komplekse prosjekter.
        </p>
        <p>
          Med lang erfaring innen logistikk, retail og sikkerhet, leverer vi
          kvalitetsløsninger som gir målbare resultater. Vi er et jordnært og
          handlingsorientert team som sørger for at strategi blir til handling.
        </p>
        <p>
          Selskapet ble etablert i 1998, og består i dag av erfarne konsulenter
          med både teknisk og økonomisk bakgrunn. Vi jobber i Norden, med
          hovedvekt på Norge.
        </p>
      </div>
    </div>
  </section>
</template>

<script setup>
import { useReveal } from "~/app/composables/useReveal";
const { elRef, isVisible } = useReveal();
</script>

<style scoped>
.who {
  padding: 5rem 0;
  opacity: 0;
  transform: translateY(24px);
  transition: opacity 0.6s ease, transform 0.6s ease;
}

.who.visible {
  opacity: 1;
  transform: translateY(0);
}

.who-inner {
  display: flex;
  align-items: center;
  gap: 4rem;
}

.who-image-wrapper {
  flex-shrink: 0;
  width: 40%;
  max-width: 420px;
}

.who-image {
  width: 100%;
  height: 340px;
  object-fit: cover;
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-md);
  filter: hue-rotate(-18deg) saturate(1.15) brightness(1.15);
}

.who-text {
  flex: 1;
}

.who-text h2 {
  font-size: clamp(1.5rem, 3vw, 2rem);
  margin-bottom: 1.5rem;
  color: var(--color-text);
}

.who-text p {
  font-size: 0.95rem;
  line-height: 1.7;
  color: var(--color-text-secondary);
  margin-bottom: 1rem;
}

.who-text p:last-child {
  margin-bottom: 0;
}

@media screen and (max-width: 1024px) {
  .who-inner {
    gap: 2.5rem;
  }
}

@media screen and (max-width: 768px) {
  .who {
    padding: 3.5rem 0;
  }

  .who-inner {
    flex-direction: column;
    gap: 2rem;
  }

  .who-image-wrapper {
    width: 100%;
    max-width: none;
  }

  .who-image {
    height: 240px;
  }
}
</style>
