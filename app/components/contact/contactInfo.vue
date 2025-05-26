<template>
  <!-- Contact information container -->
  <div class="contact-info">
    <!-- Loop through each contact detail and render its info -->
    <div v-for="info in contactDetails" :key="info.title" class="info-item">
      <div class="icon">
        <!-- Display the icon for each contact method -->
        <img :src="info.icon" :alt="info.alt" class="icon" />
      </div>
      <div class="text">
        <!-- Display the title and content for each contact method -->
        <h2>{{ info.title }}</h2>
        <p v-html="info.content"></p>
      </div>
    </div>
  </div>
</template>

<script>
// Vue component for displaying contact information
export default {
  data() {
    return {
      // Array of contact details to display
      contactDetails: [
        {
          title: "Ring oss", // Phone contact
          content: "+47 123 45 678",
          icon: "/images/icons/phone-symbol-black.svg",
          alt: "phone icon",
        },
        {
          title: "Email oss", // Email contact
          content: "mail@aster.no",
          icon: "/images/icons/mail-symbol-black.svg",
          alt: "mail symbol",
        },
        {
          title: "Besøk oss", // Address contact
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
/* Container for all contact info items */
.contact-info {
  display: flex;
  flex-direction: column;
  gap: 2.5rem;
}
/* Individual contact info item styling */
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
/* Icon styling */
.icon {
  color: black;
  width: 20px;
  height: 20px;
}
/* Title styling */
h2 {
  font-size: 15px;
  margin: 0;
}
/* Content text styling */
p {
  font-size: 13px;
}

/* Responsive styles for different screen sizes */
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