<template>
  <nav class="nav">
    <RouterLink to="/" class="nav__link">Home</RouterLink>
    <RouterLink to="/products" class="nav__link">Products</RouterLink>
    <RouterLink to="/about" class="nav__link">About</RouterLink>
    <RouterLink to="/cart" class="nav__cart"> 
      <span class="nav__cart-icon">🛒</span>
      <span class="nav__cart-text">Cart</span>
    </RouterLink>
  </nav>
</template>

<script>
export default {
  name: 'TheNavigation',
};
</script>