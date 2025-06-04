<template>
  <div class="who">
    <div class="who-left">
      <img
        src="\images\website_images\who_image.jpg"
        alt="Hjerne som blir matet ideer"
        class="who-image"
      />
    </div>
    <div class="who-right">
      <div>
        <h1>Hvem er vi?</h1>
        <p class="who-text">
          Aster hjelper virksomheter med rådgivning, linjeledelse og
          prosjektledelse innen IT, AI, digital transformasjon og
          cybersikkerhet. Vi kombinerer teknisk og økonomisk ekspertise med
          pragmatisk ledelse for å sikre gjennomføring av komplekse prosjekter.
        </p>
        <p class="who-text">
          Med lang erfaring innen logistikk, retail og telekom, leverer vi
          kvalitetsløsninger som gir målbare resultater. Vi er et jordnært og
          handlingsorientert team som sørger for at strategi blir til handling.
        </p>
        <p class="who-text">
          Selskapet ble etablert i 1998, og består i dag av erfarne konsulenter
          med både teknisk og økonomisk bakgrunn. Vi jobber i Norden, med
          hovedvekt på Norge.
        </p>
      </div>
    </div>
  </div>
</template>
<style>
.who {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: stretch;
  width: 100%;
  margin-top: 5rem;
  gap: 7rem;
  min-height: 100px;
  margin-bottom: 5rem;
  margin-top: 7rem;
  margin-left: -1.2rem;
}
.who h1 {
  font-size: 1.8rem;
  margin-bottom: 1rem;
}
.who div {
  height: 269px;
}
.who p {
  font-size: 14.4px;
  line-height: 1.5;
}

.who-left {
  display: flex;
  justify-content: right;
  margin-top: 5px;
}

.who-image {
  max-height: 100%;
  width: auto;
  object-fit: contain;
}
.who-right {
  display: flex;
  flex-direction: column;
  width: fit-content;
}
.who-text {
  color: #000000;
  margin-bottom: 0.6rem;
  width: 480px;
}

@media screen and (max-width: 950px) {
  .who {
    gap: 4rem;
  }
}

@media screen and (max-width: 900px) {
  .who-text {
    width: 320px;
    margin-bottom: 0.5rem;
  }
  .who div {
    height: 292px;
  }
  .who-right {
    width: 320px;
  }
  .who p {
    font-size: 0.75rem;
    line-height: 1.2;
  }
  .who p {
    font-size: 0.83rem;
    line-height: 1.4;
  }
  .who h1 {
    font-size: 1.7rem;
  }
}

@media screen and (max-width: 800px) {
  .who-text {
    width: 280px;
    margin-bottom: 0.3rem;
  }
  .who div {
    height: 299px;
  }

  .who {
    gap: 3rem;
  }
  .who p {
    font-size: 0.8rem;
    line-height: 1.2;
  }
  .who h1 {
    font-size: 1.6rem;
  }
  .who-right {
    margin-right: -1.3rem;
    width: 280px;
  }
}
@media screen and (max-width: 740px) {
  .who {
    gap: 2rem;
  }
  .who-image {
    object-fit: cover;
    object-position: right;
  }
  .who div {
    height: 267px;
  }
  .who-left {
    width: 218px;
    overflow: hidden;
    margin-top: 5.5px;
  }
  .who-right {
    margin-right: -0.8rem;
    width: 240px;
  }
  .who p {
    font-size: 0.72rem;
    line-height: 1.2;
  }
  .who h1 {
    font-size: 1.5rem;
  }
  .who-text {
    width: 240px;
    margin-bottom: 0.2rem;
  }
}
@media screen and (max-width: 530px) {
  .who {
    flex-direction: column;
    align-items: center;
    gap: 0rem;
    margin-top: 3.5rem;
    margin-left: -0.5rem;
  }
  .who p {
    font-size: 0.8rem;
    line-height: 1.25;
  }
  .who-right {
    width: 100%;
    height: fit-content !important;
    margin-right: 0;
    order: 1;
    justify-content: center;
    align-items: center;
  }
  .who-right div {
    width: 92%;
    height: fit-content !important;
  }
  .who-left {
    order: 2;
    width: 100%;
    align-items: center;
    justify-content: center;
    height: 220px !important;
    overflow: hidden;
    margin-top: 2rem;
  }
  .who-image {
    width: 92%;
    height: auto;
    object-fit: cover;
    object-position: top;
    margin-top: -3rem;
  }
  .who-text {
    width: 100%;
    margin-bottom: 0.1rem;
  }
}
@media screen and (max-width: 400px) {
  .who p {
    font-size: 0.63rem;
  }
}
</style>