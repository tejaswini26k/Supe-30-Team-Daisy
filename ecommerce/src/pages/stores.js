import React, { useState, useEffect } from "react";
import './stores.css';

export default function StoreSetup() {
  const [storeName, setStoreName] = useState("");
  const [slug, setSlug] = useState("");
  const [description, setDescription] = useState("");
  const [email, setEmail] = useState("");
  const [facebook, setFacebook] = useState("");
  const [instagram, setInstagram] = useState("");
  const [theme, setTheme] = useState("light");
  const [primaryColor, setPrimaryColor] = useState("#3b82f6");
  const [logo, setLogo] = useState(null);
  const [logoPreview, setLogoPreview] = useState(null);
  const [currency, setCurrency] = useState("USD");
  const [timezone, setTimezone] = useState("UTC");
  const [businessType, setBusinessType] = useState("Retail");

  // Auto-generate slug
  useEffect(() => {
    setSlug(storeName.trim().toLowerCase().replace(/\s+/g, "-"));
  }, [storeName]);

  const handleLogoChange = (e) => {
    const file = e.target.files[0];
    setLogo(file);
    if (file) {
      const reader = new FileReader();
      reader.onloadend = () => setLogoPreview(reader.result);
      reader.readAsDataURL(file);
    }
  };

  const handleSubmit = async (e) => {
  e.preventDefault();

  const formData = new FormData();
  formData.append('store_name', storeName);
  formData.append('slug', slug);
  formData.append('description', description);
  formData.append('store_email', email);
  formData.append('facebook', facebook);
  formData.append('instagram', instagram);
  formData.append('theme', theme);
  formData.append('primary_color', primaryColor);
  formData.append('currency', currency);
  formData.append('timezone', timezone);
  formData.append('business_type', businessType);
  formData.append('password', '123456'); // Replace with actual value or input field
  if (logo) {
    formData.append('logo', logo);
  }

  try {
    const res = await fetch('http://localhost:5000/api/stores', {
      method: 'POST',
      body: formData,
    });

    const result = await res.json();
    if (res.ok) {
      alert("✅ Store created successfully!");
      console.log("Server response:", result);
    } else {
      alert("❌ Failed to create store.");
      console.error(result);
    }
  } catch (err) {
    console.error("Error submitting form:", err);
    alert("An error occurred. Check console for details.");
  }
};


  return (
   <div className="store-setup-wrapper">
      <form
        onSubmit={handleSubmit}
        form className="store-form"

      >
        <h2 className="text-3xl font-bold text-center">🛍️ Store Setup</h2>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {/* Store Name */}
          <div>
            <label className="block font-medium mb-1">Store Name</label>
            <input
              type="text"
              value={storeName}
              onChange={(e) => setStoreName(e.target.value)}
              required
              className="w-full p-2 border rounded"
            />
          </div>

          {/* Slug */}
          <div>
            <label className="block font-medium mb-1">Store Slug (URL)</label>
            <input
              type="text"
              value={slug}
              readOnly
              className="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-blue-400 focus:outline-none"

            />
          </div>

          {/* Description */}
          <div className="md:col-span-2">
            <label className="block font-medium mb-1">Store Description</label>
            <textarea
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              rows="3"
              className="w-full p-2 border rounded"
              placeholder="What does your store sell?"
            />
          </div>

          {/* Contact Email */}
          <div>
            <label className="block font-medium mb-1">Contact Email</label>
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="w-full p-2 border rounded"
            />
          </div>

          {/* Business Type */}
          <div>
            <label className="block font-medium mb-1">Business Type</label>
            <select
              value={businessType}
              onChange={(e) => setBusinessType(e.target.value)}
              className="w-full p-2 border rounded"
            >
              <option>Retail</option>
              <option>Wholesale</option>
              <option>Digital Products</option>
              <option>Services</option>
              <option>Other</option>
            </select>
          </div>

          {/* Currency */}
          <div>
            <label className="block font-medium mb-1">Currency</label>
            <select
              value={currency}
              onChange={(e) => setCurrency(e.target.value)}
              className="w-full p-2 border rounded"
            >
              <option value="USD">USD</option>
              <option value="EUR">EUR</option>
              <option value="INR">INR</option>
              <option value="GBP">GBP</option>
            </select>
          </div>

          {/* Timezone */}
          <div>
            <label className="block font-medium mb-1">Time Zone</label>
            <select
              value={timezone}
              onChange={(e) => setTimezone(e.target.value)}
              className="w-full p-2 border rounded"
            >
              <option value="UTC">UTC</option>
              <option value="America/New_York">New York</option>
              <option value="Europe/London">London</option>
              <option value="Asia/Kolkata">India</option>
              <option value="Asia/Tokyo">Japan</option>
            </select>
          </div>

          {/* Social Links */}
          <div>
            <label className="block font-medium mb-1">Facebook URL</label>
            <input
              type="url"
              value={facebook}
              onChange={(e) => setFacebook(e.target.value)}
              className="w-full p-2 border rounded"
            />
          </div>
          <div>
            <label className="block font-medium mb-1">Instagram URL</label>
            <input
              type="url"
              value={instagram}
              onChange={(e) => setInstagram(e.target.value)}
              className="w-full p-2 border rounded"
            />
          </div>

          {/* Logo */}
          <div>
            <label className="block font-medium mb-1">Store Logo</label>
            <input type="file" accept="image/*" onChange={handleLogoChange} />
            {logoPreview && (
              <img
                src={logoPreview}
                alt="Logo Preview"
                className="mt-2 h-20 rounded"
              />
            )}
          </div>

          {/* Theme Selection */}
          <div>
            <label className="block font-medium mb-1">Theme</label>
            <select
              value={theme}
              onChange={(e) => setTheme(e.target.value)}
              className="w-full p-2 border rounded"
            >
              <option value="light">Light</option>
              <option value="dark">Dark</option>
            </select>
          </div>

          {/* Color Picker */}
          <div>
            <label className="block font-medium mb-1">Primary Color</label>
            <input
              type="color"
              value={primaryColor}
              onChange={(e) => setPrimaryColor(e.target.value)}
              className="w-16 h-10 p-0 border rounded cursor-pointer"
            />
          </div>

          {/* Theme Preview */}
          <div className="md:col-span-2 mt-4 border rounded p-4" style={{ backgroundColor: theme === "light" ? "#ffffff" : "#1f2937", color: theme === "light" ? "#000" : "#fff" }}>
            <p className="text-center text-lg font-semibold">Live Theme Preview</p>
            <div className="mt-4 flex items-center justify-center gap-4">
              {logoPreview && (
                <img src={logoPreview} alt="Preview" className="h-12 rounded shadow" />
              )}
              <span style={{ color: primaryColor }}>{storeName || "Store Name"}</span>
            </div>
          </div>
        </div>

        {/* Submit Button */}
        <button type="submit" className="submit-btn">
  ✅ Save Store Setup
</button>

      </form>
    </div>
  );
}
