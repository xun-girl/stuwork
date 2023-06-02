package cn.jia.common.controller;

import cn.jia.common.ServerResponse;
import cn.jia.dto.QuestTypeDTO;
import cn.jia.mapper.QuestTypeMapper;
import cn.jia.service.QuestTypeService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * 管理员控制器
 */
@Controller
@RequestMapping("/questtype")
public class QuestTypeController {

	@Autowired
	private QuestTypeMapper questtypeMapper;

    @Autowired
    private QuestTypeService questtypeService;

	// 展现简历
	@RequiresRoles("admin")
	@PostMapping("/add")
    @ResponseBody
	public ServerResponse add(QuestTypeDTO dto) {
		try {
			dto.setCreateTime(new Date());
			questtypeMapper.insertSelective(dto);
		} catch (Exception e) {
			return ServerResponse.buildErrorMsg("添加问卷类别失败！");
		}
		return ServerResponse.buildSuccessMsg("添加问卷类别成功！");
	}

	// 展现题库
	@RequiresRoles("admin")
	@DeleteMapping("/delete/{id}")
    @ResponseBody
	public ServerResponse delete(@PathVariable("id") String id,HttpSession session) {
		String username =(String) session.getAttribute("username");
		if (StringUtils.isEmpty(username)){
			return ServerResponse.buildErrorMsg("请登录");
		}
		try {
			questtypeMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			return ServerResponse.buildErrorMsg("删除失败！");
		}
		return ServerResponse.buildSuccessMsg("删除成功！");
	}

	@RequiresRoles("admin")
    @ResponseBody
	@PostMapping("/update")
	public ServerResponse update(QuestTypeDTO dto) {
		try {
			questtypeMapper.updateByPrimaryKeySelective(dto);
		}catch (Exception e) {
			return ServerResponse.buildErrorMsg("修改失败！");
		}
		return ServerResponse.buildSuccessMsg("修改成功！");
	}

    @GetMapping("/getById/{id}")
    @ResponseBody
    @RequiresRoles("admin")
    public ServerResponse findById(@PathVariable String id, HttpSession session){
        String username =(String) session.getAttribute("username");
        if (StringUtils.isEmpty(username)){
            return ServerResponse.buildErrorMsg("请登录");
        }
        return ServerResponse.buildSuccessData(questtypeMapper.selectByPrimaryKey(id));
    }

    @RequiresRoles("admin")
    @GetMapping("/manager")
    public String show(Model model) {
        model.addAttribute("questtype", questtypeService.selectBySearch("", 1, 5));
        return "manage/questtype";
    }


    @GetMapping("/manager/findByPage")
    @ResponseBody
    public ServerResponse findByPage(@RequestParam(value = "condition", required = false) String condition,
                                     @RequestParam(value = "pageIndex", defaultValue = "1", required = false) int pageIndex,
                                     @RequestParam(value = "pageSize", defaultValue = "5", required = false) int pageSize) {
        if (StringUtils.isEmpty(condition)) {
            condition = null;
        }
        //0代表无限制
        return ServerResponse.buildSuccessData(questtypeService.selectBySearch(condition, pageIndex, pageSize));

    }

}
