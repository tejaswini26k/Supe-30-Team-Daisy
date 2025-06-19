import React from 'react';
import { Routes, Route } from 'react-router-dom';

import store from './pages/stores.js';



function App() {
  return (
    <Routes>
      
      <Route path="/store" element={<store />} />
      
    </Routes>
  );
}

export default App;
