<template>
  <div class="experience">
    <div class="experience-left">
      <div>
        <h1>Erfarne konsulenter</h1>
        <p class="experience-text">
          Aster betyr stjerne, og våre stjernekonsulenter har som mål å skape
          verdi for kundene gjennom høy kvalitet og kostnadseffektive leveranser
          levert til riktig tid.
        </p>
        <p class="experience-text">
          Vi bistår våre kunder med analyser, prosesser og prosjekter for å
          utvikle og forbedre virksomheten.
        </p>
        <p class="experience-text">
          Hovedmålet vårt er å hjelpe kunden med å øke lønnsomhet og
          kundetilfredshet. Våre fagområder inkluderer outsourcing, ledelse,
          forretningsutvikling, IT-sikkerhet, økonomistyring og
          kvalitetssikring.
        </p>
      </div>
    </div>
    <div class="experience-right">
      <img
        src="\images\website_images\experience_image.png"
        alt="Et spredt mønster med små stjerneformede konfettier"
        class="experience-image"
      />
    </div>
  </div>
</template>
<style>
.experience {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: stretch;
  width: 100%;
  margin-top: 5rem;
  gap: 6rem;
  min-height: 100px;
  margin-bottom: 50rem;
  margin-top: 7rem;
  margin-left: -2.8rem;
}
.experience h1 {
  font-size: 1.8rem;
  margin-bottom: 1rem;
}
.experience div {
  height: 289px;
}
.experience p {
  font-size: 14.4px;
  line-height: 1.5;
}

.experience-right {
  display: flex;
  justify-content: right;
  margin-top: 5px;
}

.experience-image {
  max-height: 100%;
  width: auto;
  object-fit: contain;
}
.experience-left {
  display: flex;
  flex-direction: column;
  width: fit-content;
}
.experience-text {
  color: #000000;
  margin-bottom: 0.6rem;
  width: 480px;
}

@media screen and (max-width: 950px) {
  .experience {
    gap: 4rem;
    margin-left: -3.2rem;
  }
}

@media screen and (max-width: 900px) {
  .experience-text {
    width: 320px;
    margin-bottom: 0.5rem;
  }
  .experience div {
    height: 292px;
  }
  .experience-left {
    width: 320px;
  }
  .experience p {
    font-size: 0.75rem;
    line-height: 1.2;
  }
  .experience p {
    font-size: 0.83rem;
    line-height: 1.4;
  }
  .experience h1 {
    font-size: 1.7rem;
  }
}

@media screen and (max-width: 800px) {
  .experience-text {
    width: 280px;
    margin-bottom: 0.3rem;
  }
  .experience div {
    height: 273px;
  }
  .experience {
    gap: 3rem;
  }
  .experience p {
    font-size: 0.8rem;
    line-height: 1.2;
  }
  .experience h1 {
    font-size: 1.6rem;
  }
  .experience-left {
    width: 280px;
  }
}
@media screen and (max-width: 740px) {
  .experience {
    gap: 1rem;
    margin-left: -0.9rem;
    margin-top: 1rem;
  }

  .experience-left {
    width: 250px;
    margin-left: 1.6rem;
  }
  .experience-right {
    width: 250px;
    justify-content: left;
  }
  .experience div {
    height: 226px;
  }
  .experience p {
    font-size: 0.72rem;
    line-height: 1.2;
    width: 250px;
  }
  .experience h1 {
    font-size: 1.43rem;
    width: 240px;
  }
  .experience-text {
    margin-bottom: 0.2rem;
  }
}
@media screen and (max-width: 530px) {
  .experience {
    flex-direction: column;
    align-items: center;
    gap: 0rem;
    margin-top: 4rem;
    margin-left: -0.5rem;
  }
  .experience-left {
    width: 100%;
    height: fit-content !important;
    margin-left: 0;
    order: 1;
    justify-content: center;
    align-items: center;
  }
  .experience-left div {
    width: 94%;
    height: fit-content !important;
  }
  .experience-right {
    order: 2;
    width: 100%;
    align-items: center;
    justify-content: center;
    height: 220px !important;
    overflow: hidden;
    margin-top: 2rem;
  }
  .experience-image {
    width: auto;
    height: 1000px;
    object-fit: cover;
    object-position: top;
    margin-top: -3rem;
    transform: rotate(-90deg);
  }
  .experience-text {
    width: 100%;
    margin-bottom: 0.1rem;
  }
  .experience p {
    font-size: 0.8rem;
    line-height: 1.25;
    width: 100%;
  }
}
</style>