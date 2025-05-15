<template>
  <ContactHeader />
  <div class="contact">
    <ContactInfo />
    <ContactForm />
  </div>
</template>


<style>
.contact {
  display: flex;
  justify-content: space-around;
  padding-top: 30px;
  padding-bottom: 45px;
  width: 100%;
  align-items: center;
}

@media screen and (max-width: 560px) {
  .contact {
    flex-direction: column;
  }
}
</style>