<script setup>
import { onMounted } from "vue";

onMounted(() => {
  if ("IntersectionObserver" in window) {
    const observer = new IntersectionObserver(
      (entries, observer) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            // Reset transform to translateY(0) when the .show class is added
            entry.target.style.transform = "translateY(0)";
            entry.target.classList.add("show");
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold: 0 }
    );

    const elements = document.querySelectorAll(".pop-up-element-services");
    elements.forEach((element) => {
      // Generate random delay between 0.1s and 0.5s
      const randomDelay = (Math.random() * 0.2 + 0.1).toFixed(2);
      element.style.transitionDelay = `${randomDelay}s`;

      // Generate random translateY distance between 150px and 250px
      const randomDistance = Math.random() * 100 + 150;
      element.style.transform = `translateY(${randomDistance}px)`;

      observer.observe(element);
    });
  }
});
</script>

<template>
  <div class="services">
    <div class="services-header">
      <h1>Våre tjenester</h1>
    </div>
    <div class="services-content">
      <div class="it pop-up-element-services hidden">
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
      <div class="logistikk pop-up-element-services hidden">
        <img
          src="/images/icons/truck_icon.svg"
          alt="lastebil ikon"
          id="truck"
        />
        <div>
          <h2>Logistikk & distribisjon</h2>
          <p>Effektivisering og målrettet forbedring av verdikjeder</p>
        </div>
      </div>
      <div class="sikkerhet pop-up-element-services hidden">
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
  background-color: #f4f4f4;
  display: flex;
  flex-direction: column;
  z-index: 2;
  align-items: center;
  row-gap: 3rem;
  margin-bottom: 3rem;
  padding-top: 2rem;
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
  justify-content: end;
  width: 300px;
}
.services-content div div {
  display: flex;
  flex-direction: column;
  row-gap: 0;
  align-items: start;
  border-radius: 10px;
  padding: 1rem;
  padding-top: 1.2rem;
  padding-bottom: 1.2rem;
}
.services-content h2 {
  font-size: 20px;
  white-space: nowrap;
  color: rgb(0, 0, 0);
  margin-bottom: 0.9rem;
}

.services-content p {
  font-size: 14px;
  margin-top: 0;
  color: rgb(0, 0, 0);
  font-weight: 390;
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
  margin-bottom: 1rem;
}

.pop-up-element-services {
  opacity: 0;
  transform: translateY(200px);
  transition: all 0.8s ease-in-out;
  will-change: transform, opacity;
}

.pop-up-element-services.show {
  opacity: 1;
  transform: translateY(0);
}

@media screen and (max-width: 1200px) {
  .services-content {
    gap: 5%;
  }
}
</style>