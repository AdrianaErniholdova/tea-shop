<template>
  <transition name="fade-slide">
    <div v-if="ui.visible" class="alert" :class="ui.type">
      {{ ui.message }}
    </div>
  </transition>
</template>

<script>
import { useUiStore } from '@/stores/ui'

export default {
  name: 'BaseAlert',
  data() {
    return {
      ui: useUiStore()
    }
  }
}
</script>

<style scoped>
.alert {
  position: fixed;
  top: 2rem;
  right: 2rem;
  padding: 1rem 1.5rem;
  border-radius: 8px;
  font-weight: 500;
  color: white;
  box-shadow: 0 10px 30px rgba(0,0,0,0.15);
  z-index: 1000;
}

.success {
  background: #4b8f5d;
}

.error {
  background: #c0392b;
}

.info {
  background: #dbcd34;
}

.fade-slide-enter-active,
.fade-slide-leave-active {
  transition: all 0.3s ease;
}

.fade-slide-enter-from,
.fade-slide-leave-to {
  opacity: 0;
  transform: translateY(10px);
}
</style>
