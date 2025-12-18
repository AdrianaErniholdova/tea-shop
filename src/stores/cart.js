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
    addToCart(product) {
      const existingItem = this.items.find(item => item.slug === product.slug)

      if (existingItem) {
        existingItem.quantity += 1
      } else {
        this.items.push({ ...product, quantity: 1 })
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