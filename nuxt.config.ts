// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  components: [
    {
      path: '~/app/components',
      pathPrefix: false,
    }
  ],
  compatibilityDate: '2024-11-01',
  devtools: { enabled: true }
})
