package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.util.DBConnection;
import com.ecommerce.model.Customer;

public class CustomerDAOImpl implements CustomerDAO {

	@Override
	public void saveCustomer(Customer customer) {
		 String sql = "INSERT INTO customer "
	                + "(name, email, phone, city, salary, address, dob) "
	                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement statement = connection.prepareStatement(sql)) {

	            statement.setString(1, customer.getName());
	            statement.setString(2, customer.getEmail());
	            statement.setString(3, customer.getPhone());
	            statement.setString(4, customer.getCity());
	            statement.setDouble(5, customer.getSalary());
	            statement.setString(6, customer.getAddress());

	            if (customer.getDob() != null) {
	                statement.setDate(
	                    7,
	                    java.sql.Date.valueOf(customer.getDob())
	                );
	            } else {
	                statement.setDate(7, null);
	            }

	            statement.executeUpdate();

	            System.out.println("Customer saved successfully!");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

		
	@Override
	public List<Customer> getAllCustomers() {

	    List<Customer> customers = new ArrayList<>();

	    String sql = "SELECT * FROM customer";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(sql);
	         ResultSet resultSet = statement.executeQuery()) {

	        while (resultSet.next()) {

	            Customer customer = new Customer();

	            customer.setId(resultSet.getInt("id"));
	            customer.setName(resultSet.getString("name"));
	            customer.setEmail(resultSet.getString("email"));
	            customer.setPhone(resultSet.getString("phone"));
	            customer.setCity(resultSet.getString("city"));
	            customer.setSalary(resultSet.getDouble("salary"));
	            customer.setAddress(resultSet.getString("address"));

	            if (resultSet.getDate("dob") != null) {
	                customer.setDob(
	                    resultSet.getDate("dob").toLocalDate()
	                );
	            }

	            customers.add(customer);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return customers;
	}

	
	@Override
	public Customer getCustomerById(int id) {

	    Customer customer = null;

	    String sql = "SELECT * FROM customer WHERE id = ?";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(sql)) {

	        statement.setInt(1, id);

	        try (ResultSet resultSet = statement.executeQuery()) {

	            if (resultSet.next()) {

	                customer = new Customer();

	                customer.setId(resultSet.getInt("id"));
	                customer.setName(resultSet.getString("name"));
	                customer.setEmail(resultSet.getString("email"));
	                customer.setPhone(resultSet.getString("phone"));
	                customer.setCity(resultSet.getString("city"));
	                customer.setSalary(resultSet.getDouble("salary"));
	                customer.setAddress(resultSet.getString("address"));

	                if (resultSet.getDate("dob") != null) {
	                    customer.setDob(
	                        resultSet.getDate("dob").toLocalDate()
	                    );
	                }
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return customer;
	}
	

	@Override
	public void updateCustomer(Customer customer) {

	    String sql = "UPDATE customer SET "
	            + "name = ?, "
	            + "email = ?, "
	            + "phone = ?, "
	            + "city = ?, "
	            + "salary = ?, "
	            + "address = ?, "
	            + "dob = ? "
	            + "WHERE id = ?";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(sql)) {

	        statement.setString(1, customer.getName());
	        statement.setString(2, customer.getEmail());
	        statement.setString(3, customer.getPhone());
	        statement.setString(4, customer.getCity());
	        statement.setDouble(5, customer.getSalary());
	        statement.setString(6, customer.getAddress());

	        if (customer.getDob() != null) {
	            statement.setDate(
	                7,
	                java.sql.Date.valueOf(customer.getDob())
	            );
	        } else {
	            statement.setDate(7, null);
	        }

	        statement.setInt(8, customer.getId());

	        statement.executeUpdate();

	        System.out.println("Customer updated successfully!");

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public void deleteCustomer(int id) {

	    String sql = "DELETE FROM customer WHERE id = ?";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(sql)) {

	        statement.setInt(1, id);

	        statement.executeUpdate();

	        System.out.println("Customer deleted successfully!");

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

@Override
public List<Customer> searchCustomers(Integer id, String email, String phone) {

    List<Customer> customers = new ArrayList<>();

    StringBuilder sql = new StringBuilder(
        "SELECT * FROM customer WHERE 1=1"
    );

    if (id != null) {
        sql.append(" AND id = ?");
    }
    if (email != null && !email.trim().isEmpty()) {
        sql.append(" AND email LIKE ?");
    }
    if (phone != null && !phone.trim().isEmpty()) {
        sql.append(" AND phone LIKE ?");
    }

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql.toString())) {

        int index = 1;

        if (id != null) {
            ps.setInt(index++, id);
        }
        if (email != null && !email.trim().isEmpty()) {
            ps.setString(index++, "%" + email.trim() + "%");
        }
        if (phone != null && !phone.trim().isEmpty()) {
            ps.setString(index++, "%" + phone.trim() + "%");
        }

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Customer customer = new Customer();

                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                customer.setCity(rs.getString("city"));
                customer.setSalary(rs.getDouble("salary"));
                customer.setAddress(rs.getString("address"));

                java.sql.Date dob = rs.getDate("dob");
                if (dob != null) {
                    customer.setDob(dob.toLocalDate());
                }

                customers.add(customer);
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return customers;
}
	
}
