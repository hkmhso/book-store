package com.sprjjs.book.test;
import javax.annotation.Resource;

import com.sprjjs.book.service.TCollectionService;
import com.sprjjs.book.service.TUserService;
import com.sprjjs.book.mapper.TOitemMapper;
import com.sprjjs.book.pojo.TOitemExample;
import com.sprjjs.book.pojo.TUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//会自动根据配置创建Spring容器，无需 new ClassPathXmlApplicationContext("spring-config.xml")  手动创建
@RunWith(SpringJUnit4ClassRunner.class)
//指定spring配置文件的路径
@ContextConfiguration(locations={"classpath:spring/applicationContext.xml"})
public class TestSpring {
	@Resource
	private TUserService tUserServiceImpl;
	@Resource
	private TOitemMapper tOitemMapper;
	@Resource
	private TCollectionService tCollectionServiceImpl;

	@Test
	public void test1() {
		TUser tUser = new TUser();
		tUser.setUname("黄柯铭3");
		tUser.setUpwd("0000");
		TUser login = tUserServiceImpl.login(tUser);
		System.out.println(login);
	}
	@Test
	public void test2(){
		//加载applicationContext.xml文件
		ClassPathXmlApplicationContext context= new ClassPathXmlApplicationContext("spring/applicationContext.xml");
		//获取spring管理的所有对象的标识(也就是bean的id)
		String[] beanDefinitionNames = context.getBeanDefinitionNames();
		for (String string : beanDefinitionNames) {
			System.out.println(string);
		}
	}
	@Test
	public void test3(){
		TOitemExample example=new TOitemExample();
		example.createCriteria().andOidEqualTo("31020200428174700");
		System.out.println(tOitemMapper.countByExample(example));
	}
	@Test
	public void test4(){
		tCollectionServiceImpl.showPage(1, 2,"12312312310");
	}
	@Test
	public void test5(){
		TUser admin = tUserServiceImpl.selByName("admin");
		System.out.println(admin);
	}

}
