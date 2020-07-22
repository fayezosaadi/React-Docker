import React from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <span role="img" aria-label=''>
          React application developed and deployed with Docker 🐳
        </span>
      </header>
    </div>
  );
}

export default App;
