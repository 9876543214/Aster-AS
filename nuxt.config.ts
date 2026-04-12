// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  components: [
    {
      path: '~/app/components',
      pathPrefix: false,
    }
  ],

  css: [
    '~/app/assets/css/global.css',
    'maz-ui/css/main.css',
  ],

  build: {
    transpile: ['maz-ui'],
  },

  compatibilityDate: '2024-11-01',
  devtools: { enabled: true },

  app: {
    baseURL: '/',
    head: {
      link: [
        { rel: 'preconnect', href: 'https://fonts.googleapis.com' },
        { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' },
        {
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&family=Montserrat:wght@400;500;600;700&display=swap',
        },
      ],
    },
  },
})
