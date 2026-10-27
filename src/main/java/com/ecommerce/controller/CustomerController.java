package com.ecommerce.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ecommerce.model.Customer;
import com.ecommerce.service.CustomerService;
import com.ecommerce.service.CustomerServiceImpl;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    private CustomerService customerService =
            new CustomerServiceImpl();

    @GetMapping("/list")
    public String listCustomers(Model model) {

        List<Customer> customers =
                customerService.getAllCustomers();

        model.addAttribute("customers", customers);

        return "customer-list";
    }

@GetMapping("/search")
public String searchCustomers(
		@RequestParam(name = "id", required = false) Integer id,
		@RequestParam(name = "email", required = false) String email,
		@RequestParam(name = "phone", required = false) String phone,
        Model model) {

    List<Customer> customers =
            customerService.searchCustomers(id, email, phone);

    model.addAttribute("customers", customers);
    model.addAttribute("searchId", id);
    model.addAttribute("searchEmail", email);
    model.addAttribute("searchPhone", phone);

    return "customer-list";
}

@GetMapping("/register")
public String showRegistrationForm() {
    return "customer-register";
}

@GetMapping("/edit")
public String showEditForm(@RequestParam("id") int id, Model model) {
    Customer customer = customerService.getCustomerById(id);
    model.addAttribute("customer", customer);
    return "customer-edit";
}

@PostMapping("/register")
public String registerCustomer(
        @ModelAttribute Customer customer,
        RedirectAttributes redirectAttributes) {

    customerService.saveCustomer(customer);
    redirectAttributes.addFlashAttribute(
        "successMessage", "Customer registered successfully!");

    return "redirect:/customer/list";
}

@PostMapping("/update")
public String updateCustomer(
        @ModelAttribute Customer customer,
        RedirectAttributes redirectAttributes) {

    customerService.updateCustomer(customer);

    redirectAttributes.addFlashAttribute(
        "successMessage", "Customer updated successfully!");

    return "redirect:/customer/list";
}


@PostMapping("/delete")
public String deleteCustomer(
        @RequestParam("id") int id,
        RedirectAttributes redirectAttributes) {

    customerService.deleteCustomer(id);

    redirectAttributes.addFlashAttribute(
        "successMessage", "Customer deleted successfully!");

    return "redirect:/customer/list";
}


}