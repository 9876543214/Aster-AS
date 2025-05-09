<template>
  <div class="gradient"></div>
  <div class="customers">
    <h1>Noen av våre viktigste kunder</h1>
    <div class="customer-logos">
      <div>
        <img
          src="/images/customers/Rema1000-logo.svg"
          alt="Rema 1000 Logo"
          class="logo"
          id="rema"
        />
      </div>
      <div>
        <img
          src="/images/customers/Kolly-logo.svg"
          alt="Kolly Logo"
          class="logo"
          id="kolly"
        />
      </div>
      <div>
        <img
          src="/images/customers/Norwegian_logo.svg"
          alt="Norwegian Logo"
          class="logo"
          id="norwegian"
        />
      </div>
      <div>
        <img
          src="/images/customers/Rema1000-logo.svg"
          alt="Rema distrubisjon Logo"
          class="logo"
          id="rema-distrubisjon"
        />
      </div>
      <div>
        <img
          src="/images/customers/Posten-logo.svg"
          alt="Posten Logo"
          class="logo"
          id="posten"
        />
      </div>
      <div>
        <img
          src="/images/customers/statensvegvesen-logo.svg"
          alt="Statens vegvesen Logo"
          class="logo"
          id="vegvesen"
        />
      </div>
      <div>
        <img
          src="/images/customers/Telenor-logo.svg"
          alt="Telenor Logo"
          class="logo"
          id="telenor"
        />
      </div>
    </div>
  </div>
  <div class="gradient-bottom"></div>
</template>

<style>
.gradient {
  margin-top: 110px;
  width: 100vw;
  height: 20px;
  background: linear-gradient(
    to bottom,
    #eae0e000 0%,
    #eae0e086 50%,
    #eae0e0 100%
  );
}
.gradient-bottom {
  width: 100vw;
  height: 10px;
  background: linear-gradient(
    to top,
    #eae0e000 0%,
    #eae0e086 50%,
    #eae0e0 100%
  );
}
.customers {
  width: 100vw;
  background-color: #eae0e0;
  display: flex;
  flex-direction: column;
  z-index: 2;
  align-items: center;
  row-gap: 2rem;
  overflow: hidden;
}
.customer-logos {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  gap: 5rem;
  margin-top: 3rem;
  width: 80%;
  margin-bottom: 5rem;
}
.customer-logos div {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 190px;
  height: 100px;
  transition: transform 0.3s ease;
}
.logo {
  width: 100%;
  height: auto;
  object-fit: contain;
  transition: transform 0.3s ease;
}
#vegvesen {
  width: 190px;
  height: auto;
  object-fit: contain;
}
#norwegian {
  width: 240px;
  height: auto;
  object-fit: contain;
}
#posten {
  width: 180px;
  height: auto;
  object-fit: contain;
}
#rema {
  width: 130px;
  height: auto;
  object-fit: contain;
}
#rema-distrubisjon {
  width: 130px;
  height: auto;
  object-fit: contain;
}
#kolly {
  width: 180px;
  height: auto;
  object-fit: contain;
}
#telenor {
  width: 200px;
  height: auto;
  object-fit: contain;
}

@media screen and (max-width: 702px) {
  h1 {
    font-size: 1.6rem;
  }
  .customer-logos {
    gap: 5rem;
  }
  .customer-logos div {
    width: 180px;
    height: auto;
  }
  #rema {
    width: 120px;
    height: auto;
    object-fit: contain;
  }
  #rema-distrubisjon {
    width: 120px;
    height: auto;
    object-fit: contain;
  }
  #kolly {
    width: 150px;
    height: auto;
    object-fit: contain;
  }
  #norwegian {
    width: 180px;
    height: auto;
    object-fit: contain;
  }
  #vegvesen {
    width: 160px;
    height: auto;
    object-fit: contain;
  }
  #posten {
    width: 150px;
    height: auto;
    object-fit: contain;
  }
  #telenor {
    width: 150px;
    height: auto;
    object-fit: contain;
  }
}
@media screen and (max-width: 550px) {
  h1 {
    font-size: 1.4rem;
  }
  .customer-logos {
    gap: 5rem;
  }
  .customer-logos div {
    width: 150px;
    height: auto;
  }
  #rema {
    width: 100px;
    height: auto;
    object-fit: contain;
  }
  #rema-distrubisjon {
    width: 100px;
    height: auto;
    object-fit: contain;
  }
  #kolly {
    width: 120px;
    height: auto;
    object-fit: contain;
  }
  #norwegian {
    width: 150px;
    height: auto;
    object-fit: contain;
  }
  #vegvesen {
    width: 130px;
    height: auto;
    object-fit: contain;
  }
  #posten {
    width: 120px;
    height: auto;
    object-fit: contain;
  }
  #telenor {
    width: 130px;
    height: auto;
    object-fit: contain;
  }
}
@media screen and (max-width: 475px) {
  h1 {
    font-size: 1.2rem;
  }
  .customer-logos {
    gap: 5rem;
  }
  .customer-logos div {
    width: 120px;
    height: auto;
  }
  #rema {
    width: 90px;
    height: auto;
    object-fit: contain;
  }
  #rema-distrubisjon {
    width: 90px;
    height: auto;
    object-fit: contain;
  }
  #kolly {
    width: 110px;
    height: auto;
    object-fit: contain;
  }
  #norwegian {
    width: 130px;
    height: auto;
    object-fit: contain;
  }
  #vegvesen {
    width: 120px;
    height: auto;
    object-fit: contain;
  }
  #posten {
    width: 110px;
    height: auto;
    object-fit: contain;
  }
  #telenor {
    width: 110px;
    height: auto;
    object-fit: contain;
  }
}
@media screen and (max-width: 400px) {
  h1 {
    font-size: 1.1rem;
  }
  .customer-logos {
    gap: 5rem;
  }
  .customer-logos div {
    width: 100px;
    height: auto;
  }
  #rema {
    width: 80px;
    height: auto;
    object-fit: contain;
  }
  #rema-distrubisjon {
    width: 80px;
    height: auto;
    object-fit: contain;
  }
  #kolly {
    width: 90px;
    height: auto;
    object-fit: contain;
  }
  #norwegian {
    width: 110px;
    height: auto;
    object-fit: contain;
  }
  #vegvesen {
    width: 100px;
    height: auto;
    object-fit: contain;
  }
  #posten {
    width: 90px;
    height: auto;
    object-fit: contain;
  }
}
</style>