<template>
  <component :is="tag" class="btn" :class="`btn--${variant}`" v-bind="$attrs">
    <slot />
  </component>
</template>

<script>
export default {
  name: 'BaseButton',
  props: {
    variant: {
      type: String,
      default: 'primary',
    },
    tag: { type: String, 
      default: 'button' 
    },
  },
};
</script>

<style>
.btn,
.btn--primary {
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
  font-family: var(--font-sans);
  font-size: 16px;
}

.btn--primary {
  background: #405d1c;
  color: white;
  padding: 0.9rem 2rem;
  border-radius: 12px;
  font-weight: 600;
  transition: all 0.3s ease;
  box-shadow: 0 4px 12px rgba(138, 157, 133, 0.25);
}

.btn--primary:hover {
  background: #6d7e0e;
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(138, 157, 133, 0.35);
  color: white;
}

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
</style>
