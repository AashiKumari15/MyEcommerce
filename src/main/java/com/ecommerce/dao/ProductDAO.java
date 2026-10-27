
package com.ecommerce.dao;

import java.util.List;
import com.ecommerce.model.Product;

public interface ProductDAO {

    void saveProduct(Product product);

    List<Product> getAllProducts();

    Product getProductById(int id);

    void updateProduct(Product product);

    void deleteProduct(int id);
}
