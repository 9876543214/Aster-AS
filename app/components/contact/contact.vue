<template>
  <ContactHeader />
  <div class="contact">
    <ContactInfo />
    <div class="form">
      <ContactForm />
      <p id="infomessage">
        Ved å sende inn skjemaet samtykker du til at vi lagrer navn og e-post
        for å kunne kontakte deg tilbake.
      </p>
    </div>
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

.form {
  display: flex;
  flex-direction: column;
}

#infomessage {
  font-size: 12px;
  color: #656565;
  margin-top: 10px;
  text-align: center;
  order: 1;
}

@media screen and (max-width: 560px) {
  .contact {
    flex-direction: column;
  }
}
</style>