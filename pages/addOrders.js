import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import '../css/add-order.css';

const AddOrder = () => {
  const [customerId, setCustomerId] = useState('');
  const [totalAmount, setTotalAmount] = useState('');
  const [status, setStatus] = useState('Pending');
  const [customers, setCustomers] = useState([]);
  const navigate = useNavigate();

  // Fetch customers from backend
  useEffect(() => {
    const fetchCustomers = async () => {
      try {
        const res = await axios.get('http://localhost:5000/api/customers');
        setCustomers(res.data);
      } catch (err) {
        console.error('Failed to fetch customers:', err);
        alert('Unable to load customers');
      }
    };
    fetchCustomers();
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();

    const payload = {
      customer_id: Number(customerId),
      total_amount: Number(totalAmount),
      status
    };

    console.log("📦 Submitting Order:", payload);

    try {
      const token = localStorage.getItem('token');
      await axios.post('http://localhost:5000/api/orders', payload, {
        headers: { Authorization: `Bearer ${token}` }
      });

      alert('✅ Order added successfully');
      navigate('/orders');
    } catch (error) {
      console.error("❌ Order Submit Failed:", error);
      alert('Error adding order: ' + (error.response?.data?.error || error.message));
    }
  };

  return (
    <div className="add-order-page">
      <div className="add-order-card">
        <h1>Add New Order</h1>
        <form onSubmit={handleSubmit} className="order-form">
          <label>Customer:</label>
          <select
            value={customerId}
            onChange={e => setCustomerId(e.target.value)}
            required
          >
            <option value="">-- Select Customer --</option>
            {customers.map((customer) => (
              <option key={customer.customer_id} value={customer.customer_id}>
                {customer.customer_name} (ID: {customer.customer_id})
              </option>
            ))}
          </select>

          <label>Total Amount:</label>
          <input
            type="number"
            value={totalAmount}
            onChange={e => setTotalAmount(e.target.value)}
            required
          />

          <label>Status:</label>
          <select value={status} onChange={e => setStatus(e.target.value)}>
            <option value="Pending">Pending</option>
            <option value="Processing">Processing</option>
            <option value="Shipped">Shipped</option>
            <option value="Delivered">Delivered</option>
            <option value="Cancelled">Cancelled</option>
          </select>

          <button type="submit" className="add-order-btn">Submit</button>
        </form>
      </div>
    </div>
  );
};

export default AddOrder;
