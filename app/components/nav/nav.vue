<template>
  <nav class="navbar">
    <div class="nav-content">
      <div class="logo">
        <img src="/images/logo-color.svg" alt="Logo" />
      </div>
      <ul class="nav-links">
        <li><a href="#home">Hjem</a></li>
        <li><a href="#about">Om oss</a></li>
        <li><a href="#contact">Kontakt</a></li>
      </ul>
    </div>
  </nav>
</template>

<script>
</script>

<style scoped>
.navbar {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 1rem;
  background-color: #ffffff;
  color: #000000;
  box-shadow: 0px 4px 40px rgba(0, 0, 0, 0.25);
}

.nav-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 88%;
}

.logo img {
  height: 60px;
}

.nav-links {
  list-style: none;
  display: flex;
  gap: 2rem;
  font-size: 22px;
}

a {
  font-family: montserrat;
  color: #000000;
  text-decoration: none;
}

a::after {
  transition: all ease-in-out 0.2s;
  background: none repeat scroll 0 0 #000000;
  content: "";
  display: block;
  height: 3px;
  width: 0;
}
a:hover::after {
  width: 100%;
}
</style>