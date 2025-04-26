# E-commerce Database Design

![ERD Diagram](docs/erd.png) *(replace with your actual ERD image)*

## 📌 Project Overview
This repository contains the complete database design for an e-commerce platform, including:
- Entity-Relationship Diagram (ERD)
- SQL schema creation scripts
- Sample data (optional)
- Documentation of design decisions

## 🛒 Database Features
- **Product Management**: Products with brands, categories, and variations
- **Inventory System**: Track SKUs with specific variations (size, color)
- **Attribute System**: Flexible product specifications and details
- **Media Management**: Product images with ordering and variation-specific images

## 🏗️ Database Schema

### Core Tables
- `brand` - Product manufacturers
- `product_category` - Product classification hierarchy
- `product` - Main product information

### Variation System
- `size_category` - Groups size types (clothing, shoes)
- `size_option` - Specific size values (S, M, L)
- `color` - Available color options
- `product_variation` - Links products to their variations
- `product_item` - Purchasable SKUs with inventory
- `product_item_variation` - Maps items to specific variations

### Attributes & Media
- `attribute_category` - Groups attributes
- `attribute_type` - Data types for attributes
- `product_attribute` - Custom product specifications
- `product_image` - Product visuals with ordering

## 🚀 Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/ecommerce-database.git
   cd ecommerce-database