
package com.ecommerce.service;

import java.util.List;
import com.ecommerce.model.Product;

public interface ProductService {

    void saveProduct(Product product);

    List<Product> getAllProducts();

    Product getProductById(int id);

    void updateProduct(Product product);

    void deleteProduct(int id);
}
