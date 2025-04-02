<template>
  <footer>
    <div class="footer-background">
      <img
        src="/images/background/Footer.svg"
        alt="footer background"
        id="footer-image"
      />
    </div>
    <div class="footer-content">
      <div class="footer-1">
        <h2>logo placeholder</h2>

        <p>
          Strategisk rådgivning og projektledelse innen IT, telekom og logistikk
        </p>
      </div>
      <div class="footer-2">
        <h2>Nyttige lenker</h2>
        <a href="#home">Hjem</a>
        <a href="#about">Om oss</a>
        <a href="#work">Jobb hos oss</a>
        <a href="#contact">Kontakt</a>
      </div>
      <div class="footer-3">
        <h2>Kontakt</h2>
        <div>
          <p>+47 123 45 678</p>
        </div>
        <div>
          <p>mail@aster.no</p>
        </div>
        <div>
          <p>Havnabakken 33 <br />0874, Oslo</p>
        </div>
      </div>
    </div>
  </footer>
</template>

<style>
footer {
  width: 100vw;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
}

footer p {
  font-size: 0.8rem;
  color: #ffffff;
  width: 80%;
  margin: 0.5rem 0;
}
footer a {
  font-size: 0.8rem;
  color: #ffffff;
  text-decoration: none;
  margin: 0.5rem 0;
}
footer h2 {
  font-size: 1.2rem;
  color: #ffffff;
  margin-bottom: 0.8rem;
}
.footer-content {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  align-items: center;
  flex-direction: row;
  width: 88%;
  padding: 2rem 0;
  z-index: 1;
}
.footer-1 {
  display: flex;
  flex-direction: column;
  width: fit-content;
}
.footer-2 {
  display: flex;
  flex-direction: column;
}
.footer-3 {
  display: flex;
  flex-direction: column;
}
#footer-logo {
  width: 75px;
}
.logo {
  display: flex;
  flex-direction: row;
  align-items: center;
  width: min-content;
}
#footer-image {
  top: 0;
  left: 0;
  width: 100vw;
  position: absolute;
  z-index: -1;
}
</style>