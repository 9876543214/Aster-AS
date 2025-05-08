<template>
  <div>
    <h1>Email Confirmation</h1>
    <p v-if="loading">Verifying your email...</p>
    <p v-if="success">Your email has been successfully verified!</p>
    <p v-if="error">{{ error }}</p>
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
        error.value = "Invalid or missing token.";
        loading.value = false;
        return;
      }

      try {
        const response = await fetch(`/api/confirm-email?token=${token}`);
        const data = await response.json();

        if (response.ok) {
          success.value = true;
        } else {
          error.value = data.message || "Failed to verify email.";
        }
      } catch (err) {
        error.value = "An error occurred while verifying your email.";
      } finally {
        loading.value = false;
      }
    });

    return { loading, success, error };
  },
};
</script>