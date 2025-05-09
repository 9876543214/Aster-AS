// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  components: [
    {
      path: '~/app/components',
      pathPrefix: false,
    }
  ],
  css: [
    'maz-ui/css/main.css', // Add the main CSS file from maz-ui
  ],
  build: {
    transpile: ['maz-ui'], // Ensure maz-ui is transpiled
  },
  compatibilityDate: '2024-11-01',
  devtools: { enabled: true }
})
