<template>
  <nav class="nav">
    <div class="nav_container">

      <RouterLink to="/" class="nav_logo">
        <span class="nav_logo-icon">🍵</span>
        <span class="nav_logo-text">TeaShop</span>
      </RouterLink>

      <div :class="['nav_menu', { open: menuOpen }]">
        <RouterLink to="/" class="nav_link" @click="closeMenu">Home</RouterLink>
        <RouterLink to="/products" class="nav_link" @click="closeMenu">Products</RouterLink>
        <RouterLink to="/about" class="nav_link" @click="closeMenu">About</RouterLink>
      </div>

      <div class="nav_actions">
        <SearchBar />
        <router-link to="/wishlist" class="wishlist-link">
          <SvgIcon type="mdi" :path="mdiHeartCircleOutline" class="wishlist-icon" />
        </router-link>
        <RouterLink to="/cart" class="nav_cart">
          <SvgIcon type="mdi" :path="mdiCart" class="cart-icon" />
          <span v-if="cartCount > 0" class="cart-badge">{{ cartCount }}</span>
        </RouterLink>
      </div>

      <button class="nav_hamburger" @click="toggleMenu">
        <span></span>
        <span></span>
        <span></span>
      </button>
    </div>
  </nav>
</template>

<script>
import SvgIcon from '@jamescoyle/vue-icon';
import { mdiCart } from '@mdi/js';
import SearchBar from './SearchBar.vue';
import { mdiHeartCircleOutline } from '@mdi/js';
import { useWishlistStore } from '@/stores/wishlist';
import { useCartStore } from '@/stores/cart';

export default {
  name: 'TheNavigation',
  components: {
    SvgIcon,
    SearchBar
  },

  data() {
    return {
      menuOpen: false,
      mdiCart,
      mdiHeartCircleOutline
    };
  },
  computed: {
    wishlist() {
      return useWishlistStore()
    },
    cart() {
      return useCartStore();
    },
    cartCount() {
      return this.cart.items.reduce((sum, item) => sum + item.quantity, 0);
    }
  },
  methods: {
    toggleMenu() {
      this.menuOpen = !this.menuOpen;
    },
    closeMenu() {
      this.menuOpen = false;
    },
  },
}
</script>

<style scoped>
.nav {
  position: fixed;
  top: 0;
  width: 100%;
  background: rgba(244, 246, 243, 0.9);
  backdrop-filter: blur(10px);
  border-bottom: 1px solid #d7ddd6;
  z-index: 1000;
}

.nav_container {
  max-width: 1400px;
  margin: 0 auto;
  padding: 1rem 2rem;
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  align-items: center;
}

.nav_logo {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  text-decoration: none;
  color: #1f3d2b;
  font-weight: 700;
  font-size: 1.2rem;
}

.nav_menu {
  display: flex;
  gap: 2rem;
}

.nav_link {
  position: relative;
  text-decoration: none;
  color: #3b4a40;
  font-weight: 500;
}

.nav_link:hover {
  color: #1f3d2b;
}

.nav_link.router-link-active {
  color: #1f3d2b;
}

.nav_link.router-link-active::after {
  content: '';
  position: absolute;
  bottom: -4px;
  left: 50%;
  width: 60%;
  height: 2px;
  background: #1f3d2b;
  transform: translateX(-50%);
  border-radius: 2px;
}

.nav_cart {
  justify-self: end;
  text-decoration: none;
  padding: 0.4rem 0.5rem 0.2rem 0.5rem;
  border-radius: 20px;
  border: 1px solid #7c9c89;
  color: #1f3d2b;
  transition: background 0.3s;
}

.nav_cart svg {
  filter: drop-shadow(0 0 0 currentColor)
          drop-shadow(0 0 0 currentColor);
}

.nav_cart:hover {
  background: #e2ebe4;
}

.nav_hamburger {
  display: none;
  flex-direction: column;
  gap: 5px;
  background: none;
  border: none;
  cursor: pointer;
  justify-self: center;
}

.nav_hamburger span {
  width: 24px;
  height: 2px;
  background: #1f3d2b;
}

@media (max-width: 768px) {
  .nav_menu {
    position: fixed;
    top: 64px;
    left: 0;
    width: 100%;
    flex-direction: column;
    background: #f4f6f3;
    padding: 1.5rem 0;

    transform: translateY(-10px);
    opacity: 0;
    pointer-events: none;
    transition: all 0.35s cubic-bezier(0.4, 0, 0.2, 1);
  }

  .nav_menu.open {
    transform: translateY(0);
    opacity: 1;
    pointer-events: auto;
  }

  .nav_link {
    padding: 1rem;
    text-align: center;
    font-size: 1.1rem;
  }

  .nav_link.router-link-active::after {
    bottom: 6px;
    width: 40%;
  }

  .nav_hamburger {
    display: flex;
  }
}

.nav_actions {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  gap: 1rem;
}

.wishlist-icon {
  font-size: 1.6rem;
  width: 1.4em;
  height: 1.4em;
  cursor: pointer;
  color: #3b4a40;
  transition: transform 0.15s ease, color 0.15s ease;
}
</style>