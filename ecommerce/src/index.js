import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';

import { BrowserRouter, Routes, Route } from 'react-router-dom';

import reportWebVitals from './reportWebVitals';
import StoreSetup from './pages/stores';
 // or wherever it's located

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <BrowserRouter>
      <Routes>
      <Route path="/stores" element={<StoreSetup />} />
        
        {/* <Route path="/" element={<AdminOverview />} /> */}
        
      </Routes>
    </BrowserRouter>
  </React.StrictMode>
);

reportWebVitals();
