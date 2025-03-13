<template>
  <div class="hero-banner">
    <div class="background">
      <img
        id="hero-image"
        src="/images/hero-background.png"
        alt="background image"
      />
    </div>
    <div class="left">
      <h1>Fra strategi <br />til handling</h1>
      <p>
        Vi hjelper virksomheter med å lykkes i digital transformasjon
        <br />ved å kombinere erfaring, innsikt og effektive prosesser -
        <br />levert av våre dyktige konsulenter!
      </p>
      <div class="buttons">
        <div class="btn fill">Om oss</div>
        <div class="btn">Kontakt</div>
      </div>
    </div>
    <div class="right">
      <img
        class="logo-icon"
        src="/images/logo-icon-color.svg"
        alt="logo icon with color"
      />
    </div>
  </div>
</template>

<script>
export default {
  name: "test",
};
</script>

<style scoped>
.hero-banner {
  height: 100vh;
  width: 100vw;
  display: flex;
  flex-direction: row;
  color: #333;
  overflow: hidden;
}

.background {
  position: absolute;
  z-index: -1;
  top: -5vh;
}

#hero-image {
  width: 100vw;
  height: 105vh;
}

.logo-icon {
  width: 60%;
}

.left {
  display: flex;
  flex-direction: column;
  padding-left: 130px;
}

.right {
  max-width: 50vw;
  display: flex;
  height: 77vh;
  justify-content: right;
  align-items: center;
}

h1 {
  font-family: montserrat;
  font-size: 55px;
  margin-top: 130px;
}

p {
  margin-top: 45px;
  font-family: lato;
  font-size: 21px;
}

.buttons {
  margin-top: 60px;
  display: flex;
  gap: 30px;
}

.btn {
  background-color: #00000000;
  border: 1px solid #000;
  border-radius: 10px;
  padding: 14px 24px;
  color: #333;
  font-size: 20px;
  cursor: pointer;
}

.btn:hover {
  box-shadow: 0 0 10px 0 rgba(255, 255, 255, 0.2);
}

.fill {
  background-color: #1a237e;
  color: white;
}

.fill:hover {
  background-color: #212989;
}
</style>