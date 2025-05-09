<script>
export default {
  data() {
    return {
      formData: {
        name: "",
        email: "",
        message: "",
        phone: "",
        occasion: "",
      },
    };
  },
  methods: {
    async submitForm() {
      console.log("API Base URL:", process.env.VUE_APP_API_BASE_URL);
      try {
        const response = await fetch(`/api/send-email`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(this.formData),
        });

        if (response.ok) {
          alert("Meldingen ble sendt!");
          this.formData = { name: "", email: "", message: "" }; // Reset form
        } else {
          alert("Noe gikk galt. Prøv igjen senere.");
        }
      } catch (error) {
        console.error("Error sending email:", error);
        alert("Noe gikk galt. Prøv igjen senere.");
      }
    },
  },
};
</script>

<template>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
    rel="stylesheet"
  />
  <div class="header">
    <h1>Kontakt oss</h1>
  </div>
  <div class="contact">
    <div class="contact-info">
      <div class="phone">
        <div class="icon">
          <img
            src="/images/icons/phone-symbol-black.svg"
            alt="phone icon"
            class="icon"
          />
        </div>
        <div class="text">
          <h2>Ring oss</h2>
          <p>+47 123 45 678</p>
        </div>
      </div>
      <div class="email">
        <div class="icon">
          <img
            src="/images/icons/mail-symbol-black.svg"
            alt="mail symbol"
            class="icon"
          />
        </div>
        <div class="text">
          <h2>Email oss</h2>
          <p>mail@aster.no</p>
        </div>
      </div>
      <div class="address">
        <div class="icon">
          <img
            src="/images/icons/pin-symbol-black.svg"
            alt="pin symbol"
            class="icon"
          />
        </div>
        <div class="text">
          <h2>Besøk oss</h2>
          <p>Havnabakken 33 <br />0874, Oslo</p>
        </div>
      </div>
    </div>
    <div>
      <form @submit.prevent="submitForm" class="form">
        <div>
          <div>
            <input
              type="text"
              id="name"
              v-model="formData.name"
              required
              class="input"
              placeholder="Navn*"
            />
          </div>
          <div>
            <input
              type="email"
              id="email"
              v-model="formData.email"
              required
              class="input"
              placeholder="E-post*"
            />
          </div>
        </div>
        <div>
          <div>
            <input
              type="tel"
              id="phone"
              v-model="formData.phone"
              class="input"
              placeholder="Telefon"
              @input="
                formData.phone = formData.phone.replace(/(?!^\+)[^0-9 ]/g, '')
              "
            />
          </div>
          <div>
            <select id="occasion" v-model="formData.occasion" required>
              <option value="" disabled hidden>Anledning*</option>
              <option value="eksempel 1">Eksempel 1</option>
              <option value="eksempel 2">Eksempel 2</option>
              <option value="eksempel 3">Eksempel 3</option>
              <option value="other">Annet</option>
            </select>
          </div>
        </div>
        <div>
          <textarea
            id="message"
            class="message-input"
            rows="8"
            v-model="formData.message"
            required
            placeholder="Melding*"
          ></textarea>
        </div>
        <button type="submit" class="submit-button">
          Send nå
          <img src="/images/icons/arrow-right.svg" alt="arrow pointing right" />
        </button>
      </form>
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
.header {
  display: flex;
  justify-content: center;
  align-items: center;
}
.phone,
.email,
.address {
  display: flex;
  width: 205px;
  height: 60px;
  border: 1px solid rgb(59, 59, 59);
  flex-direction: row;
  padding: 1rem;
  padding-top: 1.2rem;
  gap: 1rem;
}
h2 {
  font-size: 15px;
  margin: 0;
}
p {
  font-size: 13px;
}
.contact-info {
  display: flex;
  flex-direction: column;
  gap: 2.5rem;
}
.icon {
  color: black;
  width: 20px;
  height: 20px;
}
.submit-button {
  background-color: #196164;
  width: 85%;
  border-radius: 10px;
  color: white;
  border: none;
  padding: 12px 20px;
  cursor: pointer;
  font-size: 13px;
  display: flex;
  align-items: center;
  font-family: lato;
  gap: 8px;
  justify-content: center;
}
.submit-button img {
  width: 14px;
  height: 14px;
  color: white;
}
.form {
  display: flex;
  width: 500px;
  height: auto;
  border: 1px solid #e1e1e1;
  border-radius: 20px;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  padding-top: 20px;
  padding-bottom: 20px;
}
.form div {
  display: flex;
  width: 85%;
  flex-direction: row;
  align-items: center;
  gap: 20px;
}
.form input,
.form select {
  width: 100%;
  height: 40px;
  border: 1px solid #e1e1e1;
  color: #656565;
  border-radius: 10px;
  padding-left: 10px;
  margin-bottom: 20px;
  background-color: #ffffff00;
}

.form select {
  cursor: pointer;
  height: 41.343px;
}

select:invalid {
  color: #757575;
  z-index: 100;
}

.form textarea {
  width: 100%;
  font-family: lato;
  border: 1px solid #e1e1e1;
  border-radius: 10px;
  padding-top: 10px;
  padding-left: 10px;
  margin-bottom: 20px;
  background-color: #ffffff00;
}

::placeholder {
  color: #757575;
  font-family: lato;
  font-size: 13px;
}

@media screen and (max-width: 830px) {
  .form {
    width: 400px;
  }
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
  .form {
    width: 300px;
  }
  .phone,
  .email,
  .address {
    padding-top: 0.8rem;
    padding-bottom: 0.2rem;
  }
}
@media screen and (max-width: 560px) {
  .contact {
    flex-direction: column;
  }
  .form {
    order: 1;
    margin-bottom: 1rem;
  }
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