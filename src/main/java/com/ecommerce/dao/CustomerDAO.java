package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.Customer;

public interface CustomerDAO {

    void saveCustomer(Customer customer);

    List<Customer> getAllCustomers();

    Customer getCustomerById(int id);

    void updateCustomer(Customer customer);

    void deleteCustomer(int id);

List<Customer> searchCustomers(Integer id, String email, String phone);



}