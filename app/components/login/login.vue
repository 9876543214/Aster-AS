<template>
  <Teleport to="body">
    <Transition name="modal">
      <div v-if="localDialog" class="modal-overlay" @click.self="closeDialog">
        <div class="modal-card">
          <h2 class="modal-title">Logg inn</h2>
          <form @submit.prevent="handleLogin" class="modal-form">
            <div class="form-group">
              <label for="username">Brukernavn</label>
              <input
                id="username"
                v-model="username"
                type="text"
                required
                autocomplete="username"
              />
            </div>
            <div class="form-group">
              <label for="password">Passord</label>
              <input
                id="password"
                v-model="password"
                type="password"
                required
                autocomplete="current-password"
              />
            </div>
            <div class="modal-actions">
              <button type="button" class="btn-secondary" @click="closeDialog">Avbryt</button>
              <button type="submit" class="btn-primary">Logg inn</button>
            </div>
          </form>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup>
import { ref, watch } from "vue";

const props = defineProps({
  dialog: Boolean,
});
const emit = defineEmits(["update:dialog", "login"]);

const localDialog = ref(props.dialog);
const username = ref("");
const password = ref("");

watch(
  () => props.dialog,
  (value) => {
    localDialog.value = value;
  }
);
watch(localDialog, (value) => {
  emit("update:dialog", value);
});

function handleLogin() {
  emit("login", { username: username.value, password: password.value });
  closeDialog();
}

function closeDialog() {
  localDialog.value = false;
  username.value = "";
  password.value = "";
}
</script>

<style scoped>
.modal-overlay {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 3000;
}

.modal-card {
  background: var(--color-surface);
  border-radius: var(--radius-md);
  padding: 2rem;
  width: 100%;
  max-width: 400px;
  margin: 1rem;
  box-shadow: var(--shadow-lg);
}

.modal-title {
  font-size: 1.5rem;
  margin-bottom: 1.5rem;
  color: var(--color-text);
}

.form-group {
  margin-bottom: 1.25rem;
}

.form-group label {
  display: block;
  font-size: 0.875rem;
  font-weight: 600;
  color: var(--color-text-muted);
  margin-bottom: 0.5rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.form-group input {
  width: 100%;
  height: 44px;
  padding: 0 0.75rem;
  border: 1px solid var(--color-border);
  border-radius: var(--radius-sm);
  font-family: var(--font-body);
  font-size: 1rem;
  color: var(--color-text);
  background: var(--color-surface);
  transition: border-color 0.2s ease;
}

.form-group input:focus {
  outline: none;
  border-color: var(--color-accent);
}

.modal-actions {
  display: flex;
  justify-content: flex-end;
  gap: 0.75rem;
  margin-top: 1.5rem;
}

.btn-primary {
  padding: 0.625rem 1.25rem;
  background: var(--color-accent);
  color: #ffffff;
  border: none;
  border-radius: var(--radius-sm);
  font-size: 0.9rem;
  font-weight: 600;
  transition: background-color 0.2s ease;
}

.btn-primary:hover {
  background: var(--color-accent-hover);
}

.btn-secondary {
  padding: 0.625rem 1.25rem;
  background: transparent;
  color: var(--color-text-muted);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-sm);
  font-size: 0.9rem;
  font-weight: 600;
  transition: border-color 0.2s ease, color 0.2s ease;
}

.btn-secondary:hover {
  border-color: var(--color-text-muted);
  color: var(--color-text);
}

/* Transition */
.modal-enter-active,
.modal-leave-active {
  transition: opacity 0.25s ease;
}

.modal-enter-active .modal-card,
.modal-leave-active .modal-card {
  transition: transform 0.25s ease;
}

.modal-enter-from,
.modal-leave-to {
  opacity: 0;
}

.modal-enter-from .modal-card {
  transform: translateY(-20px);
}

.modal-leave-to .modal-card {
  transform: translateY(10px);
}
</style>
