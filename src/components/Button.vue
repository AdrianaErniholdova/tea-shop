<template>
  <button class="btn" :class="`btn--${variant}`">
    <slot />
  </button>
</template>

<script>
export default {
  name: 'BaseButton',
  props: {
    variant: {
      type: String,
      default: 'primary',
    },
  },
};
</script>

<style scoped>
.btn {
  padding: 0.65rem 1.6rem;
  border-radius: 999px;
  font-size: 0.9rem;
  font-weight: 500;
  cursor: pointer;
  border: 1px solid transparent;
  transition: all 0.3s ease;
}

.primary {
  background: #8a9d85;
  color: white;
}

.primary:hover {
  background: #7a8d75;
}

.outline {
  background: transparent;
  border: 1px solid #8a9d85;
  color: #8a9d85;
}

.outline:hover {
  background: rgb(138, 157, 133);
}
</style>