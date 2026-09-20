import { useState } from 'react'
import heroImg from './assets/hero.png'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import './App.css'
import Header from './components/Header'
import Hero from './components/Hero'

function App() {
  return (
    <div>
      <Header />
      <Hero />
    </div>
  )
}

export default App
