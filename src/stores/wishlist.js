import { defineStore } from 'pinia'

export const useWishlistStore = defineStore('wishlist', {
  state: () => ({
    items: []
  }),

  getters: {
    isInWishlist: (state) => (slug) =>
      state.items.some(item => item.slug === slug),
  },

  actions: {
    loadFromStorage() {
      const data = localStorage.getItem('wishlist')
      if (data) {
        this.items = JSON.parse(data)
      }
    },

    saveToStorage() {
      localStorage.setItem('wishlist', JSON.stringify(this.items))
    },

    toggle(product) {
      const exists = this.items.find(p => p.slug === product.slug)

      if (exists) {
        this.items = this.items.filter(p => p.slug !== product.slug)
      } else {
        this.items.push(product)
      }

      this.saveToStorage()
    },

    clear() {
      this.items = []
      localStorage.removeItem('wishlist')
    }
  }
})
