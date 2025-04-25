<template>
  <div class="confirmation">
    <h1>{{ message }}</h1>
  </div>
</template>
  
  <script>
export default {
  data() {
    return {
      message: "Bekrefter e-posten din...",
    };
  },
  async created() {
    const token = this.$route.query.token; // Get the token from the URL
    try {
      const response = await fetch(
        `${process.env.VUE_APP_API_BASE_URL}/api/confirm-email?token=${token}`
      );
      if (response.ok) {
        this.message =
          "E-posten din er bekreftet, og meldingen er sendt til support!";
      } else {
        this.message = "Ugyldig eller utløpt token.";
      }
    } catch (error) {
      this.message = "Noe gikk galt. Prøv igjen senere.";
    }
  },
};
</script>
  
  <style>
.confirmation {
  text-align: center;
  margin-top: 50px;
}
</style>