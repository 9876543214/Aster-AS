<template>
  <div class="contact-info">
    <component
      :is="info.link ? 'a' : 'div'"
      v-for="info in contactDetails"
      :key="info.title"
      :href="info.link"
      :target="info.external ? '_blank' : null"
      :rel="info.external ? 'noopener noreferrer' : null"
      class="info-item"
    >
      <div class="icon-wrapper">
        <img :src="info.icon" :alt="info.alt" class="contact-icon" />
      </div>
      <div class="text">
        <h3>{{ info.title }}</h3>
        <p v-html="info.content"></p>
      </div>
    </component>
  </div>
</template>

<script>
export default {
  data() {
    return {
      contactDetails: [
        {
          title: "Ring oss",
          content: "+47 913 51 234",
          link: "tel:+47913 51 234",
          icon: "/images/icons/phone-symbol-black.svg",
          alt: "Telefon-ikon",
        },
        {
          title: "Send e-post",
          content: "kontakt@aster.no",
          link: "mailto:kontakt@aster.no",
          icon: "/images/icons/mail-symbol-black.svg",
          alt: "E-post-ikon",
        },
        {
          title: "Besøk oss",
          content: "Havnabakken 33 <br />0874, Oslo",
          link: "https://www.google.com/maps/search/?api=1&query=Havnabakken+33,+0874+Oslo,+Norway",
          icon: "/images/icons/pin-symbol-black.svg",
          alt: "Adresse-ikon",
          external: true,
        },
      ],
    };
  },
};
</script>

<style>
.contact-info {
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
}

.info-item {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 1rem;
  padding: 1.25rem 1.5rem;
  background-color: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-sm);
  transition: all 0.3s ease;
  text-decoration: none;
  color: inherit;
  cursor: pointer;
  min-width: min(220px, 100%);
}

.info-item:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-md);
  border-color: var(--color-accent);
}

.contact-info .icon-wrapper {
  flex-shrink: 0;
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #f8f8f8;
  border-radius: 8px;
  transition: background-color 0.3s ease;
}

.info-item:hover .icon-wrapper {
  background-color: var(--color-accent-light);
}

.contact-icon {
  width: 20px;
  height: 20px;
  transition: transform 0.3s ease;
}

.info-item:hover .contact-icon {
  transform: scale(1.1);
}

.info-item .text {
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
}

.info-item .text h3 {
  font-family: var(--font-heading);
  font-size: 13px;
  font-weight: 600;
  color: var(--color-text-muted);
  margin: 0;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.info-item .text p {
  font-family: var(--font-body);
  font-size: 14px;
  color: var(--color-text);
  margin: 0;
  line-height: 1.4;
}

@media screen and (max-width: 830px) {
  .info-item {
    padding: 1rem 1.25rem;
    min-width: 200px;
  }

  .contact-info .icon-wrapper {
    width: 36px;
    height: 36px;
  }

  .contact-icon {
    width: 18px;
    height: 18px;
  }
}

@media screen and (max-width: 560px) {
  .contact-info {
    order: 2;
    gap: 0.75rem;
    flex-direction: row;
    width: 100%;
    flex-wrap: wrap;
    justify-content: center;
    padding: 0 1rem;
  }

  .info-item {
    flex: 1 1 calc(50% - 0.5rem);
    min-width: 140px;
    max-width: 180px;
    padding: 0.9rem;
  }

  .contact-info .icon-wrapper {
    width: 32px;
    height: 32px;
  }

  .contact-icon {
    width: 16px;
    height: 16px;
  }

  .info-item .text h3 {
    font-size: 11px;
  }

  .info-item .text p {
    font-size: 12px;
  }
}

@media screen and (max-width: 400px) {
  .info-item {
    flex: 1 1 100%;
    max-width: 100%;
  }
}
</style>
