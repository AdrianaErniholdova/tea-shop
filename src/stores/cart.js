import { defineStore } from 'pinia';

export const useCartStore = defineStore('cart', {
  state: () => ({
    items: [],
  }),

  getters: {
    totalItems: (state) =>
      state.items.reduce((sum, item) => sum + item.quantity, 0),

    totalPrice: (state) =>
      state.items.reduce((sum, item) => sum + item.price * item.quantity, 0),
  },

  actions: {
    addToCart(product, quantity = 1) {
      if (product.stock === 0) return;

      const existingItem = this.items.find(item => item.slug === product.slug)

      if (existingItem) {
        const newQty = existingItem.quantity + quantity
        existingItem.quantity = Math.min(newQty, product.stock)
      } else {
        this.items.push({ ...product, quantity: Math.min(quantity, product.stock) })
      }

      this.saveToStorage()
    },

    setQuantity(slug, quantity) {
      const item = this.items.find(i => i.slug === slug)
      if (!item) return

      const qty = Number(quantity)

      if (qty < 1) {
        this.removeFromCart(slug)
      } else {
        item.quantity = Math.min(qty, item.stock)
      }

      this.saveToStorage()
    },

    removeFromCart(slug) {
      this.items = this.items.filter(item => item.slug !== slug)
      this.saveToStorage()
    },

    loadFromLocalStorage() {
      const storedCart = localStorage.getItem('cart')
      if (storedCart) {
        this.items = JSON.parse(storedCart)
      }
    },

    saveToStorage() {
      localStorage.setItem('cart', JSON.stringify(this.items))
    },

    clearCart() {
      this.items = []
      localStorage.removeItem('cart')
    }
  }
})