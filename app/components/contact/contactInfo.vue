<template>
  <div class="contact-info">
    <div v-for="info in contactDetails" :key="info.title" class="info-item">
      <div class="icon">
        <img :src="info.icon" :alt="info.alt" class="icon" />
      </div>
      <div class="text">
        <h2>{{ info.title }}</h2>
        <p v-html="info.content"></p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      contactDetails: [
        {
          title: "Ring oss",
          content: "+47 123 45 678",
          icon: "/images/icons/phone-symbol-black.svg",
          alt: "phone icon",
        },
        {
          title: "Email oss",
          content: "mail@aster.no",
          icon: "/images/icons/mail-symbol-black.svg",
          alt: "mail symbol",
        },
        {
          title: "Besøk oss",
          content: "Havnabakken 33 <br />0874, Oslo",
          icon: "/images/icons/pin-symbol-black.svg",
          alt: "pin symbol",
        },
      ],
    };
  },
};
</script>

<style>
.contact-info {
  display: flex;
  flex-direction: column;
  gap: 2.5rem;
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
}
h2 {
  font-size: 15px;
  margin: 0;
}
p {
  font-size: 13px;
}

@media screen and (max-width: 830px) {
  .phone,
  .email,
  .address {
    width: 150px;
    height: 65px;
    padding-top: 1rem;
  }
  .contact-info {
    gap: 2rem;
  }
}

@media screen and (max-width: 710px) {
  .phone,
  .email,
  .address {
    padding-top: 0.8rem;
    padding-bottom: 0.2rem;
  }
}
@media screen and (max-width: 560px) {
  .contact-info {
    order: 2;
    gap: 0.6rem;
    flex-direction: row;
    width: 100vw;
    flex-wrap: wrap;
    justify-content: center;
  }
  .phone,
  .email,
  .address {
    border: none;
    padding: none;
    width: min-content;
    white-space: nowrap;
    margin: 0;
  }
}
</style>