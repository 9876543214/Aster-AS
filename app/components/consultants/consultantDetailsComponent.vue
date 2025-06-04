<template>
  <div class="consultantDetails" v-if="consultant">
    <div class="consultantDetailsContent">
      <img
        id="consultantImage"
        :src="`images/consultants/${consultant.image}`"
        :alt="`Portrett av ${consultant.name}`"
      />
      <div class="consultantDetailsRight">
        <div class="consultantDetailsText">
          <h2>{{ consultant.title }}</h2>
          <p v-html="consultant.description"></p>
        </div>
        <div class="consultantContactDetails">
          <div
            v-for="info in contactDetails"
            :key="info.title"
            class="info-item"
          >
            <div class="icon">
              <img :src="info.icon" :alt="info.alt" class="icon" />
            </div>
            <div class="text">
              <h2>{{ info.title }}</h2>
              <p v-html="info.content"></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div v-else>
    <p>Konsulent ikke funnet.</p>
  </div>
</template>
<script setup>
import { ref, computed } from "vue";
import { useRoute } from "vue-router";

const route = useRoute();

const consultants = ref([
  {
    id: 0,
    name: "Ruth Elisabeth Bakken",
    title: "CEO & partner",
    image: "ruth_elisabeth_bakken.png",
    description:
      "Utdannet sivilingeniør fra NTH/NTNU i 1985 og bedriftsøkonom fra Bedriftsøkonomisk Institutt 1990.<br> <br> Ruth har meget variert erfaring fra IT og Telecom bransjen, både fra kunde og leverandør-siden. Før hun etablerte Aster i 1998, jobbet hun i privat og offentlig sektor, innen systemutvikling/-integrasjon, prosjektledelse og ledelse. Hun har deltatt i flere større prosjekter, både nasjonale og nordiske, og har hatt et bredt spekter av oppgaver og ansvarsområder. Som konsulent har hun foruten Management for hire, jobbet med prosjektledelse, utvikling/implementering av styringsmodeller for og gjennomføring av større prosjekter, samt tilrettelegge og gjennomføre outsourcing og benchmarking av IT-tjenester. Hun har jobbet for kunder innenfor flere bransjer, som telekom, eforsyning, forsikring, transport, handel og logistikk",
    phone: "+47 123 45 678",
    email: "ruth.bakken@aster.no",
  },
  {
    id: 1,
    name: "Anne Sofie Nordvik",
    title: "Senior IT-leder & partner",
    image: "anne_sofie_nordvik.png",
    description:
      "Anne Sofie Nordvik er utdannet siviløkonom fra NHH og har 28 års erfaring fra IT- og teknologisektoren. Hun har hatt sentrale roller i både offentlig og privat sektor, med særlig fokus på IT-ledelse, prosjektstyring og digitalisering.<br> Gjennom 10 år i REMA 1000 hadde Anne Sofie flere lederstillinger innen IT, hvor hun blant annet hadde ansvar for utvikling, organisering og forbedring av virksomhetens IT-prosesser. Hennes arbeid bidro til økt struktur, standardisering og effektivisering i et komplekst og forretningskritisk IT-landskap.<br> Anne Sofie har erfaring fra både kunde- og konsulentsiden, og har dermed et helhetlig perspektiv på virksomhetsutvikling og teknologiimplementering. Hun har ledet og deltatt i prosjekter innen blant annet detaljhandel, logistikk og offentlig sektor, og er vant til å navigere i skjæringspunktet mellom forretning og teknologi.<br>I tillegg er Anne Sofie en pådriver for kompetanseutvikling innen ny teknologi. Hun har utviklet og gjennomført kurs i prompt engineering og bruk av generativ AI, med mål om å gjøre avansert teknologi forståelig og tilgjengelig for virksomheter og medarbeidere.<br> Med solid forretningsforståelse, teknologisk innsikt og sterk gjennomføringsevne, er Anne Sofie en verdifull rådgiver og samarbeidspartner for kunder med høye krav til kvalitet og leveranseevne.",
    phone: "+47 987 65 432",
    email: "anne.sofie.nordvik@aster.no",
  },
]);
const contactDetails = computed(() => {
  if (!consultant.value) return [];
  return [
    {
      title: "Telefon",
      content: `${consultant.value.phone}`,
      icon: "/images/icons/phone-symbol-black.svg",
      alt: "phone icon",
    },
    {
      title: "E-post",
      content: `<a href="mailto:${consultant.value.email}">${consultant.value.email}</a>`,
      icon: "/images/icons/mail-symbol-black.svg",
      alt: "mail symbol",
    },
  ];
});
const consultant = computed(() => {
  const id = Number(route.query.id);
  return consultants.value.find((c) => c.id === id);
});
</script>
<style>
.consultantDetails {
  display: flex;
  flex-direction: column;
  padding: 20px;
}
.consultantDetailsContent {
  display: flex;
  flex-direction: row;
  gap: 2.8rem;
  margin-top: 1rem;
}
#consultantImage {
  width: 350px;
  height: 440px;
  margin-left: 2rem;
}
.consultantDetailsright {
  display: flex;
  flex-direction: column;
  width: 50%;
}
.consultantDetailsText {
  display: flex;
  flex-direction: column;
  width: 790px;
  max-width: 70vw;
}
.consultantDetailsText p {
  font-size: 16px;
  line-height: 1.5;
}
.consultantDetailsText h2 {
  font-size: 20px;
  margin-top: 0px;
  margin-bottom: 0;
}

/**********/
.consultantContactDetails {
  display: flex;
  flex-direction: row;
  gap: 2.5rem;
  margin-top: 2rem;
}
.info-item {
  display: flex;
  width: 205px;
  height: 60px;
  border: 1px solid rgb(59, 59, 59);
  flex-direction: row;
  padding: 1rem;
  padding-top: 1.2rem;
  gap: 1rem;
}
.icon {
  color: black;
  width: 20px;
  height: 20px;
  left: 3px;
}
.info-item h2 {
  font-size: 15px;
  margin: 0;
}
.info-item p {
  font-size: 13px;
  margin: 0;
}
.info-item a {
  color: inherit;
  text-decoration: none;
}
@media screen and (max-width: 1320px) {
  .consultantDetailsText {
    max-width: 50vw;
  }
}
@media screen and (max-width: 970px) {
  #consultantImage {
    width: 290px;
    height: 380px;
  }
}
@media screen and (max-width: 920px) {
  .consultantDetailsText p {
    font-size: 15px;
    line-height: 1.4;
  }
  .consultantDetailsText h2 {
    font-size: 18px;
  }
  #consultantImage {
    width: 250px;
    height: 320px;
  }
  .consultantContactDetails {
    margin-left: -296px;
  }
}
@media screen and (max-width: 710px) {
}
@media screen and (max-width: 570px) {
  .consultantContactDetails {
    order: 2;
    gap: 0.6rem;
    flex-direction: column;
    width: 100vw;
    flex-wrap: wrap;
    justify-content: center;
  }
}
</style>