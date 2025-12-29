<template>
  <footer class="footer">
    <div class="footer_container">

      <div class="footer_section">
        <h3>Tea Shop</h3>
        <p>
          Premium teas sourced from traditional tea regions.
        </p>
        <div class="socials">
          <svg-icon type="mdi" :path="path"></svg-icon>
          <svg-icon type="mdi" :path="pathTwitter"></svg-icon>
          <svg-icon type="mdi" :path="pathYoutube"></svg-icon>
        </div>
      </div>

      <div class="footer_section">
        <h4>Links</h4>
        <router-link to="/about">About Us</router-link>
      </div>

      <div class="footer_section">
        <h4>Contact</h4>
        <p>Email: info@teashop.com</p>
        <p>Phone: +421 900 000 000</p>
      </div>

    </div>

    <div class="footer_bottom">
      © 2025 Tea Shop. All rights reserved.
    </div>
  </footer>
</template>

<script>
import SvgIcon from '@jamescoyle/vue-icon';
import { mdiFacebook } from '@mdi/js';
import { mdiTwitter } from '@mdi/js';
import { mdiYoutube } from '@mdi/js';
export default {
  name: 'TheFooter',
  components: {
    SvgIcon
  },
  data() {
    return {
      path: mdiFacebook,
      pathTwitter: mdiTwitter,
      pathYoutube: mdiYoutube
    }
  }
}
</script>

<style scoped>
.footer {
  background-color: rgba(244, 246, 243, 0.9);
  backdrop-filter: blur(10px);
  border-top: 1px solid #d7ddd6;
  color: #323232;
  padding: 3rem 1.5rem 1.5rem;
}

.footer_container {
  max-width: 1100px;
  margin: 0 auto;
  display: flex;
  gap: 3rem;
  justify-content: space-between;
}

.footer_section {
  flex: 1;
}

.footer_section h3,
.footer_section h4 {
  margin-bottom: 1rem;
  font-size: 1.1rem;
}

.footer_section p,
.footer_section a {
  color: #3a3a3a;
  font-size: 0.9rem;
  line-height: 1.6;
  text-decoration: none;
  max-width: 200px;
}

.footer_section a:hover {
  color: #405d1c;
}

.socials {
  margin-top: 1rem;
  display: flex;
  gap: 1rem;
  font-size: 1.2rem;
}

.socials a {
  color: #bbb;
}

.socials a:hover {
  color: #fff;
}

.footer_bottom {
  text-align: center;
  margin-top: 1rem;
  font-size: 0.8rem;
  color: #777;
}

@media (max-width: 768px) {
  .footer_container {
    flex-direction: column;
    text-align: center;
    align-items: center;
    gap: 2rem;
  }

  .socials {
    justify-content: center;
  }

  .footer_section {
    align-items: center;
  }
}
</style>
