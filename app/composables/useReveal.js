import { ref, onMounted, onBeforeUnmount } from "vue";

export function useReveal(options = {}) {
  const elRef = ref(null);
  const isVisible = ref(false);
  let observer = null;

  onMounted(() => {
    if (!elRef.value) return;

    observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          isVisible.value = true;
          observer.unobserve(entry.target);
        }
      },
      { threshold: options.threshold ?? 0.15 }
    );

    observer.observe(elRef.value);
  });

  onBeforeUnmount(() => {
    if (observer) observer.disconnect();
  });

  return { elRef, isVisible };
}
