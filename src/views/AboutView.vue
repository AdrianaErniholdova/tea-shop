<template>
  <div class="about">
    <section class="about_hero">
      <h1>About Us</h1>
      <p>We believe tea is more than a drink — it is a ritual, a culture, and a 
        moment of calm in a fast-moving world.</p>
      <hr />
    </section>
    
    <section class="about_section">
      <div class="about_text">
        <h2>Our Passion for Tea</h2>
        <p>Our journey began with a deep respect for tea traditions and a desire
          to bring exceptional quality to every cup. We carefully select teas
          that reflect craftsmanship, balance, and purity.</p>
      </div>
      <div class="about_image">
        <img src="/images/about1.jpg" alt="Tea Ceremony"/>
      </div>
    </section>

    <section class="about_section reverse">
      <div class="about_text">
        <h2>Tea Growing Regions</h2>
        <p>We source our teas from renowned regions such as China, Japan,
          India, and Sri Lanka. Each region imparts unique flavors and
          characteristics to the teas we offer.</p>
      </div>
      <div class="about_image">
        <img src="/images/about2.jpg" alt="Tea Fields"/>
      </div>
    </section>

    <section class="about_section">
      <div class="about_text">
        <h2>From Leaf to Cup</h2>
        <p>Every tea follows a careful journey from the moment it is harvested
          until it reaches your cup.</p>
        <p>Traditional processing methods help preserve aroma, flavor
          and character.</p>
      </div>
      <div class="about_image">
        <img src="/images/about3.jpg" alt="Sustainability"/>
      </div>
    </section>
  </div>
</template>

<script></script>

<style scoped>
.about {
  max-width: 1300px;
  margin: 0 auto;
  padding: 8rem 1.5rem;
}

.about_hero {
  text-align: center;
  margin-bottom: 4rem;
}

.about_hero h1 {
  font-size: 2.5rem;
  margin-bottom: 1rem;
}

.about_hero p {
  max-width: 600px;
  margin: 0 auto;
  color: #555;
  padding-bottom: 2rem;
}

.about_section {
  display: flex;
  align-items: center;
  gap: 3rem;
  margin-bottom: 5rem;
}

.about_section.reverse {
  flex-direction: row-reverse;
}

.about_text {
  flex: 1;
}

.about_text h2 {
  font-size: 1.8rem;
  margin-bottom: 1rem;
}

.about_text p,
.about_text li {
  color: #444;
  line-height: 1.6;
}

.about_text ul {
  padding-left: 1.2rem;
}

.about_image {
  flex: 1;
  max-width: 400px;
}

.about_image img {
  width: 100%;
  border-radius: 14px;
  object-fit: cover;
}

@media (max-width: 768px) {
  .about_section,
  .about_section.reverse {
    flex-direction: column;
  }
}
</style>