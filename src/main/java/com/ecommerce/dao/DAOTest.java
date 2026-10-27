package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.Customer;

public class DAOTest {

    public static void main(String[] args) {

        CustomerDAO customerDAO = new CustomerDAOImpl();

        // Test: Get all customers
        List<Customer> customers = customerDAO.getAllCustomers();

        System.out.println("Total Customers: " + customers.size());

        for (Customer customer : customers) {
            System.out.println(
                customer.getId() + " | "
                + customer.getName() + " | "
                + customer.getEmail() + " | "
                + customer.getPhone() + " | "
                + customer.getCity()
            );
        }
    }
}