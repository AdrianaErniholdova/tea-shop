import { defineStore } from 'pinia'
import { useUiStore } from './ui'

export const useProductsStore = defineStore('products', {
  state: () => ({
    products: [],
    loading: false,
    error: null,
    lastFetch: null
  }),

  getters: {
    getProductBySlug: (state) => (slug) => {
      return state.products.find(p => p.slug === slug)
    },

    getProductById: (state) => (id) => {
      return state.products.find(p => p.id === id)
    },

    uniqueTypes: (state) => {
      return [...new Set(state.products.map(p => p.typeName))].filter(Boolean)
    },

    uniqueCaffeineLevels: (state) => {
      return [...new Set(state.products.map(p => p.caffeineLevel))].filter(Boolean)
    },

    uniqueOrigins: (state) => {
      return [...new Set(state.products.map(p => p.originName))].filter(Boolean)
    },

    hasProducts: (state) => {
      return state.products.length > 0
    }
  },

  actions: {
    async fetchProducts(force = false) {
      if (this.products.length > 0 && !force) {
        return
      }

      if (this.loading) {
        return
      }

      this.loading = true
      this.error = null

      try {
        const res = await fetch('/api/products')
        
        if (!res.ok) {
          throw new Error('Failed to load products')
        }

        this.products = await res.json()
        this.lastFetch = Date.now()
        
      } catch (err) {
        console.error('Error fetching products:', err)
        this.error = 'Unable to load products. Please try again later.'
        
        const ui = useUiStore()
        ui.show(this.error, 'error')
        
      } finally {
        this.loading = false
      }
    },

    async refreshProducts() {
      await this.fetchProducts(true)
    },

    clear() {
      this.products = []
      this.loading = false
      this.error = null
      this.lastFetch = null
    }
  }
})