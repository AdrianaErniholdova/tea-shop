<template>
  <div class="hero_section">
    <div class="hero_section_image_wrapper">
    <img src="/images/hero_section.jpg" alt="Tea Shop Image" class="hero_section_image" />
    </div>
    <div class="hero_overlay">
      <div class="hero_content">
        <h1 class="hero_title">Welcome to the Tea Shop</h1>
        <p class="hero_subtitle">Discover our finest selection of teas from around the world.</p>
        <RouterLink to="/products" class="hero_shop_btn">Shop Now</RouterLink>
      </div>
    </div> 
  </div>
</template>

<script></script>

<style scoped>
.hero_section {
  position: relative;
  width: 100%;
  overflow: hidden;
}

.hero_section_image_wrapper {
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.hero_section_image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: right center;
  transition: transform 0.3s ease;
  transform-origin: right center;
}

.hero_overlay {
  position: absolute;
  inset: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
}

.hero_content {
  padding-left: 8vw;
  padding-right: 2vw;
}

.hero_title {
  font-size: clamp(2rem, 5vw, 3.5rem);
  font-weight: 700;
  margin-bottom: 1rem;
}

.hero_subtitle {
  font-size: clamp(1rem, 2vw, 1.2rem);
  max-width: 420px;
  margin-bottom: 2rem;
  line-height: 1.6;
  color: #29332c;
}

.hero_shop_btn {
  display: inline-block;
  background: #405d1c;
  color: white;
  padding: 0.9rem 2rem;
  border-radius: 12px;
  text-decoration: none;
  font-weight: 600;
  transition: all 0.3s ease;
  box-shadow: 0 4px 12px rgba(138, 157, 133, 0.25);
}

.hero_shop_btn:hover {
  background: #6d7e0e;
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(138, 157, 133, 0.35);
}

/* RESPONSIVE */

/* Tablet - šálka sa začína posúvať do stredu */
@media (max-width: 1400px) {

  .hero_section_image {
    object-position: 60% center; /* Šálka bližšie ku stredu */
  }

  .hero_content {
    padding-left: 6vw;
  }

  .hero_title {
    font-size: 2.5rem;
  }
}

@media (max-width: 1024px) {
  .hero_title {
    font-size: 2rem;
  }

  .hero_subtitle {
    font-size: 1rem;
  }
}

/* Mobile Large - text nad šálkou */
@media (max-width: 768px) {
  .hero_section {
    height: auto;
    min-height: 550px;
    padding-top: 70px;
  }

  .hero_section_image {
    object-position: center 60%; /* Šálka v strede, trochu nižšie */
  }

  .hero_overlay {
    align-items: flex-start;
    padding-top: 3rem;
  }

  .hero_content {
    padding: 0 2rem;
    text-align: center;
    max-width: 50%;
  }

  .hero_subtitle {
    margin-left: auto;
    margin-right: auto;
  }
}

/* Mobile Medium - text hore, zoom na šálku */
@media (max-width: 640px) {
  .hero_section {
    min-height: 500px;
    padding-top: 70px;
  }

  .hero_section_image {
    transform: scale(1.3);
    object-position: 85% center;
  }

  .hero_overlay {
    padding-top: 2rem;
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(6px); /* hlavný blur efekt */
    -webkit-backdrop-filter: blur(6px);
    align-items: center;
  }

  .hero_content {
    padding: 0 0.5rem;
    max-width: 100%;
  }
}

/* Mobile Small - ešte väčší zoom */
@media (max-width: 480px) {
  .hero_section {
    min-height: 450px;
    padding-top: 70px;
  }

  .hero_section_image {
    transform: scale(1.35);
    object-position: 85% center;
  }

  .hero_overlay {
    
    backdrop-filter: blur(10px); /* hlavný blur efekt */
    -webkit-backdrop-filter: blur(6px);
    padding-top: 1.5rem;
  } 

  .hero_shop_btn {
    padding: 0.85rem 2rem;
    font-size: 0.95rem;
  }

  .hero_content {
    max-width: 100%;
  }
}

/* Extra Small - maximálny zoom na šálku */
@media (max-width: 360px) {
  .hero_section {
    min-height: 400px;
    padding-top: 70px;
  }

  .hero_section_image {
    transform: scale(1.5);
    object-position: 80% center;
  }

  .hero_shop_btn {
    padding: 0.8rem 1.75rem;
    font-size: 0.9rem;
  }

  .hero_overlay {
    
    backdrop-filter: blur(10px); /* hlavný blur efekt */
    -webkit-backdrop-filter: blur(6px);
    padding-top: 1rem;
  }
}
</style>