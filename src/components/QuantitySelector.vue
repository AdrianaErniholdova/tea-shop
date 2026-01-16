<template>
  <div class="quantity_selector">
    <button class="qty_btn" @click="decrement" :disabled="modelValue <= min" aria-label="Decrease quantity">
      −
    </button>

    <span class="qty_value">{{ modelValue }}</span>

    <button class="qty_btn" @click="increment" :disabled="modelValue >= max" aria-label="Increase quantity">
      +
    </button>
  </div>
</template>

<script>
export default {
  name: 'QuantitySelector',
  props: {
    modelValue: {
      type: Number,
      required: true,
    },
    min: {
      type: Number,
      default: 1,
    },
    max: {
      type: Number,
      default: 99,
    },
  },
  emits: ['update:modelValue'],
  methods: {
    increment() {
      if (this.modelValue < this.max) {
        this.$emit('update:modelValue', this.modelValue + 1)
      }
    },
    decrement() {
      if (this.modelValue > this.min) {
        this.$emit('update:modelValue', this.modelValue - 1)
      }
    },
  },
}
</script>

<style scoped>
.quantity_selector {
  display: inline-flex;
  align-items: center;
  gap: 0.75rem;
  padding: 0.4rem 0.6rem;
  border: 1px solid #d6ddd6;
  border-radius: 999px;
  background-color: #f9faf9;
}

.qty_btn {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  border: none;
  background-color: #2d3a2e;
  color: #ffffff;
  font-size: 1.2rem;
  font-weight: 500;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background-color 0.25s ease, transform 0.15s ease;
}

.qty_btn:hover:not(:disabled) {
  background-color: #3f5241;
  transform: scale(1.05);
}

.qty_btn:disabled {
  background-color: #c7cec7;
  cursor: not-allowed;
}

.qty_value {
  min-width: 24px;
  text-align: center;
  font-size: 1rem;
  font-weight: 600;
  color: #2d3a2e;
}
</style>