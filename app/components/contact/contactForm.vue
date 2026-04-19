<script>
import SubmitButton from "./submitButton.vue";

export default {
  components: { SubmitButton },
  data() {
    return {
      formData: {
        name: "",
        email: "",
        message: "",
        phone: "",
        occasion: "",
        consent: false,
      },
      dropdownOpen: false,
      occasionOptions: [
        { value: "konsulentoppdrag", label: "Konsulentoppdrag" },
        { value: "jobb", label: "Jobb hos oss" },
        { value: "other", label: "Annet" },
      ],
      isSubmitting: false,
      isSuccess: null,
      submitted: false,
      infoMessage: "",
    };
  },
  computed: {
    selectedLabel() {
      const opt = this.occasionOptions.find(o => o.value === this.formData.occasion);
      return opt ? opt.label : "";
    },
  },
  methods: {
    selectOption(value) {
      this.formData.occasion = value;
      this.dropdownOpen = false;
    },
    closeDropdownDelayed() {
      setTimeout(() => { this.dropdownOpen = false; }, 150);
    },
    async submitForm() {
      if (
        !this.formData.name ||
        !this.formData.email ||
        !this.formData.message ||
        !this.formData.occasion ||
        !this.formData.consent
      ) {
        alert("Vennligst fyll ut alle obligatoriske felter og godta vilkårene.");
        return;
      }

      this.infoMessage = "";
      if (this.isSubmitting) return;

      this.isSubmitting = true;
      this.isSuccess = null;
      this.pendingSuccess = null;
      this.submitted = false;

      try {
        const response = await fetch(`/api/send-email`, {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(this.formData),
        });

        this.pendingSuccess = response.ok;
        if (response.ok) {
          this.formData = {
            name: "",
            email: "",
            message: "",
            phone: "",
            occasion: "",
            consent: false,
          };
        }
      } catch (error) {
        this.pendingSuccess = false;
      }
    },
    onSpinEnded() {
      this.isSuccess = this.pendingSuccess;
      this.isSubmitting = false;
      this.submitted = true;
      setTimeout(() => (this.submitted = false), 2000);
      setTimeout(() => (this.isSuccess = null), 2000);
      setTimeout(() => {
        if (this.isSuccess) {
          this.infoMessage =
            "Takk! Vi har sendt deg en verifikasjons-epost. Vennligst bekreft e-posten din innen de neste 3 dagene.";
        } else if (this.isSuccess === false) {
          this.infoMessage =
            "Beklager, det oppstod en feil. Vennligst prøv igjen senere eller send oss en e-post direkte.";
        }
      }, 600);
    },
  },
};
</script>

<template>
  <link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=close"
  />
  <form @submit.prevent="submitForm" class="form">
    <div class="form-row">
      <div class="form-group">
        <label for="name" class="sr-only">Navn</label>
        <input
          type="text"
          id="name"
          name="name"
          v-model="formData.name"
          required
          class="input"
          placeholder="Navn*"
          autocomplete="name"
          @invalid="$event.target.setCustomValidity('Vennligst fyll ut dette feltet.')"
          @input="$event.target.setCustomValidity('')"
        />
      </div>
      <div class="form-group">
        <label for="email" class="sr-only">E-post</label>
        <input
          type="email"
          id="email"
          name="email"
          v-model="formData.email"
          required
          class="input"
          placeholder="E-post*"
          autocomplete="email"
          @invalid="$event.target.setCustomValidity($event.target.value ? 'Vennligst skriv inn en gyldig e-postadresse.' : 'Vennligst fyll ut dette feltet.')"
          @input="$event.target.setCustomValidity('')"
        />
      </div>
    </div>
    <div class="form-row">
      <div class="form-group">
        <label for="phone" class="sr-only">Telefon</label>
        <input
          type="tel"
          id="phone"
          name="phone"
          v-model="formData.phone"
          class="input"
          placeholder="Telefon"
          autocomplete="tel"
          @input="formData.phone = formData.phone.replace(/(?!^\+)[^0-9 ]/g, '')"
        />
      </div>
      <div class="form-group">
        <label for="occasion" class="sr-only">Anledning</label>
        <div class="custom-select" :class="{ open: dropdownOpen, selected: formData.occasion }">
          <button
            type="button"
            class="custom-select-trigger"
            @click="dropdownOpen = !dropdownOpen"
            @blur="closeDropdownDelayed"
          >
            <span>{{ selectedLabel || 'Anledning*' }}</span>
            <svg class="chevron" width="12" height="8" viewBox="0 0 12 8" fill="none">
              <path d="M1 1.5L6 6.5L11 1.5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
          </button>
          <ul v-if="dropdownOpen" class="custom-select-options">
            <li
              v-for="opt in occasionOptions"
              :key="opt.value"
              :class="{ active: formData.occasion === opt.value }"
              @mousedown.prevent="selectOption(opt.value)"
            >
              {{ opt.label }}
            </li>
          </ul>
        </div>
        <input type="hidden" name="occasion" :value="formData.occasion" required />
      </div>
    </div>
    <div class="form-row">
      <div class="form-group full-width">
        <label for="message" class="sr-only">Melding</label>
        <textarea
          id="message"
          name="message"
          class="message-input"
          rows="8"
          v-model="formData.message"
          required
          placeholder="Melding*"
          @invalid="$event.target.setCustomValidity('Vennligst fyll ut dette feltet.')"
          @input="$event.target.setCustomValidity('')"
        ></textarea>
      </div>
    </div>
    <div class="consent-wrapper">
      <label class="consent-label" for="consent">
        <input
          type="checkbox"
          id="consent"
          name="consent"
          v-model="formData.consent"
          required
          class="consent-checkbox"
          @invalid="$event.target.setCustomValidity('Du må godta vilkårene for å fortsette.')"
          @change="$event.target.setCustomValidity('')"
        />
        <span class="consent-text">
          Jeg godtar at mine opplysninger lagres for å bli kontaktet.*
        </span>
      </label>
    </div>
    <SubmitButton
      :isSubmitting="isSubmitting"
      :isSuccess="isSuccess"
      :submitted="submitted"
      @spin-ended="onSpinEnded"
    />
    <div v-if="infoMessage" class="info-message">
      <span
        class="material-symbols-outlined close-popup"
        @click="infoMessage = ''"
      >
        close
      </span>
      {{ infoMessage }}
    </div>
  </form>
</template>

<style>
/* Screen reader only - visually hidden labels */
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}

.form {
  display: flex;
  width: 100%;
  max-width: 500px;
  height: auto;
  border: 1px solid var(--color-border);
  border-radius: 20px;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  padding: 20px;
  position: relative;
}

.form-row {
  display: flex;
  width: 85%;
  flex-direction: row;
  align-items: center;
  gap: 20px;
}

.form-group {
  flex: 1;
  min-width: 0;
}

.form-group.full-width {
  flex: 1 1 100%;
}

.form input,
.form select {
  width: 100%;
  height: 40px;
  border: 1px solid var(--color-border);
  color: var(--color-text-muted);
  border-radius: var(--radius-md);
  padding-left: 10px;
  margin-bottom: 20px;
  background-color: transparent;
  font-family: var(--font-body);
  font-size: 14px;
  transition: border-color 0.2s ease;
}

.form input:focus,
.form select:focus,
.form textarea:focus {
  border-color: var(--color-accent);
  outline: none;
}

/* Custom select dropdown */
.custom-select {
  position: relative;
  margin-bottom: 20px;
}

.custom-select-trigger {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  height: 40px;
  padding: 0 12px 0 10px;
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  background: transparent;
  font-family: var(--font-body);
  font-size: 14px;
  color: #757575;
  cursor: pointer;
  transition: border-color 0.2s ease;
}

.custom-select.selected .custom-select-trigger {
  color: var(--color-text-muted);
}

.custom-select.open .custom-select-trigger {
  border-color: var(--color-accent);
  border-radius: var(--radius-md) var(--radius-md) 0 0;
}

.chevron {
  color: var(--color-text-muted);
  transition: transform 0.2s ease;
  flex-shrink: 0;
}

.custom-select.open .chevron {
  transform: rotate(180deg);
}

.custom-select-options {
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 10;
  list-style: none;
  margin: 0;
  padding: 0.25rem 0;
  background: var(--color-surface);
  border: 1px solid var(--color-accent);
  border-top: none;
  border-radius: 0 0 var(--radius-md) var(--radius-md);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.custom-select-options li {
  padding: 0.6rem 10px;
  font-family: var(--font-body);
  font-size: 14px;
  color: var(--color-text-muted);
  cursor: pointer;
  transition: background-color 0.15s ease, color 0.15s ease;
}

.custom-select-options li:hover {
  background: var(--color-accent-light);
  color: var(--color-accent);
}

.custom-select-options li.active {
  color: var(--color-accent);
  font-weight: 600;
}

.form textarea {
  width: 100%;
  font-family: var(--font-body);
  font-size: 14px;
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  padding-top: 10px;
  padding-left: 10px;
  margin-bottom: 20px;
  background-color: transparent;
  transition: border-color 0.2s ease;
}

::placeholder {
  color: #757575;
  font-family: var(--font-body);
  font-size: 13px;
}

.consent-wrapper {
  width: 85% !important;
  margin-bottom: 20px;
  flex-direction: row !important;
}

.consent-label {
  display: flex;
  align-items: flex-start;
  gap: 10px;
  cursor: pointer;
}

.consent-checkbox {
  width: 18px !important;
  height: 18px !important;
  min-width: 18px;
  margin: 0 !important;
  margin-top: 1px !important;
  cursor: pointer;
  accent-color: var(--color-accent);
}

.consent-text {
  font-family: var(--font-body);
  font-size: 12px;
  color: var(--color-text-muted);
  line-height: 1.4;
}

@media screen and (max-width: 830px) {
  .form {
    max-width: 400px;
  }
}

@media screen and (max-width: 560px) {
  .form {
    order: 1;
    max-width: 100%;
  }

  .form-row {
    flex-direction: column;
    gap: 0;
  }

  .form-group {
    width: 100%;
  }
}

.info-message {
  text-align: center;
  font-size: 13px;
  font-family: var(--font-body);
  line-height: 1.5;
  position: absolute;
  bottom: 70px;
  left: 50%;
  transform: translateX(-50%);
  width: 80% !important;
  background-color: var(--color-surface);
  color: var(--color-text);
  padding: 14px 32px 14px 14px;
  border-radius: var(--radius-md);
  border: 1px solid var(--color-border);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
  animation: slideDown 0.3s ease-out;
}

.info-message::after {
  content: "";
  position: absolute;
  bottom: -8px;
  left: 50%;
  transform: translateX(-50%);
  border-left: 8px solid transparent;
  border-right: 8px solid transparent;
  border-top: 8px solid var(--color-surface);
  filter: drop-shadow(0 2px 2px rgba(0, 0, 0, 0.1));
}

@keyframes slideDown {
  0% {
    opacity: 0;
    transform: translateX(-50%) translateY(-10px);
  }
  100% {
    opacity: 1;
    transform: translateX(-50%) translateY(0);
  }
}

.close-popup {
  position: absolute;
  right: 8px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 18px !important;
  cursor: pointer;
  color: #999999;
  transition: color 0.2s ease;
}

.close-popup:hover {
  color: var(--color-text);
}
</style>
