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
        }, 2400);
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
  background-color: var(--color-accent);
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
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
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
  border-left: 2px solid var(--color-accent);
  animation: spin 2.5s ease-in-out forwards;
  pointer-events: none;
}

.submit-button.submitted {
  color: transparent;
  background: none;
  outline: none;
  border: 2px solid var(--color-accent);
  border-radius: 50%;
  width: 40px;
  height: 40px;
  padding: 12px 12px;
  pointer-events: none;
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.submit-button.submitting img {
  display: none;
}

.submit-button.submitted img {
  display: none;
}

.submit-button.success {
  border-color: rgb(0, 148, 25) !important;
  animation: successPulse 0.6s ease-out;
}

.submit-button.failure {
  border-color: #dc3545 !important;
}

.submit-button.success i {
  color: rgb(0, 148, 25);
  position: relative;
  animation: checkmarkAppear 0.4s ease-out forwards;
}

.submit-button.failure {
  animation: shake 0.5s ease-in-out;
}

.submit-button.failure i {
  color: #dc3545;
  animation: checkmarkAppear 0.4s ease-out forwards;
}

.submit-button:disabled {
  cursor: not-allowed;
  opacity: 0.6;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
    border: 2px solid transparent;
    border-left: 2px solid var(--color-accent);
  }
  80% {
    transform: rotate(640deg);
    border: 2px solid transparent;
    border-left: 2px solid var(--color-accent);
  }
  100% {
    transform: rotate(720deg);
    border: 2px solid var(--color-accent);
  }
}

@keyframes successPulse {
  0% {
    transform: scale(1);
    box-shadow: 0 0 0 0 rgba(0, 148, 25, 0.4);
  }
  50% {
    transform: scale(1.05);
    box-shadow: 0 0 0 8px rgba(0, 148, 25, 0);
  }
  100% {
    transform: scale(1);
    box-shadow: 0 0 0 0 rgba(0, 148, 25, 0);
  }
}

@keyframes checkmarkAppear {
  0% {
    opacity: 0;
    transform: scale(0.5);
  }
  50% {
    opacity: 1;
    transform: scale(1.2);
  }
  100% {
    opacity: 1;
    transform: scale(1);
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
  color: transparent;
  font-size: 18px;
}

.submit-button img {
  width: 14px;
  height: 14px;
  color: white;
}
</style>