<template>
  <div class="gradient"></div>
  <div class="consultants">
    <h1>Møt våre konsulenter</h1>
    <div class="consultant-list">
      <router-link
        v-for="person in consultants"
        :key="person.id"
        :to="`/consultantDetails?id=${person.id}`"
        class="consultant-card-link"
        style="text-decoration: none; color: inherit"
      >
        <div class="consultant-card">
          <img
            :src="`images/consultants/${person.image}`"
            :alt="`Portrett av ${person.name}`"
          />
          <h2>{{ person.name }}</h2>
          <p>{{ person.title }}</p>
        </div>
      </router-link>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";

const consultants = ref([
  {
    id: 0,
    name: "Ruth Elisabeth Bakken",
    title: "CEO & partner",
    image: "ruth_elisabeth_bakken.png",
  },
  {
    id: 1,
    name: "Anne Sofie Nordvik",
    title: "Senior IT-leder & partner",
    image: "anne_sofie_nordvik.png",
  },
]);
</script>

<style scoped>
.consultants {
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: #eae0e0;
}
.consultants h1 {
  font-size: 2rem;
  margin-top: 2rem;
  color: #000000;
  text-align: center;
}
.consultant-list {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20%;
  margin-top: 6rem;
  width: 90%;
}
.consultant-card {
  display: flex;
  position: relative;
  flex-direction: column;
  align-items: center;
  background-color: #ffffff;
  border-radius: 10px;
  width: 280px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  margin-bottom: 5rem;
  transition: box-shadow 0.4s, transform 0.4s;
  cursor: pointer;
}
.consultant-card:hover {
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.18);
  transform: translateY(-6px) scale(1.03);
}
.consultant-card img {
  width: 100%;
  height: 230px;
  object-fit: cover;
  object-position: top;
  border-radius: 10px 10px 0 0;
  aspect-ratio: 1.43;
}
.consultant-card h2 {
  margin: 1rem 0 0.1rem;
  color: #000000;
  font-size: 1.1rem;
}
.consultant-card p {
  margin: 0.5rem 0 1rem;
  color: #555555;
  text-align: center;
  font-weight: 400;
  font-size: 0.9rem;
}
.gradient {
  margin-top: 110px;
  width: 100vw;
  height: 10px;
  background: linear-gradient(
    to bottom,
    #eae0e000 0%,
    #eae0e086 50%,
    #eae0e0 100%
  );
}
.consultant-card-link {
  text-decoration: none;
  color: inherit;
  display: flex;
}

@media screen and (max-width: 795px) {
  .consultant-list {
    align-items: center;
    gap: 10%;
  }
  .consultant-card {
    width: 250px;
  }
  .consultant-card img {
    height: 200px;
  }
}
</style>