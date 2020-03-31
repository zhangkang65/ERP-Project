package com.dy.common;/**
 * ClassName:DataGridView
 * Package:com.dy.common
 * Description:
 *
 * @Date:2020/3/17 10:05
 * @Author:Dong
 */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *ClassName:DataGridView
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DataGridView {
    private Long code=0L;
    private String msg="";
    private Long count;
    private Object data;
    public DataGridView(Long count, Object data) {
        super();
        this.count = count;
        this.data = data;
    }
    public DataGridView(Object data) {
        super();
        this.data = data;
    }
}
