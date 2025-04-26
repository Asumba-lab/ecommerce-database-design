-- Create database
CREATE DATABASE ecommerce;
USE ecommerce;

-- Brand table
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL,
    description TEXT,
    logo_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Product category table
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    parent_category_id INT,
    description TEXT,
    image_url VARCHAR(255),
    FOREIGN KEY (parent_category_id) REFERENCES product_category(category_id) ON DELETE SET NULL
);

-- Size category table
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Size option table
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT NOT NULL,
    size_value VARCHAR(20) NOT NULL,
    description VARCHAR(100),
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Color table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL,
    hex_code VARCHAR(7)
);

-- Product table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    base_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Product variation table
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    variation_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Product item table
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    sku VARCHAR(50) UNIQUE NOT NULL,
    price DECIMAL(10,2),
    quantity_in_stock INT NOT NULL DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Product item variation table
CREATE TABLE product_item_variation (
    item_variation_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    variation_id INT NOT NULL,
    size_option_id INT,
    color_id INT,
    custom_value VARCHAR(100),
    FOREIGN KEY (item_id) REFERENCES product_item(item_id),
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);

-- Attribute category table
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Attribute type table
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(20) NOT NULL
);

-- Product attribute table
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    attribute_category_id INT NOT NULL,
    attribute_type_id INT NOT NULL,
    attribute_name VARCHAR(100) NOT NULL,
    attribute_value TEXT NOT NULL,
    display_order INT DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

-- Product image table
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    item_id INT,
    image_url VARCHAR(255) NOT NULL,
    alt_text VARCHAR(255),
    display_order INT DEFAULT 0,
    is_primary BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (item_id) REFERENCES product_item(item_id)
);