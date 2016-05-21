package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.dao.CustomerDao;
import com.imlewis.dailyshop.model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Collection;

public class UserDetailsServiceImp implements UserDetailsService{

    @Autowired
    private CustomerDao customerDao;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Customer customer = customerDao.getCustomerByUsername(username);

        if (customer.getUsername() == null) {
            throw new UsernameNotFoundException("UsernameNotFoundException.");
        }

        Collection<? extends GrantedAuthority> authorities = AuthorityUtils.createAuthorityList(customer.getAuthority());
        return new org.springframework.security.core.userdetails.User(customer.getUsername(), customer.getPassword(), authorities);
    }
}
