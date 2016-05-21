package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.CustomerOrderItem;

import java.util.List;

/**
 * Created by lewis on 5/7/2016.
 */
public interface OrderItemDao {

    void addOrderItem(CustomerOrderItem customerOrderItem);

    void deleteOrderItem(CustomerOrderItem customerOrderItem);

    List<CustomerOrderItem> getAllOrderItemByOrderId(int orderId);

}
