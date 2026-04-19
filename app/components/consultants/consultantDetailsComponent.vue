<template>
  <div class="consultant-page" v-if="consultant">
    <!-- Hero banner with consultant name -->
    <section class="consultant-hero">
      <div class="consultant-hero-overlay"></div>
      <div class="consultant-hero-content">
        <h1>{{ consultant.name }}</h1>
        <p>{{ consultant.title }}</p>
      </div>
    </section>

    <!-- Profile content -->
    <div class="consultant-profile container">
      <div class="profile-card">
        <div class="profile-image-col">
          <img
            class="profile-image"
            :src="`/images/consultants/${consultant.image}`"
            :alt="`Portrett av ${consultant.name}`"
          />
          <div class="contact-cards">
            <a
              v-for="info in contactDetails"
              :key="info.title"
              :href="info.link"
              class="contact-card"
            >
              <div class="contact-icon-wrap">
                <img :src="info.icon" :alt="info.alt" />
              </div>
              <div class="contact-text">
                <span class="contact-label">{{ info.title }}</span>
                <span class="contact-value" v-html="info.content"></span>
              </div>
            </a>
          </div>
        </div>

        <div class="profile-text-col">
          <div class="profile-bio">
            <p v-html="consultant.description"></p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div v-else class="not-found">
    <p>Konsulent ikke funnet.</p>
  </div>
</template>

<script setup>
import { ref, computed } from "vue";
import { useRoute } from "vue-router";

const route = useRoute();

const consultants = [
  {
    id: 0,
    name: "Ruth Elisabeth Bakken",
    title: "CEO & partner",
    image: "ruth_elisabeth_bakken.png",
    description:
      "Utdannet sivilingeniør fra NTH/NTNU i 1985 og bedriftsøkonom fra Bedriftsøkonomisk Institutt 1990.<br><br>Ruth har meget variert erfaring fra IT og Telecom bransjen, både fra kunde og leverandør-siden. Før hun etablerte Aster i 1998, jobbet hun i privat og offentlig sektor, innen systemutvikling/-integrasjon, prosjektledelse og ledelse. Hun har deltatt i flere større prosjekter, både nasjonale og nordiske, og har hatt et bredt spekter av oppgaver og ansvarsområder.<br><br>Som konsulent har hun foruten Management for hire, jobbet med prosjektledelse, utvikling/implementering av styringsmodeller for og gjennomføring av større prosjekter, samt tilrettelegge og gjennomføre outsourcing og benchmarking av IT-tjenester. Hun har jobbet for kunder innenfor flere bransjer, som sikkerhet, eforsyning, forsikring, transport, handel og logistikk.",
    phone: "+47 913 51 234",
    email: "ruth.bakken@aster.no",
  },
  {
    id: 1,
    name: "Anne Sofie Nordvik",
    title: "Senior IT-leder & partner",
    image: "anne_sofie_nordvik.png",
    description:
      "Anne Sofie Nordvik er utdannet siviløkonom fra NHH og har 28 års erfaring fra IT- og teknologisektoren. Hun har hatt sentrale roller i både offentlig og privat sektor, med særlig fokus på IT-ledelse, prosjektstyring og digitalisering.<br><br>Gjennom 10 år i REMA 1000 hadde Anne Sofie flere lederstillinger innen IT, hvor hun blant annet hadde ansvar for utvikling, organisering og forbedring av virksomhetens IT-prosesser. Hennes arbeid bidro til økt struktur, standardisering og effektivisering i et komplekst og forretningskritisk IT-landskap.<br><br>Anne Sofie har erfaring fra både kunde- og konsulentsiden, og har dermed et helhetlig perspektiv på virksomhetsutvikling og teknologiimplementering. Hun har ledet og deltatt i prosjekter innen blant annet detaljhandel, logistikk og offentlig sektor, og er vant til å navigere i skjæringspunktet mellom forretning og teknologi.<br><br>I tillegg er Anne Sofie en pådriver for kompetanseutvikling innen ny teknologi. Hun har utviklet og gjennomført kurs i prompt engineering og bruk av generativ AI, med mål om å gjøre avansert teknologi forståelig og tilgjengelig for virksomheter og medarbeidere.<br><br>Med solid forretningsforståelse, teknologisk innsikt og sterk gjennomføringsevne, er Anne Sofie en verdifull rådgiver og samarbeidspartner for kunder med høye krav til kvalitet og leveranseevne.",
    phone: "+47 91789679",
    email: "anne.sofie.nordvik@aster.no",
  },
];

const consultant = computed(() => {
  const id = Number(route.query.id);
  return consultants.find((c) => c.id === id);
});

const contactDetails = computed(() => {
  if (!consultant.value) return [];
  return [
    {
      title: "Telefon",
      content: consultant.value.phone,
      link: `tel:${consultant.value.phone.replace(/\s/g, "")}`,
      icon: "/images/icons/phone-symbol-black.svg",
      alt: "Telefon-ikon",
    },
    {
      title: "E-post",
      content: consultant.value.email,
      link: `mailto:${consultant.value.email}`,
      icon: "/images/icons/mail-symbol-black.svg",
      alt: "E-post-ikon",
    },
  ];
});
</script>

<style scoped>
/* Hero banner */
.consultant-hero {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  height: 35vh;
  min-height: 220px;
  max-height: 340px;
  background: var(--color-accent);
  overflow: hidden;
}

.consultant-hero-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(
    135deg,
    rgba(25, 97, 100, 1) 0%,
    rgba(19, 74, 77, 0.95) 100%
  );
}

.consultant-hero-content {
  position: relative;
  z-index: 1;
  padding: 2rem var(--content-padding);
}

.consultant-hero-content h1 {
  font-size: clamp(1.75rem, 4vw, 2.75rem);
  font-weight: 700;
  color: #ffffff;
  margin-bottom: 0.5rem;
  text-wrap: balance;
}

.consultant-hero-content p {
  font-size: clamp(1rem, 1.8vw, 1.2rem);
  color: rgba(255, 255, 255, 0.75);
  font-weight: 400;
}

/* Profile section */
.consultant-profile {
  padding-top: 3rem;
  padding-bottom: 4rem;
}

.profile-card {
  display: flex;
  gap: 3rem;
  background: var(--color-surface);
  border-radius: var(--radius-md);
  padding: 2.5rem;
  box-shadow: var(--shadow-sm);
}

/* Image column */
.profile-image-col {
  flex-shrink: 0;
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
  width: 320px;
}

.profile-image {
  width: 100%;
  height: 400px;
  object-fit: cover;
  object-position: top;
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-md);
}

/* Contact cards */
.contact-cards {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.contact-card {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 1rem 1.25rem;
  background: var(--color-bg);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-sm);
  text-decoration: none;
  color: inherit;
  transition: border-color 0.2s ease, transform 0.2s ease;
}

.contact-card:hover {
  border-color: var(--color-accent);
  transform: translateY(-1px);
}

.contact-icon-wrap {
  flex-shrink: 0;
  width: 20px;
  height: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.contact-icon-wrap img {
  width: 18px;
  height: 18px;
}

.contact-text {
  display: flex;
  flex-direction: column;
  gap: 0.15rem;
  min-width: 0;
}

.contact-label {
  font-family: var(--font-heading);
  font-size: 0.7rem;
  font-weight: 600;
  color: var(--color-text-muted);
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.contact-value {
  font-size: 0.875rem;
  color: var(--color-text);
}

/* Text column */
.profile-text-col {
  flex: 1;
  min-width: 0;
}

.profile-bio p {
  font-size: 0.95rem;
  line-height: 1.75;
  color: var(--color-text-secondary);
  overflow-wrap: break-word;
}

/* Not found */
.not-found {
  min-height: 50vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 2rem;
}

.not-found p {
  font-size: 1.1rem;
  color: var(--color-text-muted);
}

/* Responsive */
@media screen and (max-width: 1024px) {
  .profile-card {
    gap: 2.5rem;
    padding: 2rem;
  }

  .profile-image-col {
    width: 280px;
  }

  .profile-image {
    height: 350px;
  }
}

@media screen and (max-width: 768px) {
  .profile-card {
    flex-direction: column;
    align-items: center;
    gap: 2rem;
    padding: 1.5rem;
  }

  .profile-image-col {
    width: 100%;
    max-width: 340px;
    align-items: center;
  }

  .profile-image {
    height: 360px;
  }

  .contact-cards {
    flex-direction: row;
    width: 100%;
  }

  .contact-card {
    flex: 1;
  }

  .consultant-profile {
    padding-top: 2rem;
    padding-bottom: 3rem;
  }
}

@media screen and (max-width: 480px) {
  .profile-card {
    padding: 1.25rem;
  }

  .profile-image-col {
    max-width: 280px;
  }

  .profile-image {
    height: 300px;
  }

  .contact-cards {
    flex-direction: column;
  }

  .consultant-hero {
    height: 30vh;
    min-height: 180px;
  }

  .profile-bio p {
    font-size: 0.9rem;
    line-height: 1.65;
  }
}
</style>
