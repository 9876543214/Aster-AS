<template>
  <footer class="site-footer">
    <div class="footer-content container">
      <div class="footer-section footer-about">
        <img src="/images/logos/logo-white.svg" alt="Aster AS logo" class="footer-logo" />
        <p class="tagline">
          Strategisk rådgivning og prosjektledelse<br />innen IT, sikkerhet og
          logistikk
        </p>
      </div>
      <div class="footer-section footer-links">
        <h3>Nyttige lenker</h3>
        <nav>
          <NuxtLink to="/">Hjem</NuxtLink>
          <NuxtLink to="/about">Om oss</NuxtLink>
          <NuxtLink to="/work">Jobb hos oss</NuxtLink>
          <NuxtLink to="/contact">Kontakt</NuxtLink>
        </nav>
      </div>
      <div class="footer-section footer-contact">
        <h3>Kontakt</h3>
        <a href="tel:+47913 51 234" class="contact-item">
          <div class="icon-wrapper">
            <img src="/images/icons/phone-symbol.svg" alt="Telefon" />
          </div>
          <span>+47 913 51 234</span>
        </a>
        <a href="mailto:kontakt@aster.no" class="contact-item">
          <div class="icon-wrapper">
            <img src="/images/icons/mail-symbol.svg" alt="E-post" />
          </div>
          <span>kontakt@aster.no</span>
        </a>
        <a
          href="https://www.google.com/maps/search/?api=1&query=Havnabakken+33,+0874+Oslo,+Norway"
          target="_blank"
          rel="noopener noreferrer"
          class="contact-item"
        >
          <div class="icon-wrapper">
            <img src="/images/icons/pin-symbol.svg" alt="Adresse" />
          </div>
          <span>Havnabakken 33, 0874 Oslo</span>
        </a>
      </div>
    </div>
    <div class="footer-bottom">
      <p>&copy; {{ new Date().getFullYear() }} Aster AS. Alle rettigheter reservert. <br />
      Utviklet av Mjønes Consulting</p>
    </div>
    <Login
      :dialog="loginDialog"
      @update:dialog="loginDialog = $event"
      @login="handleLogin"
    />
    <button
      v-if="session && session.loggedIn === false"
      @click="openLoginDialog"
      class="login-btn"
    ></button>
  </footer>
</template>

<script setup>
import { ref, onMounted } from "vue";

const loginDialog = ref(false);
const session = ref(null);

async function checkSession() {
  try {
    const res = await fetch("/api/session");
    if (res.ok) session.value = await res.json();
  } catch {
    // Session API unavailable
  }
}

onMounted(checkSession);

function openLoginDialog() {
  loginDialog.value = true;
}

async function handleLogin({ username, password }) {
  if (username && password) {
    try {
      const response = await fetch("/api/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username, password }),
      });
      if (response.ok) {
        await response.json();
        await checkSession();
      }
    } catch {
      // Login failed silently
    }
  }
  loginDialog.value = false;
}
</script>

<style scoped>
.site-footer {
  width: 100%;
  background-color: var(--color-footer-bg);
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
}

.footer-content {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  gap: 3rem;
  padding-top: 3.5rem;
  padding-bottom: 3rem;
}

.footer-section {
  display: flex;
  flex-direction: column;
}

.footer-about {
  max-width: 300px;
  align-items: flex-start;
}

.footer-logo {
  height: 40px;
  width: auto;
  margin-bottom: 1rem;
}

.site-footer h3 {
  font-size: 1rem;
  color: #ffffff;
  margin-bottom: 1.25rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.tagline {
  font-size: 0.95rem;
  color: var(--color-footer-text);
  line-height: 1.6;
}

.footer-links nav {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.footer-links a {
  font-size: 0.95rem;
  color: var(--color-footer-text);
  transition: color 0.2s ease, transform 0.2s ease;
  display: inline-block;
}

.footer-links a:hover {
  color: #ffffff;
  transform: translateX(4px);
}

.footer-contact {
  gap: 0.5rem;
}

.contact-item {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 0.5rem 0;
  transition: transform 0.2s ease;
}

.contact-item:hover {
  transform: translateX(4px);
}

.icon-wrapper {
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: var(--color-footer-surface);
  border-radius: var(--radius-sm);
  transition: background-color 0.2s ease;
}

.contact-item:hover .icon-wrapper {
  background-color: var(--color-accent);
}

.contact-item img {
  width: 16px;
  height: 16px;
}

.contact-item span {
  font-size: 0.95rem;
  color: var(--color-footer-text);
  transition: color 0.2s ease;
}

.contact-item:hover span {
  color: #ffffff;
}

.footer-bottom {
  width: 100%;
  border-top: 1px solid var(--color-footer-surface);
  padding: 1.5rem 2rem;
  display: flex;
  justify-content: center;
}

.footer-bottom p {
  font-size: 0.85rem;
  color: #666666;
  text-align: center;
}

.login-btn {
  background-color: transparent;
  color: #666666;
  border: none;
  padding: 0.5rem;
  position: absolute;
  bottom: 1rem;
  right: 1rem;
  font-size: 0.8rem;
  opacity: 0.5;
  transition: opacity 0.2s ease;
}

.login-btn:hover {
  opacity: 1;
}

@media screen and (max-width: 768px) {
  .footer-content {
    gap: 2.5rem;
  }

  .footer-about {
    max-width: 100%;
    flex: 1 1 100%;
  }

  .footer-links,
  .footer-contact {
    flex: 1 1 auto;
  }
}

@media screen and (max-width: 480px) {
  .footer-content {
    padding-top: 2.5rem;
    padding-bottom: 2rem;
    gap: 2rem;
  }

  .footer-section {
    flex: 1 1 100%;
  }

  .site-footer h3 {
    font-size: 0.9rem;
    margin-bottom: 1rem;
  }

  .tagline,
  .footer-links a,
  .contact-item span {
    font-size: 0.9rem;
  }

  .footer-bottom {
    padding: 1.25rem 1.5rem;
  }

  .footer-bottom p {
    font-size: 0.8rem;
  }
}
</style>
