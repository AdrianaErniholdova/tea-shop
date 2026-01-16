import { defineStore } from 'pinia'

export const useOrderStore = defineStore('order', {
  state: () => ({
    orderCompleted: false, 
  }),
  actions: {
    completeOrder() {
      this.orderCompleted = true
    },
    resetOrder() {
      this.orderCompleted = false
    },
  },
})
