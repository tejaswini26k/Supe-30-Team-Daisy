import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Home from './pages/Home';
import Login from "./pages/login";
import SignUp from "./pages/signup";
import AdminOverview from './pages/admin-overview';
import AddOrder from './pages/addOrders';
import AddCustomer from './pages/addCustomer';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <BrowserRouter>
      <Routes>
      <Route path="/" element={<Home />} />
        <Route path="/login" element={<Login />} />
        <Route path="/signup" element={<SignUp />} />
        {/* <Route path="/" element={<AdminOverview />} /> */}
        <Route path="/addorder" element={<AddOrder />} />
        <Route path="/addcustomer" element={<AddCustomer />} />
        <Route path="/AdminOverview" element={<AdminOverview />} />
      </Routes>
    </BrowserRouter>
  </React.StrictMode>
);

reportWebVitals();
