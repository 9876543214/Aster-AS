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

      if (this.isSubmitting) return;

      this.isSubmitting = true;
      this.isSuccess = null;

      try {
        const response = await fetch(`/api/send-email`, {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(this.formData),
        });

        this.isSuccess = response.ok;
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
        this.isSuccess = false;
      } finally {
        setTimeout(() => (this.isSubmitting = false), 4000);
        setTimeout(() => (this.isSuccess = null), 6000);
      }
    },
  },
};
</script>
<template>
  <form @submit.prevent="submitForm" class="form">
    <div>
      <input
        type="text"
        id="name"
        v-model="formData.name"
        required
        class="input"
        placeholder="Navn*"
      />
      <input
        type="email"
        id="email"
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
        v-model="formData.phone"
        class="input"
        placeholder="Telefon"
        @input="formData.phone = formData.phone.replace(/(?!^\+)[^0-9 ]/g, '')"
      />
      <select id="occasion" v-model="formData.occasion" required>
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
        class="message-input"
        rows="8"
        v-model="formData.message"
        required
        placeholder="Melding*"
      ></textarea>
    </div>
    <SubmitButton :isSubmitting="isSubmitting" :isSuccess="isSuccess" />
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
  width: 81.8%;
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
</style>