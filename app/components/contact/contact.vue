<template>
  <div class="contact">
    <ContactInfo />
    <div class="formcontainer">
      <ContactForm />
    </div>
  </div>
</template>

<style>
.contact {
  display: flex;
  justify-content: center;
  gap: 5rem;
  padding-top: 30px;
  padding-bottom: 45px;
  width: 100%;
  align-items: center;
  flex-direction: row;
}

.formcontainer {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
  max-width: 500px;
}

@media screen and (max-width: 1024px) {
  .contact {
    gap: 3rem;
  }
}

@media screen and (max-width: 768px) {
  .contact {
    gap: 2rem;
    padding-left: var(--content-padding);
    padding-right: var(--content-padding);
  }
}

@media screen and (max-width: 560px) {
  .contact {
    flex-direction: column;
    gap: 2rem;
  }
}
</style>
