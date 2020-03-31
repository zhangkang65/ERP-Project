package com.dy.bus.service.impl;

import com.dy.bus.entity.Customer;
import com.dy.bus.mapper.CustomerMapper;
import com.dy.bus.service.ICustomerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Doris
 * @since 2020-03-22
 */
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements ICustomerService {

}
