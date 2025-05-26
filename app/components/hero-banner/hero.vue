<template>
  <div class="hero-banner">
    <div class="background">
      <img
        id="hero-image"
        src="/images/background/hero_background.png"
        alt="background image"
      />
    </div>
    <div class="size"></div>
    <div class="hero-content">
      <div class="left">
        <h1>Fra strategi til handling</h1>
        <p>
          Vi hjelper virksomheter med å lykkes i digital transformasjon ved å
          kombinere erfaring, innsikt og effektive prosesser - levert av våre
          dyktige konsulenter!
        </p>
        <div class="buttons">
          <div class="btn fill">Om oss</div>
          <div class="btn">Kontakt</div>
        </div>
      </div>
      <div class="right">
        <img
          class="logo-icon"
          src="/images/logos/logo-icon-color.svg"
          alt="logo icon with color"
        />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "test",
};
</script>

<style scoped>
body {
  width: 100vw;
  margin: 0;
  padding: 0;
  font-family: "Lato";
  overflow-x: hidden;
}

.hero-banner {
  width: 100vw;
  height: min-content;
  display: flex;
  flex-direction: row;
  justify-content: center;

  overflow: hidden !important;
}

.hero-content {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: flex-start;
  width: 88%;
  height: min-content;
}

.background {
  position: absolute;
  z-index: -1;
  top: calc(-460px + 10vw);
  width: 100vw;
  overflow: hidden;
}

.size {
  background-color: #000;
  height: calc(100vh - 63.6px);
  max-height: calc(1000px - 460px + 10vw);
  position: relative;
}

#hero-image {
  width: 100vw;
  min-width: 1620px;
  min-height: 1080px;
}

.logo-icon {
  position: absolute;
  top: min(24%, 200px);
  left: 60%;
  width: calc(110px + 17vw);
  height: auto;
}

.left {
  display: flex;
  flex-direction: column;
}

.right {
  max-width: 50vw;
  display: flex;
  height: fit-content;
}

h1 {
  margin-top: 80px;
  font-family: montserrat;
  font-size: calc(34px + 0.5vw);
  width: calc(295px + 7.5vw);
}

p {
  margin-top: 34px;
  font-family: lato;
  font-size: calc(12px + 0.3vw);
  width: calc(295px + 7.5vw);
}

.buttons {
  margin-top: 60px;
  display: flex;
  gap: 45px;
}

.btn {
  background-color: transparent;
  border: 1px solid #000;
  border-radius: 7.5px;
  padding: 12px 24px;
  color: #333;
  font-size: 15px;
  cursor: pointer;
  transition: color 0.5s, transform 0.2s, background-color 0.3s;
}

.fill {
  background-color: #1a237e;
  color: white;
  border: none;
}

.fill:hover {
  background-color: #1e299b;
}

@media (max-width: 820px) {
  .right {
    display: none;
  }
}

@media (max-width: 430px) {
  .hero-content {
    width: 100%;
  }
  .left {
    margin-left: 10px;
  }
}
</style>