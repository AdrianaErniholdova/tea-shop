import { defineStore } from 'pinia'

export const useUiStore = defineStore('ui', {
  state: () => ({
    message: '',
    type: '',
    visible: false,
    timeoutId: null,
  }),

  actions: {
    show(message, type = 'info', duration = 3000) {
      this.message = message
      this.type = type
      this.visible = true

      if (this.timeoutId) {
        clearTimeout(this.timeoutId)
      }

      this.timeoutId = setTimeout(() => {
        this.hide()
      }, duration)
    },

    hide() {
      this.visible = false
      this.message = ''
      this.type = ''
    }
  }
})
