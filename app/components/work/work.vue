<template>
  <div class="work-container container">
    <!-- Intro -->
    <section class="work-intro">
      <h2>Hva om du kunne få frihet, kunder og lønn - uten unødvendig administrasjon?</h2>
      <p>
        I Aster har vi bevisst holdt de sosiale og administrative kostnadene minimale.
        Her finnes ingen salgsavdeling, ingen unødvendig byråkrati, og ingen andre som
        tar en bit av kaka du faktisk baker.
      </p>
    </section>

    <!-- How it works -->
    <section class="how-it-works">
      <h3>Hos oss fungerer det slik</h3>
      <div class="cards-grid">
        <div class="card">
          <div class="card-icon">
            <img src="/images/icons/star_icon.svg" alt="" />
          </div>
          <h4>Du er din egen sjef</h4>
          <p>
            Du jobber selvstendig, bruker erfaringen din og referansene dine.
            Når du fakturerer kunden, går inntekten til deg selv - med unntak av
            et bidrag til dekning av felleskostnader.
          </p>
        </div>
        <div class="card">
          <div class="card-icon">
            <img src="/images/icons/chart_icon.svg" alt="" />
          </div>
          <h4>Innsats = lønn</h4>
          <p>
            Du beholder det du skaper. Ingen lag av administrasjon og dyre
            interne kostnader som spiser av det du tjener.
          </p>
        </div>
        <div class="card">
          <div class="card-icon">
            <img src="/images/icons/cogs_icon.svg" alt="" />
          </div>
          <h4>Kunder gjennom nettverk</h4>
          <p>
            Vi skaffer kunder selv, og vi hjelper hverandre å levere så godt at
            referansene gir oss nye oppdrag - uten en salgsavdeling i midten.
          </p>
        </div>
      </div>
    </section>

    <!-- Requirements -->
    <section class="requirements">
      <h3>Vi ser etter deg som</h3>
      <ul class="requirements-list">
        <li>Har minimum 10 års erfaring innenfor IT-prosjektledelse, IT-rådgivning og/eller IT-ledelse</li>
        <li>Trives med å jobbe fritt og selvstendig</li>
        <li>Har gode referanser som tåler å deles</li>
        <li>Forstår konsulentrollen og kan vise til egen konsulenterfaring</li>
        <li>Har eller bygger egen kundebase, og kan gjerne ta med eksisterende kunder</li>
        <li>Ønsker mer frihet og bedre betalt for jobben du faktisk gjør</li>
      </ul>
    </section>

    <!-- CTA -->
    <section class="work-cta">
      <p>
        Hvis du kjenner at du er klar for et sted der innsats = lønn, og
        konsulentlivet ikke skal betales med lange interne møter og høye sosiale
        kostnader - da kan dette være stedet for deg.
      </p>
      <NuxtLink to="/contact" class="cta-btn">Ta kontakt for en prat</NuxtLink>
    </section>
  </div>
</template>

<script setup>
</script>

<style scoped>
.work-container {
  padding-top: 2rem;
  padding-bottom: 5rem;
}

/* Intro */
.work-intro {
  max-width: 720px;
  margin: 0 auto 3.5rem;
  text-align: center;
}

.work-intro h2 {
  font-size: clamp(1.35rem, 3vw, 1.75rem);
  line-height: 1.3;
  margin-bottom: 1.25rem;
  color: var(--color-text);
}

.work-intro p {
  font-size: 1rem;
  line-height: 1.7;
  color: var(--color-text-secondary);
}

/* How it works */
.how-it-works {
  margin-bottom: 3.5rem;
}

.how-it-works h3 {
  font-size: clamp(1.25rem, 2.5vw, 1.5rem);
  text-align: center;
  margin-bottom: 2rem;
  color: var(--color-text);
}

.cards-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1.5rem;
}

.card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  padding: 2rem 1.5rem;
}

.card-icon {
  width: 64px;
  height: 64px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: none;
  border-radius: var(--radius-sm);
  margin-bottom: 1.25rem;
}

.card-icon img {
  width: 40px;
  height: 40px;
}

.card h4 {
  font-size: 1.05rem;
  font-weight: 600;
  margin-bottom: 0.75rem;
  color: var(--color-text);
}

.card p {
  font-size: 0.925rem;
  line-height: 1.6;
  color: var(--color-text-muted);
}

/* Requirements */
.requirements {
  max-width: 640px;
  margin: 0 auto 3.5rem;
}

.requirements h3 {
  font-size: clamp(1.25rem, 2.5vw, 1.5rem);
  margin-bottom: 1.5rem;
  color: var(--color-text);
}

.requirements-list {
  list-style: none;
  padding: 0;
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.requirements-list li {
  position: relative;
  padding-left: 1.5rem;
  font-size: 0.95rem;
  line-height: 1.6;
  color: var(--color-text-secondary);
}

.requirements-list li::before {
  content: "";
  position: absolute;
  left: 0;
  top: 0.55em;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: var(--color-accent);
}

/* CTA */
.work-cta {
  text-align: center;
  background: var(--color-surface);
  border-radius: var(--radius-lg);
  padding: 3rem 2rem;
  max-width: 640px;
  margin: 0 auto;
}

.work-cta p {
  font-size: 1rem;
  line-height: 1.7;
  color: var(--color-text-secondary);
  margin-bottom: 2rem;
}

.cta-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.75rem 2rem;
  background: var(--color-accent);
  color: #ffffff;
  border-radius: var(--radius-sm);
  font-family: var(--font-heading);
  font-size: 0.95rem;
  font-weight: 600;
  text-decoration: none;
  transition: all 0.25s ease;
}

.cta-btn:hover {
  background: var(--color-accent-hover);
  transform: translateY(-2px);
  box-shadow: 0 4px 16px rgba(25, 97, 100, 0.3);
}

@media screen and (max-width: 1024px) {
  .cards-grid {
    grid-template-columns: repeat(2, 1fr);
  }

  .cards-grid .card:last-child {
    grid-column: 1 / -1;
    max-width: 50%;
    justify-self: center;
  }
}

@media screen and (max-width: 640px) {
  .cards-grid {
    grid-template-columns: 1fr;
    max-width: 480px;
    margin: 0 auto;
  }

  .cards-grid .card:last-child {
    max-width: none;
  }
}

@media screen and (max-width: 768px) {
  .work-intro {
    margin-bottom: 2.5rem;
  }

  .how-it-works,
  .requirements {
    margin-bottom: 2.5rem;
  }
}

@media screen and (max-width: 480px) {
  .work-container {
    padding-bottom: 3.5rem;
  }

  .work-cta {
    padding: 2.5rem 1.5rem;
  }
}
</style>
