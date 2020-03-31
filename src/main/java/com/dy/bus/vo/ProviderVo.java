package com.dy.bus.vo;/**
 * ClassName:CustomerVo
 * Package:com.dy.bus.vo
 * Description:
 *
 * @Date:2020/3/22 17:21
 * @Author:Dong
 */

import com.dy.bus.entity.Customer;
import com.dy.bus.entity.Provider;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *ClassName:CustomerVo
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProviderVo extends Provider {
    private Integer page;
    private Integer limit;
}
