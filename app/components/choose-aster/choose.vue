<script>
</script>

<template>
  <div class="choose">
    <div class="choose-header">
      <h1>Hvorfor velge Aster?</h1>
    </div>
    <div class="choose-content">
      <div class="stjernekonsulenter">
        <div class="img">
          <img src="/images/icons/star_icon.svg" alt="stjerne ikon" id="star" />
        </div>
        <div class="stjernekonsulenter-content">
          <h2>Stjernekonsulenter</h2>
          <p>Erfarne konsulenter med både teknisk og økonomisk ekspertise</p>
        </div>
      </div>
      <div class="resultat">
        <div class="img">
          <img
            src="/images/icons/chart_icon.svg"
            alt="linjediagram ikon"
            id="chart"
          />
        </div>
        <div class="resultat-content">
          <h2>Resultatorientert</h2>
          <p>Vi leverer tjenester av høy kvalitet til riktig tid og kostnad</p>
        </div>
      </div>
      <div class="kompetanse">
        <div class="img">
          <img src="/images/icons/cogs_icon.svg" alt="tannhjul ikon" id="cog" />
        </div>
        <div class="kompetanse-content">
          <h2>Bransjekompetanse</h2>
          <p>Dyp forståelse for IT, sikkerhet, logistikk og retail</p>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
.choose {
  background-color: white;
  display: flex;
  flex-direction: column;
  z-index: 2;
  align-items: center;
  row-gap: 2.7rem;
  margin-bottom: 3rem;
}
.choose-content {
  display: flex;
  flex-direction: row;
  gap: 10%;
  align-items: flex-end;
  flex-wrap: wrap;
  width: 100vw;
  justify-content: center;
}
.choose-content div {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: end;
  width: 300px;
}
.choose-content div div {
  display: flex;
  flex-direction: column;
  row-gap: 0;
  border-radius: 10px;
}
.stjernekonsulenter-content,
.resultat-content,
.kompetanse-content {
  display: flex;
  flex-direction: column;
  align-items: start !important;
  border-radius: 10px;
  padding: 0.8rem;
  background-color: #1a237e;
  color: white;
}
.choose-content h2 {
  font-size: 20px;
  white-space: nowrap;
  width: 245px;
}

.choose-content p {
  font-size: 14px;
  margin-top: 0;
  width: 245px;
}
.img {
  margin: 1rem;
  display: flex;
  justify-content: center;
  width: 200px;
  align-items: center;
}
#star {
  width: 75px;
  height: 75px;
}
#chart {
  width: 75px;
  height: 75px;
}
#cog {
  width: 75px;
  height: 75px;
}

@media screen and (max-width: 1100px) {
  .choose-content {
    gap: 5%;
  }
}
</style>