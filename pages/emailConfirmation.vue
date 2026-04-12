<script setup>
import { ref, onMounted } from "vue";

definePageMeta({ layout: 'blank' });

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
</script>

<template>
  <div class="email-confirmation">
    <header class="header">
      <img src="/images/logos/logo-color.svg" alt="Aster Logo" class="logo" />
    </header>
    <main class="content">
      <h1 class="verification-header">Epost verifikasjon</h1>
      <p v-if="loading" class="message loading">Verifiserer din epost...</p>
      <p v-if="success" class="message success">Din epost er verifisert!</p>
      <p v-if="error" class="message error">{{ error }}</p>
    </main>
  </div>
</template>

<style scoped>
.email-confirmation {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 85vh;
  font-family: var(--font-body);
  background-color: var(--color-bg);
  color: var(--color-text);
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
  background: var(--color-surface);
  padding: 30px;
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-md);
  max-width: 500px;
  width: 100%;
}

.verification-header {
  font-size: 24px;
  margin-bottom: 20px;
  color: var(--color-accent);
}

.message {
  font-size: 16px;
  margin-top: 10px;
}

.message.loading {
  color: var(--color-text-muted);
}

.message.success {
  color: var(--color-success);
}

.message.error {
  color: var(--color-error);
}
</style>
