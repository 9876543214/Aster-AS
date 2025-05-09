<script>
import Contact from "~/app/components/contact/contact.vue";
import customers from "~/app/components/customers/customers.vue";
export default {
  components: { customers, Contact },
  name: "HomePage",
};
</script>

<template>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
    rel="stylesheet"
  />
  <link
    href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
    rel="stylesheet"
  />
  <div>
    <Nav />
    <Hero />
    <services />
    <choose />
    <customers />
    <contact />
    <Footer />
  </div>
</template>

<style>
body {
  width: 100vw;
  margin: 0;
  padding: 0;
  font-family: "Lato";
  overflow-x: hidden !important;
  background-color: #f4f4f4;
}
h1,
h2,
h3 {
  font-family: "Montserrat";
}
</style>