package com.ecommerce.service;

import java.util.List;

import com.ecommerce.dao.CustomerDAO;
import com.ecommerce.dao.CustomerDAOImpl;
import com.ecommerce.model.Customer;

public class CustomerServiceImpl implements CustomerService {

    private CustomerDAO customerDAO = new CustomerDAOImpl();

    @Override
    public void saveCustomer(Customer customer) {
        customerDAO.saveCustomer(customer);
    }

    @Override
    public List<Customer> getAllCustomers() {
        return customerDAO.getAllCustomers();
    }

    @Override
    public Customer getCustomerById(int id) {
        return customerDAO.getCustomerById(id);
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerDAO.updateCustomer(customer);
    }

    @Override
    public void deleteCustomer(int id) {
        customerDAO.deleteCustomer(id);
    }

@Override
public List<Customer> searchCustomers(Integer id, String email, String phone) {
    return customerDAO.searchCustomers(id, email, phone);
}

}