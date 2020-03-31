package com.dy.sys.utils;/**
 * ClassName:TreeNode
 * Package:com.dy.sys.utils
 * Description:
 *
 * @Date:2020/3/17 15:36
 * @Author:Dong
 */

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *ClassName:TreeNode
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TreeNode implements Serializable {
    private Integer id;
    private String title;
    private String icon;
    private String href;
    private Boolean spread;
    @JsonProperty("parentId")
    private Integer pid;
    /**
     * 初始化复选树时选中状况 0未选中,1选中
     */
    private String checkArr ="0";

    /**
     * 标记原本的选中状态,0为原本没有此权限选中,1为原本有此权限
     */
    private String checked="0";
    private List<TreeNode> children = new ArrayList<>();
}
