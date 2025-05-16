<template>
  <button
    type="submit"
    class="submit-button"
    :class="{
      submitting: isSubmitting,
      success: isSuccess,
      submitted: submitted,
      failure: isSuccess === false,
    }"
    :disabled="isSubmitting"
    @animationend="handleAnimationEnd"
  >
    <span v-if="!isSubmitting && !submitted">Send nå</span>
    <img src="/images/icons/arrow-right.svg" alt="arrow" />
    <i v-if="submitted && isSuccess === true" class="fa-solid fa-check"></i>
    <i v-if="submitted && isSuccess === false" class="fa-solid fa-times"></i>
  </button>
</template>

<script>
import "@fortawesome/fontawesome-free/css/all.min.css";
export default {
  props: {
    isSubmitting: Boolean,
    isSuccess: Boolean,
    submitted: Boolean,
  },
  watch: {
    isSubmitting(newVal) {
      if (newVal) {
        this._spin80Timer = setTimeout(() => {
          this.$emit("spin-ended");
        }, 2780);
      } else {
        clearTimeout(this._spin80Timer);
      }
    },
  },
  beforeDestroy() {
    clearTimeout(this._spin80Timer);
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

.submit-button.submitted {
  border: 2px solid #196164;
  color: transparent;
  background: none;
  outline: none;
  border: 2px solid transparent;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  padding: 12px 12px;
  pointer-events: none;
  transition: 200ms;
}

.submit-button.submitting img {
  display: none;
}

.submit-button.submitted img {
  display: none;
}

.submit-button.success {
  border-color: rgb(0, 148, 25) !important;
}

.submit-button.failure {
  border-color: #dc3545 !important;
}

.submit-button.success i {
  color: rgb(0, 148, 25); /* Green for success */
  position: relative;
}

.submit-button.failure {
  animation: shake 0.5s ease-in-out;
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

@keyframes shake {
  0%,
  100% {
    transform: translateX(0);
  }
  25% {
    transform: translateX(-5px);
  }
  50% {
    transform: translateX(5px);
  }
  75% {
    transform: translateX(-5px);
  }
}

i {
  margin-top: 2px;
  transition: 200ms;
  color: transparent;
  font-size: 18px;
}

.submit-button img {
  width: 14px;
  height: 14px;
  color: white;
}
</style>