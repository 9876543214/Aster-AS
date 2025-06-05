<template>
  <ContactHeader />
  <div class="contact">
    <ContactInfo />
    <div class="formcontainer">
      <ContactForm />
      <p id="infomessage">
        Ved å sende inn skjemaet samtykker du til at vi lagrer fylt inn data for
        å kunne kontakte deg tilbake.
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

.formcontainer {
  display: flex;
  flex-direction: column;
  align-items: center;
}

#infomessage {
  font-size: 12px;
  color: #656565;
  margin-top: 10px;
  text-align: center;
  order: 1;
  width: 490px;
}
@media screen and (max-width: 830px) {
  #infomessage {
    width: 390px;
  }
}

@media screen and (max-width: 710px) {
  #infomessage {
    width: 290px;
  }
}
@media screen and (max-width: 560px) {
  .contact {
    flex-direction: column;
  }
  #infomessage {
    margin-bottom: 2rem;
  }
}
</style>