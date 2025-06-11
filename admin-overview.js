import React, { useState } from 'react';
import './admin-overview.css';
import AdminProducts from './admin-products';
import AdminCustomers from './admin-customers'; // ✅ Corrected import
import AdminOrders from './orders';

const menuItems = [
  'Overview',
  'Statistics',
  'Customers',
  'Products',
  'Feedback',
  'Orders',
  'Store'
];

const AdminOverview = () => {
  const [activeTab, setActiveTab] = useState('Overview');

  return (
    <div className="admin-container">
      {/* Sidebar */}
      <aside className="sidebar">
        <h2 className="sidebar-title">Website-Name</h2>
        <nav className="sidebar-menu">
          {menuItems.map(item => (
            <a
              key={item}
              href="#"
              className={`sidebar-link ${activeTab === item ? 'active' : ''}`}
              onClick={() => setActiveTab(item)}
            >
              {item}
            </a>
          ))}
        </nav>
      </aside>

      {/* Main Content */}
      <main className="admin-main">
        {activeTab === 'Products' ? (
          <AdminProducts />
        ) : activeTab === 'Customers' ? (
          <AdminCustomers />
        ) :  activeTab === 'Orders' ? (
          <AdminOrders />
          
        ) : (
          <>
            <h1>{activeTab}</h1>
            <p>You selected the "{activeTab}" section.</p>
          </>

        )}
        

      </main>
    </div>
  );
};

export default AdminOverview;
