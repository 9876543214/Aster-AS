<script>
import SubmitButton from "./submitButton.vue";

export default {
  components: { SubmitButton },
  data() {
    return {
      formData: {
        name: "",
        email: "",
        message: "",
        phone: "",
        occasion: "",
      },
      isSubmitting: false,
      isSuccess: null,
      submitted: false,
      infoMessage: "",
    };
  },
  methods: {
    async submitForm() {
      if (
        !this.formData.name ||
        !this.formData.email ||
        !this.formData.message ||
        !this.formData.occasion
      ) {
        alert("Vennligst fyll ut alle obligatoriske felter.");
        return;
      }

      this.infoMessage = "";

      if (this.isSubmitting) return;

      this.isSubmitting = true;
      this.isSuccess = null;
      this.pendingSuccess = null;
      this.submitted = false;

      try {
        const response = await fetch(`/api/send-email`, {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(this.formData),
        });

        this.pendingSuccess = response.ok;
        if (response.ok) {
          this.formData = {
            name: "",
            email: "",
            message: "",
            phone: "",
            occasion: "",
          };
        }
      } catch (error) {
        console.error("Error sending email:", error);
        this.pendingSuccess = false;
      }
    },
    onSpinEnded() {
      this.isSuccess = this.pendingSuccess;
      this.isSubmitting = false;
      this.submitted = true;
      setTimeout(() => (this.submitted = false), 2000);
      setTimeout(() => (this.isSuccess = null), 2000);
      setTimeout(() => {
        if (this.isSuccess) {
          this.infoMessage =
            "Takk! Vi har sendt deg en verifikasjons-epost. Vennligs bekreft e-posten din innen de neste 3 dagene.";
        } else if (this.isSuccess === false) {
          this.infoMessage =
            "Beklager, det oppstod en feil. Vennligst prøv igjen senere eller send oss en e-post direkte.";
        }
      }, 600);
    },
  },
};
</script>
<template>
  <link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=close"
  />
  <form @submit.prevent="submitForm" class="form">
    <div>
      <input
        type="text"
        id="name"
        name="name"
        v-model="formData.name"
        required
        class="input"
        placeholder="Navn*"
      />
      <input
        type="email"
        id="email"
        name="email"
        v-model="formData.email"
        required
        class="input"
        placeholder="E-post*"
      />
    </div>
    <div>
      <input
        type="tel"
        id="phone"
        name="phone"
        v-model="formData.phone"
        class="input"
        placeholder="Telefon"
        @input="formData.phone = formData.phone.replace(/(?!^\+)[^0-9 ]/g, '')"
      />
      <select
        id="occasion"
        name="occasion"
        v-model="formData.occasion"
        required
      >
        <option value="" disabled hidden>Anledning*</option>
        <option value="eksempel 1">Eksempel 1</option>
        <option value="eksempel 2">Eksempel 2</option>
        <option value="eksempel 3">Eksempel 3</option>
        <option value="other">Annet</option>
      </select>
    </div>
    <div>
      <textarea
        id="message"
        name="message"
        class="message-input"
        rows="8"
        v-model="formData.message"
        required
        placeholder="Melding*"
      ></textarea>
    </div>
    <SubmitButton
      :isSubmitting="isSubmitting"
      :isSuccess="isSuccess"
      :submitted="submitted"
      @spin-ended="onSpinEnded"
    />
    <div v-if="infoMessage" class="info-message">
      <span
        class="material-symbols-outlined close-popup"
        @click="infoMessage = ''"
      >
        close
      </span>
      {{ infoMessage }}
    </div>
  </form>
</template>


<style>
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
  position: relative;
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
  height: 43.343px;
  width: 103.724%;
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
}

@media screen and (max-width: 710px) {
  .form {
    width: 300px;
  }
}

@media screen and (max-width: 560px) {
  .form {
    order: 1;
    margin-bottom: 1rem;
  }
}
.info-message {
  margin-top: 10px;
  color: #000000;
  text-align: center;
  font-size: 14px;
  position: absolute;
  bottom: 23%;
  left: 8.2%;
  width: 50% !important;
  background-color: #f4f4f4;
  color: #114042;
  padding: 18px 6px;
  border: 1px solid #000000;
}
.info-message::before,
.info-message::after {
  content: "";
  position: absolute;
  left: 70%;
  top: 100%;
  border-top: 14px solid #f4f4f4;
  border-bottom: none;
  border-left: 17px solid transparent;
  border-right: 10px solid transparent;
}

.info-message::before {
  padding-top: 10px;
  border-top-color: #000000;
}

.info-message::after {
  margin-top: -0.6px;
}

.close-popup {
  position: absolute;
  right: 5px;
  top: 5px;
  font-size: 18px !important;
  cursor: pointer;
  color: #000000;
}
</style>