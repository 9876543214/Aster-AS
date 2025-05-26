<template>
  <div class="who">
    <div class="left">
      <img
        src="\images\website_images\who_image.jpg"
        alt="Brain getting fed ideas"
        class="who-image"
      />
    </div>
    <div class="right">
      <h1>Hvem er vi?</h1>
      <p class="who-text">
        Aster hjelper virksomheter med rådgivning, linjeledelse og
        prosjektledelse innen IT, AI, digital transformasjon og cybersikkerhet.
        Vi kombinerer teknisk og økonomisk ekspertise med pragmatisk ledelse for
        å sikre gjennomføring av komplekse prosjekter.
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
</template>
<style>
.who {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: stretch;
  width: 100%;
  margin-top: 5rem;
  gap: 5rem;
  min-height: 100px;
  margin-bottom: 50rem;
  margin-top: 7rem;
}
.who h1 {
  font-size: 1.8rem;
  margin-bottom: 1rem;
}
.who div {
  height: 290px;
  width: 60%;
}

.left {
  display: flex;
  justify-content: right;
  margin-top: 5px;
}

.who-image {
  max-height: 100%;
  width: auto;
  object-fit: contain;
}
.right {
  display: flex;
  flex-direction: column;
  width: fit-content;
}
.who-text {
  color: #000000;
  margin-bottom: 0.6rem;
  width: 350px;
}
@media screen and (max-width: 800px) {
  .who-text {
    width: 280px;
    margin-bottom: 0.4rem;
  }
  .who div {
    height: 332px;
  }

  .who {
    gap: 3rem;
  }
  .left {
    margin-left: 3rem;
  }
}
</style>