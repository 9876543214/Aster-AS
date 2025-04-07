<script>
</script>

<template>
  <div class="services">
    <div class="services-header">
      <h1>Våre tjenester</h1>
    </div>
    <div class="services-content">
      <div class="it">
        <img
          src="/images/icons/pc_icon.svg"
          alt="datamaskin ikon"
          id="computer"
        />
        <div>
          <h2>IT & digital transformasjon</h2>
          <p>Rådgivning og prosjektledelse for teknologiske løsninger</p>
        </div>
      </div>
      <div class="logistikk">
        <img
          src="/images/icons/truck_icon.svg"
          alt="lastebil ikon"
          id="truck"
        />
        <div>
          <h2>Logistikk & distrubisjon</h2>
          <p>Effektivisering og forbedring av verdikjeder</p>
        </div>
      </div>
      <div class="sikkerhet">
        <img src="/images/icons/key_icon.svg" alt="nøkkel ikon" id="key" />
        <div>
          <h2>Cybersikkerhet og samsvar</h2>
          <p>Suksess med IT-risikostyring, samsvar og IT-sikkerhet</p>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
.services {
  background-color: white;
  display: flex;
  flex-direction: column;
  z-index: 2;
  align-items: center;
  row-gap: 3rem;
  margin-bottom: 3rem;
}
.services-content {
  display: flex;
  flex-direction: row;
  gap: 10%;
  align-items: flex-end;
  flex-wrap: wrap;
  width: 100vw;
  justify-content: center;
}
.services-content div {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  width: min-content;
}
.services-content div div {
  display: flex;
  flex-direction: column;
  row-gap: 0;
  border-radius: 10px;
  padding: 0.5rem;
}
.services-content h2 {
  font-size: 20px;
  white-space: nowrap;
}

.services-content p {
  font-size: 14px;
  margin-top: 0;
}

#key {
  width: 100px;
  height: 100px;
}
#truck {
  width: 100px;
  height: 100px;
}
#computer {
  width: 75px;
  height: 75px;
  margin-bottom: 0.78rem;
}

@media screen and (max-width: 1100px) {
  .services-content {
    gap: 5%;
  }
}
</style>