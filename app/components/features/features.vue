<template>
  <section class="features">
    <div class="container">
      <h2 class="section-title">Hva vi tilbyr</h2>
      <p class="section-subtitle">
        Med bred kompetanse og lang erfaring leverer vi resultater som gir varig verdi.
      </p>
      <div class="section-divider"></div>
      <div class="features-grid" ref="gridRef">
        <div
          v-for="(feature, i) in features"
          :key="i"
          class="feature-card"
          :class="{ visible: visibleCards.has(i) }"
          :ref="el => cardRefs[i] = el"
        >
          <div class="feature-icon">
            <img :src="feature.icon" :alt="feature.title" />
          </div>
          <h3>{{ feature.title }}</h3>
          <p>{{ feature.description }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, reactive, onMounted, onBeforeUnmount } from "vue";

const features = [
  {
    icon: "/images/icons/pc_icon.svg",
    title: "IT & digital transformasjon",
    description:
      "Vi hjelper bedrifter med å navigere den digitale fremtiden gjennom strategisk rådgivning og prosjektledelse.",
  },
  {
    icon: "/images/icons/truck_icon.svg",
    title: "Logistikk & distribusjon",
    description:
      "Optimalisering av forsyningskjeder og distribusjonsnettverk for maksimal effektivitet.",
  },
  {
    icon: "/images/icons/key_icon.svg",
    title: "Cybersikkerhet og samsvar",
    description:
      "Beskyttelse av virksomheten din med robuste sikkerhetsløsninger og samsvarsprogrammer.",
  },
  {
    icon: "/images/icons/star_icon.svg",
    title: "Stjernekonsulenter",
    description:
      "Våre konsulenter har lang erfaring og dyp kompetanse innen sine fagområder.",
  },
  {
    icon: "/images/icons/chart_icon.svg",
    title: "Resultatorientert",
    description:
      "Vi fokuserer på målbare resultater og konkret verdiskaping for våre kunder.",
  },
  {
    icon: "/images/icons/cogs_icon.svg",
    title: "Bransjekompetanse",
    description:
      "Dyp forståelse for bransjer som sikkerhet, logistikk, finans og offentlig sektor.",
  },
];

const cardRefs = reactive({});
const visibleCards = reactive(new Set());
let observer = null;

onMounted(() => {
  observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          const index = Object.values(cardRefs).indexOf(entry.target);
          if (index !== -1) {
            visibleCards.add(index);
            observer.unobserve(entry.target);
          }
        }
      });
    },
    { threshold: 0.15 }
  );

  Object.values(cardRefs).forEach((el) => {
    if (el) observer.observe(el);
  });
});

onBeforeUnmount(() => {
  if (observer) observer.disconnect();
});
</script>

<style scoped>
.features {
  padding: 5rem 0;
  background: var(--color-bg);
}

.section-title {
  font-size: clamp(1.5rem, 3vw, 2rem);
  text-align: center;
  margin-bottom: 0.75rem;
  color: var(--color-text);
}

.section-subtitle {
  text-align: center;
  color: var(--color-text-muted);
  font-size: 1.05rem;
  line-height: 1.6;
  max-width: 540px;
  margin: 0 auto 3rem;
}

.section-divider {
  width: 60px;
  height: 3px;
  background: var(--color-accent);
  border-radius: 2px;
  margin: 0 auto 3rem;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1.5rem;
}

.feature-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  padding: 2rem 1.5rem;
  transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
  opacity: 0;
  transform: translateY(30px);
}

.feature-card.visible {
  animation: fadeUp 0.5s ease forwards;
}

.feature-card:nth-child(2).visible { animation-delay: 0.08s; }
.feature-card:nth-child(3).visible { animation-delay: 0.16s; }
.feature-card:nth-child(4).visible { animation-delay: 0.24s; }
.feature-card:nth-child(5).visible { animation-delay: 0.32s; }
.feature-card:nth-child(6).visible { animation-delay: 0.4s; }

.feature-card:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-md);
  border-color: var(--color-accent);
}

.feature-icon {
  width: 64px;
  height: 64px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 1.25rem;
}

.feature-icon img {
  width: 40px;
  height: 40px;
}

.feature-icon img[alt="Cybersikkerhet og samsvar"] {
  clip-path: inset(10% 0);
  transform: scale(1.25);
}

.feature-icon img[alt="Logistikk & distribusjon"] {
  clip-path: inset(10% 0 15% 0);
  transform: scale(1.33);
}

.feature-card h3 {
  font-size: 1.05rem;
  font-weight: 600;
  margin-bottom: 0.75rem;
  color: var(--color-text);
}

.feature-card p {
  font-size: 0.925rem;
  line-height: 1.6;
  color: var(--color-text-muted);
}

@keyframes fadeUp {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@media screen and (max-width: 1024px) {
  .features-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media screen and (max-width: 640px) {
  .features {
    padding: 3.5rem 0;
  }

  .features-grid {
    grid-template-columns: 1fr;
  }
}
</style>
