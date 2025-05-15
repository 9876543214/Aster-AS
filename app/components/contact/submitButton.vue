<template>
  <button
    type="submit"
    class="submit-button"
    :class="{
      submitting: isSubmitting,
      success: isSuccess,
      failure: isSuccess === false,
    }"
    :disabled="isSubmitting"
  >
    <span v-if="!isSubmitting">Send nå</span>
    <img v-if="isSubmitting" src="/images/icons/arrow-right.svg" alt="arrow" />
    <i v-if="isSubmitting && isSuccess === true" class="fa-solid fa-check"></i>
    <i v-if="isSubmitting && isSuccess === false" class="fa-solid fa-times"></i>
  </button>
</template>

<script>
export default {
  props: {
    isSubmitting: Boolean,
    isSuccess: Boolean,
  },
};
</script>

<style>
.submit-button {
  background-color: #196164;
  width: 85%;
  border-radius: 10px;
  color: white;
  border: none;
  padding: 12px 20px;
  cursor: pointer;
  font-size: 13px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: lato;
  gap: 8px;
  outline: none;
  transition: 275ms;
  position: relative;
}

.submit-button.submitting {
  color: transparent;
  background: none;
  outline: none;
  border: 2px solid transparent;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  padding: 12px 12px;
  border-left: 2px solid #196164;
  animation: spin 3s 160ms forwards;
  pointer-events: none; /* Prevent interaction while animating */
}

.submit-button.submitting img {
  display: none;
}

.submit-button.success i {
  color: #28a745; /* Green for success */
}

.submit-button.failure i {
  color: #dc3545; /* Red for failure */
}

.submit-button:disabled {
  cursor: not-allowed;
  opacity: 0.6;
}

@keyframes spin {
  80% {
    border: 2px solid transparent;
    border-left: 2px solid #196164;
    background: none;
  }
  100% {
    transform: rotate(720deg);
    border: 2px solid #196164;
  }
}

i {
  position: absolute;
  color: transparent;
  transition: 200ms;
}

@keyframes spin {
  80% {
    border: 2px solid transparent;
    border-left: 2px solid #196164;
    background: none;
  }
  100% {
    transform: rotate(720deg);
    border: 2px solid #196164;
  }
}

@keyframes check {
  to {
    color: #196164;
  }
}

.submit-button img {
  width: 14px;
  height: 14px;
  color: white;
}
</style>