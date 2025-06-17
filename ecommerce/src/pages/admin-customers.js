import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './admin-customers.css'; // You’ll update styles here

import { useNavigate } from 'react-router-dom';



const AdminCustomers = () => {
  const [customers, setCustomers] = useState([]);
  const [selected, setSelected] = useState([]);

  useEffect(() => {
    fetchCustomers();
  }, []);

  const fetchCustomers = () => {
    axios.get('http://localhost:5000/api/customers')
      .then(res => setCustomers(res.data))
      .catch(err => console.error('Error fetching customers:', err));
  };

  const handleCheckboxChange = (id) => {
    setSelected(prev =>
      prev.includes(id) ? prev.filter(cid => cid !== id) : [...prev, id]
    );
  };

  const handleDelete = () => {
    if (window.confirm('Are you sure you want to delete selected customers?')) {
      axios
        .post('http://localhost:5000/api/customers/delete', { ids: selected })
        .then(() => {
          fetchCustomers();
          setSelected([]);
        })
        .catch(err => console.error('Delete failed:', err));
    }
  };

  const navigate = useNavigate();
  return (
    <div className="admin-customers">
      <div className="header">
        <h1>Customers</h1>
        <div className="controls">
          {selected.length > 0 && (
            <button className="btn delete" onClick={handleDelete}>
              Delete ({selected.length})
            </button>
          )}
          <button className="btn">Filter</button>
          <button className="btn primary" onClick={() => navigate('/addcustomer')}>+ Add new customer</button>
        </div>
      </div>

      <div className="customer-table">
        <table>
          <thead>
            <tr>
              <th><input type="checkbox" disabled /></th>
              <th>Name</th>
              <th>No. of Orders</th>
              <th>Amount Spent</th>
              <th>Date Joined</th>
              <th>Phone Number</th>
            </tr>
          </thead>
          <tbody>
            {customers.map(c => (
              <tr key={c.customer_id}>
                <td>
                  <input
                    type="checkbox"
                    checked={selected.includes(c.customer_id)}
                    onChange={() => handleCheckboxChange(c.customer_id)}
                  />
                </td>
                <td>{c.customer_name}</td>
                <td>{c.no_of_orders}</td>
                <td>₹ {c.amount_spent.toLocaleString()}</td>
                <td>{new Date(c.date_joined).toLocaleDateString()}</td>
                <td>{c.phone_number}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default AdminCustomers;
