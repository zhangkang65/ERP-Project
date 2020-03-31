package com.dy.sys.service.impl;

import com.dy.sys.entity.LogLogin;
import com.dy.sys.mapper.LogLoginMapper;
import com.dy.sys.service.ILogLoginService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Doris
 * @since 2020-03-18
 */
@Service
@Transactional
public class LogLoginServiceImpl extends ServiceImpl<LogLoginMapper, LogLogin> implements ILogLoginService {

}
