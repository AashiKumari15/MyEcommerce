package com.ecommerce.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ecommerce.model.Product;
import com.ecommerce.service.ProductService;
import com.ecommerce.service.ProductServiceImpl;

@Controller
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService =
            new ProductServiceImpl();

    @GetMapping("/list")
    public String listProducts(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "product-list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("product", new Product());
        return "product-form";
    }

    @PostMapping("/save")
    public String saveProduct(
            @ModelAttribute Product product,
            RedirectAttributes redirectAttributes) {

        productService.saveProduct(product);

        redirectAttributes.addFlashAttribute(
                "successMessage", "Product added successfully!");

        return "redirect:/product/list";
    }

    @GetMapping("/edit")
    public String showEditForm(
            @RequestParam(name = "id") int id,
            Model model) {

        Product product = productService.getProductById(id);

        if (product == null) {
            return "redirect:/product/list";
        }

        model.addAttribute("product", product);
        return "product-form";
    }

    @PostMapping("/update")
    public String updateProduct(
            @ModelAttribute Product product,
            RedirectAttributes redirectAttributes) {

        productService.updateProduct(product);

        redirectAttributes.addFlashAttribute(
                "successMessage", "Product updated successfully!");

        return "redirect:/product/list";
    }

    @PostMapping("/delete")
    public String deleteProduct(
            @RequestParam(name = "id") int id,
            RedirectAttributes redirectAttributes) {

        productService.deleteProduct(id);

        redirectAttributes.addFlashAttribute(
                "successMessage", "Product deleted successfully!");

        return "redirect:/product/list";
    }
}
