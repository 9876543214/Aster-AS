<template>
  <footer>
    <div class="footer-content">
      <div class="footer-1">
        <h2>logo placeholder</h2>

        <p>
          Strategisk rådgivning og projektledelse <br />innen IT, telekom og
          logistikk
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
          <img src="/images/icons/phone-symbol.svg" alt="Phone symbol" />
          <p>+47 123 45 678</p>
        </div>
        <div>
          <img src="/images/icons/mail-symbol.svg" alt="Mail symbol" />
          <p>mail@aster.no</p>
        </div>
        <div>
          <img src="/images/icons/pin-symbol.svg" alt="Pin symbol" />
          <p>Havnabakken 33 <br />0874, Oslo</p>
        </div>
      </div>
    </div>
  </footer>
</template>

<style>
footer {
  width: 100vw;
  height: fit-content;
  background-color: #313131;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
  overflow: hidden;
}

footer p {
  font-size: 0.9rem;
  color: #ffffff;
  width: 100%;
  margin: 0.5rem 0;
}
footer a {
  font-size: 0.9rem;
  color: #ffffff;
  text-decoration: none;
  margin: 0.5rem 0;
}
footer h2 {
  font-size: 1.3rem;
  color: #ffffff;
  margin-bottom: 1rem;
}
.footer-content {
  width: 85%;
  display: flex;
  flex-wrap: wrap;
  position: relative;
  justify-content: space-between;
  flex-direction: row;
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
  height: min-content;
}
.footer-3 {
  display: flex;
  flex-direction: column;
  height: min-content;
}
.footer-3 div {
  display: flex;
  flex-direction: row;
  align-items: center;
  margin-bottom: 0.5rem;
  width: fit-content;
  gap: 0.5rem;
}
.footer-3 img {
  width: 0.8rem;
  height: 0.8rem;
}
.footer-2 a,
.footer-3 p {
  white-space: nowrap;
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
</style>