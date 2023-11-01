import { createRouter, createWebHistory } from 'vue-router'

import HomeView from '../views/HomeView.vue'

export const routes = [
  {
    path: '/',
    component: () => import('@/layouts/MainLayout.vue'),
    children: [
      {
        path: '/',
        name: 'home',
        component: HomeView
      },
      {
        path: '/about',
        name: 'about',
        // route level code-splitting
        // this generates a separate chunk (About.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import('../views/AboutView.vue')
      }
    ]
  }
]

export const router = createRouter({
  history: createWebHistory(`${import.meta.env.BASE_URL}`),
  routes: routes
})
