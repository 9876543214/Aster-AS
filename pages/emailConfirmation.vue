<template>
  <div class="email-confirmation">
    <header class="header">
      <img src="/images/logos/logo-color.svg" alt="Aster Logo" class="logo" />
    </header>
    <main class="content">
      <h1>Epost verifikasjon</h1>
      <p v-if="loading" class="message loading">Verifiserer din epost...</p>
      <p v-if="success" class="message success">Din epost er verifisert!</p>
      <p v-if="error" class="message error">{{ error }}</p>
    </main>
  </div>
</template>
  
  <script>
import { ref, onMounted } from "vue";

export default {
  setup() {
    const loading = ref(true);
    const success = ref(false);
    const error = ref(null);

    onMounted(async () => {
      const urlParams = new URLSearchParams(window.location.search);
      const token = urlParams.get("token");

      if (!token) {
        error.value = "Ugyldig eller manglende token.";
        loading.value = false;
        return;
      }

      try {
        const response = await fetch(`/api/confirm-email?token=${token}`);
        const data = await response.json();

        if (response.ok) {
          success.value = true;
        } else {
          error.value = data.message || "Kunne ikke bekrefte epost.";
        }
      } catch (err) {
        error.value = "En feil oppstod under bekreftelse av eposten din.";
      } finally {
        loading.value = false;
      }
    });

    return { loading, success, error };
  },
};
</script>
  
  <style>
.email-confirmation {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 85vh;
  font-family: "Lato", sans-serif;
  background-color: #f4f4f4;
  color: #333;
  text-align: center;
  padding: 20px;
}

.header {
  margin-bottom: 20px;
}

.logo {
  width: 150px;
  height: auto;
}

.content {
  background: #fff;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  max-width: 500px;
  width: 100%;
}

h1 {
  font-family: "Montserrat", sans-serif;
  font-size: 24px;
  margin-bottom: 20px;
  color: #196164;
}

.message {
  font-size: 16px;
  margin-top: 10px;
}

.message.loading {
  color: #757575;
}

.message.success {
  color: #28a745;
}

.message.error {
  color: #dc3545;
}
</style>