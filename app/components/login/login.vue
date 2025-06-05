<template>
  <v-dialog v-model="localDialog" max-width="400">
    <v-card>
      <v-card-title class="headline">Logg inn</v-card-title>
      <v-card-text>
        <v-form @submit.prevent="handleLogin">
          <v-text-field
            v-model="username"
            label="Brukernavn"
            required
          ></v-text-field>
          <v-text-field
            v-model="password"
            label="Passord"
            type="password"
            required
          ></v-text-field>
          <v-card-actions class="mt-4">
            <v-spacer></v-spacer>
            <v-btn color="primary" type="submit">Logg inn</v-btn>
            <v-btn text @click="closeDialog">Avbryt</v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </v-dialog>
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

// Keep localDialog in sync with parent dialog prop
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