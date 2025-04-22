  <script>
export default {
  data() {
    return {
      formData: {
        name: "",
        email: "",
        message: "",
      },
    };
  },
  methods: {
    async submitForm() {
      try {
        const response = await fetch("http://localhost:3000/api/send-email", {
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
  <div class="contact">
    <div>
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
      <form @submit.prevent="submitForm">
        <div class="input-container">
          <input
            type="text"
            id="name"
            v-model="formData.name"
            required
            class="input"
          />
          <label for="name" class="placeholder">Fult navn</label>
        </div>
        <div>
          <input
            type="email"
            id="email"
            v-model="formData.email"
            required
            class="input"
          />
          <label for="email" class="placeholder">E-post</label>
        </div>
        <div>
          <input
            type="text"
            id="telefon"
            v-model="formData.telefon"
            required
            class="input"
          />
          <label for="telefon" class="placeholder">Telefon</label>
        </div>
        <div>
          <select id="occasion" v-model="formData.occasion" required>
            <option value="" disabled selected></option>
            <option value="eksempel 1">eksempel 1</option>
            <option value="eksempel 2">eksempel 2</option>
            <option value="eksempel 3">eksempel 3</option>
            <option value="other">Annet</option>
          </select>
          <label for="occasion" class="placeholder">Anledning</label>
        </div>
        <div>
          <textarea id="message" v-model="formData.message" required></textarea>
          <label for="message" class="placeholder">Melding</label>
        </div>
        <button type="submit">Send nå</button>
      </form>
    </div>
  </div>
</template>
  


<style>
.icon {
  color: black;
}
.placeholder {
  color: #65657b;
  font-family: sans-serif;
  left: 1px;
  line-height: 14px;
  pointer-events: none;
  position: absolute;
  transform-origin: 0 50%;
  transition: transform 200ms, color 200ms;
  top: 20px;
}

.message-input:focus ~ .placeholder,
.message-input:not(:placeholder-shown) ~ .placeholder,
.input:focus ~ .placeholder,
.input:not(:placeholder-shown) ~ .placeholder {
  transform: translateY(-30px) translateX(10px) scale(0.75);
}

.message-input:not(:placeholder-shown) ~ .placeholder,
.input:not(:placeholder-shown) ~ .placeholder {
  color: #808097;
}

.message-input:focus ~ .placeholder,
.input:focus ~ .placeholder {
  color: #dc2f55;
}

.form {
  display: flex;
  border-radius: 20px;
  box-sizing: border-box;
  flex-direction: column;
  height: relative;
  padding: 20px;
  width: 320px;
}
.input {
  background-color: #303245;
  border-radius: 12px;
  border: 0;
  box-sizing: border-box;
  color: #eee;
  font-size: 16px;
  height: 90%;
  outline: 0;
  padding: 4px 15px 0;
  width: 100%;
  margin-bottom: 12px;
}

.input-container {
  height: 50px;
  position: relative;
  margin-bottom: 12px;
  width: 100%;
}
</style>