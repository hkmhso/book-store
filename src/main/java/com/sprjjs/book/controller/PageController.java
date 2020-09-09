package com.sprjjs.book.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.sprjjs.book.utils.PrintUtil;
import com.sprjjs.book.utils.SessionAttributeUtil;
import org.springframework.web.context.request.RequestAttributes;

@Controller
@RequestMapping("/")
public class PageController {
	
	/**
	 * 欢迎页
	 * @return
	 */
	@RequestMapping("")
	public String welcome(){
		//跳到查询所有图书信息的控制器，以便于在页面渲染出来
		return "forward:/book/showPage.action";
	}
	
	/**
	 * 跳到WEB-INF目录下的页面
	 * @param html 页面
	 * @param referer 上一个页面url
	 * @return
	 */
	@RequestMapping("{html}")
	public String htmlAction(@PathVariable String html,@RequestHeader("Referer") String referer,HttpSession session){
		if(!html.trim().equalsIgnoreCase("favicon.ico")){
			//将Referer属性值放到session作用域中
			SessionAttributeUtil.setAttribute(session, "referer", referer);
			PrintUtil.print(this.getClass(), "->>htmlAction()->>"+html);
			if(html.trim().equalsIgnoreCase("chooseRole.html")){
				return "chooseRole";
			}else if(html.trim().equalsIgnoreCase("400.html")){
				return "error/400";
			}else if(html.trim().equalsIgnoreCase("404.html")){
				return "error/404";
			}else if(html.trim().equalsIgnoreCase("500.html")){
				return "error/500";
			}
			return "redirect:/";
		}
		return "redirect:/";
	}

}
