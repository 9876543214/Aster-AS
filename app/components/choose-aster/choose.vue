<script setup>
// Import onMounted lifecycle hook from Vue
import { onMounted } from "vue";

// Use onMounted to run code after the component is mounted
onMounted(() => {
  // Check if IntersectionObserver is supported
  if ("IntersectionObserver" in window) {
    // Create a new IntersectionObserver instance
    const observer = new IntersectionObserver(
      (entries, observer) => {
        // Loop through observed entries
        entries.forEach((entry) => {
          // If the element is in the viewport
          if (entry.isIntersecting) {
            // Reset transform to translateY(0) when the .show class is added
            entry.target.style.transform = "translateY(0)";
            entry.target.classList.add("show");
            // Stop observing this element
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold: 0 }
    );

    // Select all elements with the pop-up-element-choose class
    const elements = document.querySelectorAll(".pop-up-element-choose");
    elements.forEach((element) => {
      // Generate random delay between 0.1s and 0.5s for the transition
      const randomDelay = (Math.random() * 0.2 + 0.1).toFixed(2);
      element.style.transitionDelay = `${randomDelay}s`;

      // Generate random translateY distance between 150px and 250px
      const randomDistance = Math.random() * 100 + 150;
      element.style.transform = `translateY(${randomDistance}px)`;

      // Observe the element for intersection
      observer.observe(element);
    });
  }
});
</script>

<template>
  <!-- Main container for the choose section -->
  <div class="choose">
    <div class="choose-header">
      <h1>Hvorfor velge Aster?</h1>
    </div>
    <div class="choose-content">
      <!-- First pop-up element: Stjernekonsulenter -->
      <div class="stjernekonsulenter pop-up-element-choose">
        <div class="img">
          <img src="/images/icons/star_icon.svg" alt="stjerne ikon" id="star" />
        </div>
        <div class="stjernekonsulenter-content">
          <h2>Stjernekonsulenter</h2>
          <p>Erfarne konsulenter med både teknisk og økonomisk ekspertise</p>
        </div>
      </div>
      <!-- Second pop-up element: Resultatorientert -->
      <div class="resultat pop-up-element-choose">
        <div class="img">
          <img
            src="/images/icons/chart_icon.svg"
            alt="linjediagram ikon"
            id="chart"
          />
        </div>
        <div class="resultat-content">
          <h2>Resultatorientert</h2>
          <p>Vi leverer tjenester av høy kvalitet til riktig tid og kostnad</p>
        </div>
      </div>
      <!-- Third pop-up element: Bransjekompetanse -->
      <div class="kompetanse pop-up-element-choose">
        <div class="img">
          <img src="/images/icons/cogs_icon.svg" alt="tannhjul ikon" id="cog" />
        </div>
        <div class="kompetanse-content">
          <h2>Bransjekompetanse</h2>
          <p>Dyp forståelse for IT, sikkerhet, logistikk og retail</p>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
/* Main container styling */
.choose {
  display: flex;
  flex-direction: column;
  z-index: 2;
  align-items: center;
  row-gap: 2.7rem;
  margin-bottom: 3rem;
  margin-top: 6rem;
}
/* Layout for the content area */
.choose-content {
  display: flex;
  flex-direction: row;
  gap: 10%;
  align-items: flex-end;
  flex-wrap: wrap;
  width: 100vw;
  justify-content: center;
}
/* Each pop-up element container */
.choose-content div {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: end;
  width: 300px;
}
/* Inner content containers */
.choose-content div div {
  display: flex;
  flex-direction: column;
  row-gap: 0;
}
/* Styling for the three content blocks */
.stjernekonsulenter-content,
.resultat-content,
.kompetanse-content {
  display: flex;
  flex-direction: column;
  padding: 1rem;
  padding-top: 1.2rem;
  padding-bottom: 1.2rem;
  background-color: #1a237e00;
  color: rgb(0, 0, 0);
}
/* Headings styling */
.choose-content h2 {
  font-size: 20px;
  white-space: nowrap;
  width: 245px;
  margin-bottom: 0.9rem;
}

/* Paragraph styling */
.choose-content p {
  font-size: 14px;
  margin-top: 0;
  width: 245px;
}
/* Image container styling */
.img {
  margin: 1rem;
  display: flex;
  justify-content: center;
  width: 200px;
  align-items: center;
}
/* Icon sizes */
#star {
  width: 75px;
  height: 75px;
}
#chart {
  width: 75px;
  height: 75px;
}
#cog {
  width: 75px;
  height: 75px;
}
/* Animation initial state */
.pop-up-element-choose {
  opacity: 0;
  transform: translateY(200px);
  transition: all 0.8s ease-in-out;
  will-change: transform, opacity;
}

/* Animation final state when shown */
.pop-up-element-choose.show {
  opacity: 1;
  transform: translateY(0);
}

/* Responsive adjustments */
@media screen and (max-width: 1200px) {
  .choose-content {
    gap: 5%;
  }
}
</style>