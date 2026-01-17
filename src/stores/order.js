import { defineStore } from 'pinia'
import { useCartStore } from './cart'
import { useUiStore } from './ui'

export const useOrderStore = defineStore('order', {
  state: () => ({
    orderCompleted: false,
    lastOrderId: null,
    loading: false,
    error: null 
  }),
  actions: {
    completeOrder() {
      this.orderCompleted = true
    },
    resetOrder() {
      this.orderCompleted = false
      this.lastOrderId = null
      this.error = null
    },
    async createOrder(customerName, customerEmail) {
      const cart = useCartStore()
      const ui = useUiStore()

      this.loading = true
      this.error = null

      const payload = {
        customerName,
        customerEmail,
        items: cart.items.map(item => ({
          teaId: item.id,
          quantity: item.quantity,
          price: item.price
        })),
        total: cart.totalPrice
      }

      try {
        const res = await fetch('/api/orders', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(payload)
        })

        if (!res.ok) {
          throw new Error('Failed to create order')
        }

        const data = await res.json()
        
        this.lastOrderId = data.orderId
        this.completeOrder()
        
        cart.clearCart()
        
        return { 
          success: true, 
          orderId: data.orderId 
        }

      } catch (err) {
        console.error('Order creation failed:', err)
        this.error = 'Failed to place order. Please try again.'
        ui.show(this.error, 'error')
        
        return { success: false }

      } finally {
        this.loading = false
      }
    },
  },
})
